package com.infections.storage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class FileStorageManager implements StorageManager {

    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public String saveFileToStorage(MultipartFile file, String fileName, String folder) {
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()){
            uploadDir.mkdir();
        }

        String uuidFile = UUID.randomUUID().toString();
        String resultFileName = uuidFile + "." + fileName;

        try {
            file.transferTo(new File(uploadPath + "/" + resultFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return resultFileName;
    }

    @Override
    public boolean deleteFromStorage(String filename, String folder) {
        File file = new File(uploadPath + "/" + filename);
        return  file.delete();
    }

    @Override
    public String getUUIDFileName(MultipartFile file) {
        return null;
    }
}
