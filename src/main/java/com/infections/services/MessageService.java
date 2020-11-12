package com.infections.services;

import com.infections.model.Message;
import com.infections.repos.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public void saveMessage(Message message){
        messageRepository.save(message);
    }

    public List<Message> getAllMessages(){
        return messageRepository.findAll();
    }

    public boolean deleteMessage(Long messageId) {
        if (messageRepository.findById(messageId).isPresent()) {
            messageRepository.deleteById(messageId);
            return true;
        }
        return false;
    }

    public List<Message> getLastMessages(){
        return messageRepository.findLast3Messages();
    }
}
