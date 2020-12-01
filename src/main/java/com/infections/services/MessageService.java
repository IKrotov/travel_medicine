package com.infections.services;

import com.infections.model.Message;
import com.infections.model.UploadFile;
import com.infections.repos.MessageRepository;
import com.infections.storage.DropBoxManager;
import com.infections.storage.StorageManager;
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

//    @Value("${upload.path}")
//    private String uploadPath;

    private StorageManager storageManager = new DropBoxManager();

    public List<Message> getAllMessages(){
        return messageRepository.findAll();
    }

    public void addMessage(Message message, MultipartFile file){

        if (file != null && !file.getOriginalFilename().isEmpty()){

            String fileName = storageManager.getUUIDFileName(file);
            String url = storageManager.saveFileToStorage(file, fileName);
            message.setFile(new UploadFile(fileName, url));
        }

        messageRepository.save(message);

    }

    public boolean deleteMessage(Long messageId) {
        Message message = messageRepository.findById(messageId).orElse(null);
        if (message != null) {
            if (storageManager.deleteFromStorage(message.getFile().getFileName())) {
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

    public List<Message> getCountryMessages(String filter) {

        return messageRepository.findByCountryName(filter);
    }
}
