package com.infections.controllers;

import com.infections.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;


    @GetMapping("/profile")
    public String getProfile(Model model){

        return "profile";
    }

    @PostMapping("/profile/changePassword")
    public String changePassword(@RequestParam long userId,
                                 @RequestParam String password){

        userService.changePassword(userId, password);

        return "redirect:/profile";
    }

    @PostMapping("/profile/changeUsername")
    public String changeUsername(@RequestParam long userId,
                                 @RequestParam String username,
                                 Model model){


        boolean isChanged = userService.changeUsername(userId, username);

        if (!isChanged){
            model.addAttribute("status", "Пользователь с таким именем уже существует");
        } else {
            model.addAttribute("status", "Имя пользователя изменено");
        }

        return "profile";
    }

    @PostMapping("/profile/changeEmail")
    public String changeEmail(@RequestParam long userId,
                                 @RequestParam String email, Model model){

        boolean isChanged = userService.changeEmail(userId, email);

        if (!isChanged){
            model.addAttribute("status", "Пользователь с таким email уже существует");
        }

        return "redirect:/profile";
    }
}
