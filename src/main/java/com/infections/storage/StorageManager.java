package com.infections.storage;

import org.springframework.web.multipart.MultipartFile;

public interface StorageManager {

     String saveFileToStorage(MultipartFile file, String filename, String folder);

     boolean deleteFromStorage(String fileName, String folder);

     String getUUIDFileName(MultipartFile file);
}
