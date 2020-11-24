package com.infections.controllers;

import com.infections.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
                                 @RequestParam String password,
                                 @RequestParam String passwordConfirm,
                                 Model model){

        if (StringUtils.isEmpty(password)){
            model.addAttribute("passwordError", "Пароль не может быть пустым");
            return "profile";
        }

        if (!password.equals(passwordConfirm)){
            model.addAttribute("passwordConfirmError", "Пароли не совпадают");
            return "profile";
        }

        userService.changePassword(userId, password);

        return "redirect:/profile";
    }

    @PostMapping("/profile/changeUsername")
    public String changeUsername(@RequestParam String username,
                                 Model model,
                                 @RequestParam long userId){

        if (StringUtils.isEmpty(username)){
           model.addAttribute("usernameError", "Имя пользователя не может быть пустым");
            return "profile";
        }

        boolean isChanged = userService.changeUsername(userId, username);

        if (!isChanged){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
        } else {
            model.addAttribute("status", "Имя пользователя изменено");
        }

        return "profile";
    }

    @PostMapping("/profile/changeEmail")
    public String changeEmail(@RequestParam long userId,
                                 @RequestParam String email, Model model){

        if (StringUtils.isEmpty(email)){
            model.addAttribute("emailError", "Email не может быть пустым");
            return "profile";
        }

        boolean isChanged = userService.changeEmail(userId, email);

        if (!isChanged){
            model.addAttribute("emailError", "Пользователь с таким email уже существует");
        }

        return "profile";
    }
}
