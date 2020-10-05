package com.infections.controllers;

import com.infections.model.Message;
import com.infections.repos.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GreetingController {

    @Autowired
    MessageRepository messageRepository;

    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World!") String name, Model model){

        model.addAttribute("name", name);
        return "greeting";

    }

    @PostMapping("/addUser")
    public String addMessage(@RequestParam String text, @RequestParam String tag, Model model){

        Message message = new Message(text, tag);
        messageRepository.save(message);
       model.addAttribute("messages", messageRepository.findAll());
        return "messages";
    }

}
