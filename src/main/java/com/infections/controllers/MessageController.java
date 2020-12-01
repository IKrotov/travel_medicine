package com.infections.controllers;

import com.infections.model.Message;
import com.infections.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/messages/{messageId}")
    public String getCurrentMessage(@PathVariable long messageId, Model model){

        model.addAttribute("message", messageService.getCurrentMessage(messageId));

        return "message";
    }

    @GetMapping("/messages")
    public String getAllMessages(@RequestParam (required = false, defaultValue = "") String filter, Model model){
        List<Message> messages;
        if (filter != null && !filter.isEmpty()){
           messages = messageService.getCountryMessages(filter);
        } else {
            messages = messageService.getAllMessages();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "messages";
    }


}
