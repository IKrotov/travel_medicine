package com.infections.storage;

import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.WriteMode;
import com.dropbox.core.v2.sharing.SharedLinkMetadata;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;

public class DropBoxManager implements StorageManager{

    private static final String ACCESS_TOKEN = "RPYuMzMMGosAAAAAAAAAAaICzQgjSC3lc6IhrD2W2ILvx7diRI5kREktT3UENDpq";
    private DbxRequestConfig config = DbxRequestConfig.newBuilder("dropbox/java-tutorial").build();
    private DbxClientV2 client = new DbxClientV2(config, ACCESS_TOKEN);

    @Override
    public  String saveFileToStorage(MultipartFile file, String fileName) {

        String url = null;

            try {

                ByteArrayOutputStream os = new ByteArrayOutputStream();
                os.write(file.getBytes());
                InputStream in = new ByteArrayInputStream(os.toByteArray());

                client.files().uploadBuilder("/img/" + fileName).withMode(WriteMode.OVERWRITE).uploadAndFinish(in);
                SharedLinkMetadata meta = client.sharing().createSharedLinkWithSettings("/img/" + fileName);
                url = meta.getUrl();
                url = url.split("\\?")[0];
                url = url + "\\?raw=1";

                System.out.println(url);

            } catch (DbxException | IOException e) {
                e.printStackTrace();
            }

        return  url;
    }

    @Override
    public boolean deleteFromStorage(String fileName) {
        try {
            client.files().delete("/img/" + fileName);
        } catch (DbxException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public String getUUIDFileName(MultipartFile file) {
        String uuidFile = UUID.randomUUID().toString();
        return uuidFile + "." + file.getOriginalFilename();
    }
}
