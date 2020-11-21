package com.infections.services;

import com.infections.model.Message;
import com.infections.repos.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public void saveMessage(Message message){
        messageRepository.save(message);
    }

    public List<Message> getAllMessages(){
        return messageRepository.findAll();
    }

    public void addMessage(String title, String text, MultipartFile file){

        Message message = new Message(text, title);

        if (file != null && !file.getOriginalFilename().isEmpty()){

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            try {
                file.transferTo(new File(uploadPath + "/" + resultFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            message.setFileName(resultFileName);
        }

        messageRepository.save(message);

    }

    public boolean deleteMessage(Long messageId) {
        Message message = messageRepository.findById(messageId).orElse(null);
        if (message != null) {
            File file = new File(uploadPath + "/" + message.getFileName());
            if (file.delete()) {
                messageRepository.deleteById(messageId);
                return true;
            }
        }
        return false;
    }

    public Message getCurrentMessage(long id){
        return messageRepository.findById(id);
    }

    public List<Message> getLastMessages(){
        return messageRepository.findLast3Messages();
    }
}
