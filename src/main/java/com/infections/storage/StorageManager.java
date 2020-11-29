package com.infections.storage;

import org.springframework.web.multipart.MultipartFile;

public interface StorageManager {

     String saveFileToStorage(MultipartFile file, String filename);

     boolean deleteFromStorage(String fileName);

     String getUUIDFileName(MultipartFile file);
}
