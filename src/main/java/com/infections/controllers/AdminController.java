package com.infections.controllers;

import com.infections.model.Message;
import com.infections.model.Vaccine;
import com.infections.services.CountryService;
import com.infections.services.MessageService;
import com.infections.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private CountryService countryService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/admin")
    public String getAllEntities(Model model){
        model.addAttribute("allUsers", userService.findAllUsers());
        model.addAttribute("messages", messageService.getAllMessages());
        model.addAttribute("allCountry", countryService.getAllCountry());
        return "admin";
    }

    @PostMapping("/admin")
    public String deleteUser(@RequestParam(required = true, defaultValue = "") Long userId,
                             @RequestParam(required = true, defaultValue = "") String action,
                             Model model){
        if (action.equals("delete")){
            userService.deleteUser(userId);
        } else if (action.equals("setAdminRole")){
           userService.changeUserAdminRole(userId);
        }
        return "redirect:/admin";
    }

    @PostMapping("/admin/deleteMsg")
    public String deleteMessage(@RequestParam(required = true, defaultValue = "") Long messageId,
                                @RequestParam(required = true, defaultValue = "") String action,
                                Model model){
        if (action.equals("delete")){
            messageService.deleteMessage(messageId);
        }
        return "redirect:/admin";
    }

    @PostMapping("admin/addMessage")
    public String addMessage(@RequestParam String text,
                             @RequestParam String header,
                             @RequestParam("file") MultipartFile file) throws IOException {


        Message message = new Message(text, header);

        if (file != null){

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            message.setFileName(resultFileName);

        }
        messageService.saveMessage(message);

        return "redirect:/admin";
    }

    // !!!!!!
    @PostMapping("admin/country")
    public String chooseCountry(@RequestParam int countryId, Model model){
        model.addAttribute("currentCountry", countryService.getCountry(countryId));

        return "redirect:/admin#country";
    }

    @PostMapping("admin/country/vaccine")
    public String addVaccineToCountry(@RequestParam int countryId,
                                      @RequestParam String vacName,
                                      @RequestParam String recommendation,
                                      @RequestParam String transmission, Model model){
        Vaccine vaccine = new Vaccine(vacName, recommendation, transmission);
        countryService.addVaccineToCountry(countryId, vaccine);

        return "redirect:/admin";
    }

//    @GetMapping("/admin/gt/{userId}")
//    public String gtUser(@PathVariable("userId") Long userId, Model model){
//        model.addAttribute("allUsers", userService.findUserById(userId));
//        return "admin";
//    }
}
