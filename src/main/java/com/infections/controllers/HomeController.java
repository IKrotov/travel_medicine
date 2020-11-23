package com.infections.controllers;

import com.infections.model.Message;
import com.infections.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/")
    public String homePage(Model model){
        List<Message> messages = messageService.getLastMessages();
        model.addAttribute("messages", messages);
        return "home";
    }

}
