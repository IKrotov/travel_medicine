package com.infections.controllers;

import com.infections.model.Continent;
import com.infections.model.Message;
import com.infections.model.OtherDiseases;
import com.infections.model.Vaccine;
import com.infections.services.CountryService;
import com.infections.services.MessageService;
import com.infections.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Controller
@RequestMapping("/admin")
//@PreAuthorize("hasAnyAuthority('ADMIN')")
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private CountryService countryService;

    @GetMapping
    public String getAllEntities(Model model){
        model.addAttribute("allUsers", userService.findAllUsers());
        model.addAttribute("messages", messageService.getAllMessages());
        model.addAttribute("allCountry", countryService.getAllCountry());

        model.addAttribute("continents", Continent.values());
        return "admin";
    }

    @PostMapping
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

    @PostMapping("/deleteMsg")
    public String deleteMessage(@RequestParam(required = true, defaultValue = "") Long messageId,
                                @RequestParam(required = true, defaultValue = "") String action,
                                Model model){
        if (action.equals("delete")){
            messageService.deleteMessage(messageId);
        }
        return "redirect:/admin";
    }

    @PostMapping("/addMessage")
    public String addMessage(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                             @RequestParam String countryName,
                             @RequestParam Continent continent,
                             @RequestParam String header,
                             @RequestParam String text,
                             @RequestParam("file") MultipartFile file,
                             Model model){


        messageService.addMessage(new Message(text, header, date, countryName, continent), file);

        model.addAttribute("allUsers", userService.findAllUsers());
        model.addAttribute("messages", messageService.getAllMessages());
        model.addAttribute("allCountry", countryService.getAllCountry());
        model.addAttribute("continents", Continent.values());

        return "admin";
    }

    @PostMapping("/country/vaccine")
    public String addVaccineToCountry(@RequestParam int countryId,
                                      @RequestParam String vacName,
                                      @RequestParam String recommendation,
                                      @RequestParam String transmission,
                                      @RequestParam String url, Model model){
        Vaccine vaccine = new Vaccine(vacName, recommendation, transmission, url);
        countryService.addVaccineToCountry(countryId, vaccine);

        return "redirect:/admin";
    }

    @PostMapping("country/vaccine/{vaccineId}")
    public String deleteVaccine(@PathVariable int vaccineId, @RequestParam int countryId){

        countryService.deleteVaccine(countryId, vaccineId);

        return "redirect:/admin";
    }

    @PostMapping("country/diseases")
    public String addDisease(@RequestParam int countryId,
                             @RequestParam String disName,
                             @RequestParam String prevention,
                             @RequestParam String comment,
                             @RequestParam String url, Model model){

        OtherDiseases otherDiseases = new OtherDiseases(disName, prevention, comment, url);

        countryService.addDiseases(countryId, otherDiseases);

        return "redirect:/admin";
    }

    @PostMapping("country/diseases/{diseasesId}")
    public String deleteDiseases(@RequestParam int countryId, @PathVariable int diseasesId){

        countryService.deleteDiseases(countryId, diseasesId);

        return "redirect:/admin";
    }

    @PostMapping("country/prevention")
    public String setPrevention(@RequestParam int countryId,
                                @RequestParam String preventionText, Model model){

        countryService.setPrevention(countryId, preventionText);

        return "redirect:/admin";
    }

    @PostMapping("country/health")
    public String setHealth(@RequestParam int countryId,
                            @RequestParam String healthText, Model model){
        countryService.setHealth(countryId, healthText);

        return "redirect:/admin";
    }

    @PostMapping("country/afterTrip")
    public String setAfterTrip(@RequestParam int countryId,
                               @RequestParam String afterTripText, Model model){
        countryService.setAfterTrip(countryId, afterTripText);

        return "redirect:/admin";
    }

    @PostMapping("country/refList")
    public String setRefList(@RequestParam int countryId,
                             @RequestParam String listOfReferencesText, Model model){

        countryService.setListOfReferencesText(countryId, listOfReferencesText);

        return "redirect:/admin";
    }

    @PostMapping("addCountry")
    public String addCountry(@RequestParam String countryName,
                             @RequestParam("flagFileName") MultipartFile flagFileName,
                             @RequestParam("memoFileName") MultipartFile memoFileName,
                             @RequestParam("map") String map){

        countryService.addCountry(countryName, flagFileName, memoFileName, map);

        return "redirect:/admin";
    }

    @GetMapping("editMsg/{messageId}")
    public String editMessage(@PathVariable long messageId, Model model){

        Message message = messageService.getCurrentMessage(messageId);

        model.addAttribute("message", message);
        model.addAttribute("continents", Continent.values());

        return "messageEditor";
    }

    @PostMapping("editMsg/{messageId}")
    public String editMessage(@PathVariable long messageId,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                              @RequestParam String countryName,
                              @RequestParam Continent continent,
                              @RequestParam String header,
                              @RequestParam String text,
                              @RequestParam("file") MultipartFile file, Model model){

        Message message = messageService.getCurrentMessage(messageId);
        message.setCountryName(countryName);
        message.setContinent(continent);
        message.setHeader(header);
        message.setText(text);
        messageService.saveMessage(message);

        return "redirect:/admin";
    }

    @PostMapping("deleteCountry")
    public String deleteCountry(@RequestParam int countryId){

        countryService.deleteCountry(countryId);

        return "redirect:/admin";
    }
}
