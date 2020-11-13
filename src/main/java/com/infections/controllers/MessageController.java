package com.infections.controllers;

import com.infections.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/messages/{messageId}")
    public String getCurrentMessage(@PathVariable long messageId, Model model){

        model.addAttribute("message", messageService.getCurrentMessage(messageId));

        return "message";
    }


}
