package com.infections.controllers;

import com.infections.model.User;
import com.infections.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    UserService userService;

    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User userForm, BindingResult bindingResult, Model model) {

        if (userForm.getPassword() != null && !userForm.getPassword().equals(userForm.getPasswordConfirm())){
            model.addAttribute("passwordError", "Пароли не совпадают");
        }

        if (bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getBindingErrorsMap(bindingResult);
            model.mergeAttributes(errorsMap);
            return "registration";
        }

        if (!userService.saveUser(userForm)){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "registration";
        }

            return "redirect:/";

    }

    @GetMapping("/active/{code}")
    public String activate(@PathVariable String code, Model model){

        boolean isActivated = userService.activateUser(code);

        if (isActivated){
            model.addAttribute("message", "Аккаунт активирован");

        } else {
            model.addAttribute("message", "Ошибка активации");
        }

        return "activepage";
    }
}
