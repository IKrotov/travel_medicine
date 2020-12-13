package com.infections.storage;

import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.UploadErrorException;
import com.dropbox.core.v2.files.WriteMode;
import com.dropbox.core.v2.sharing.CreateSharedLinkWithSettingsErrorException;
import com.dropbox.core.v2.sharing.SharedLinkMetadata;
import com.infections.utils.PdfGenerator;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;
import java.util.regex.Pattern;

public class DropBoxManager implements StorageManager{

    private static final String ACCESS_TOKEN = "RPYuMzMMGosAAAAAAAAAAaICzQgjSC3lc6IhrD2W2ILvx7diRI5kREktT3UENDpq";
    private DbxRequestConfig config = DbxRequestConfig.newBuilder("dropbox/java-tutorial").build();
    private DbxClientV2 client = new DbxClientV2(config, ACCESS_TOKEN);

    @Override
    public  String saveFileToStorage(MultipartFile file, String fileName, String folder) {

        String url = null;

            try {

                ByteArrayOutputStream os = new ByteArrayOutputStream();
                os.write(file.getBytes());
                InputStream in = new ByteArrayInputStream(os.toByteArray());

                client.files().uploadBuilder(folder + fileName).withMode(WriteMode.OVERWRITE).uploadAndFinish(in);
                SharedLinkMetadata meta = client.sharing().createSharedLinkWithSettings(folder + fileName);
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
    public boolean deleteFromStorage(String fileName, String folder) {
        try {
            client.files().delete(folder + fileName);
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
    private String getUUIDFileName(String fileName) {
        String uuidFile = UUID.randomUUID().toString();
        return uuidFile + "." + fileName;
    }

    public String generatePdfAndSaveToDropBox(String fileName, String text, String countryName){
//        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
//        String url = null;
//
//        try {
//
//            String countryName = "TEst";
//
//            BaseFont bf_russian = BaseFont.createFont(
//                    "./src/main/resources/fonts/FreeSans.ttf",
//                    "CP1251",
//                    BaseFont.EMBEDDED);
//            Font russian = new Font(bf_russian, 12);
//
//            BaseFont bf = BaseFont.createFont("./src/main/resources/fonts/arialbd.ttf",
//                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
//
//            Font arialbd = new Font(bf, 26);
//            Font arialVeryBig = new Font(bf, 40);
//
//            ByteArrayOutputStream os = new ByteArrayOutputStream();
//
//            PdfWriter pdfWriter = PdfWriter.getInstance(document,
//                    os);
//
//
//            document.open();
//
//            String[] lines = text.split("\r\n");
//
//            Anchor anchorTarget = new Anchor("Аптечка " + countryName + ".", arialbd);
//            anchorTarget.setName("BackToTop");
//            Paragraph paragraph1 = new Paragraph();
//
//            paragraph1.setSpacingBefore(50);
//
//            paragraph1.add(anchorTarget);
//            document.add(paragraph1);
//
//            Paragraph mainParagraph = new Paragraph();
//            mainParagraph.setLeading(35.0f);
//
//            for (String line: lines){
//
//                mainParagraph.setFont(arialVeryBig);
//                mainParagraph.add("\u25A1");
//                mainParagraph.setFont(russian);
//                mainParagraph.add(Pattern.compile("--").matcher(line).replaceAll(""));
//                mainParagraph.add("\r\n");
//            }
//
//            document.add(mainParagraph);
//
//            document.close();
//
//            InputStream in = new ByteArrayInputStream(os.toByteArray());
        String folder = "/pdf/";
        String url;
        try {
            PdfGenerator pdfGenerator = new PdfGenerator();
            InputStream in = pdfGenerator.generateFile(fileName, text, countryName);
            String resFileName = getUUIDFileName(fileName);

                client.files().uploadBuilder(folder + resFileName).withMode(WriteMode.OVERWRITE).uploadAndFinish(in);
                SharedLinkMetadata meta = client.sharing().createSharedLinkWithSettings(folder + resFileName);
                url = meta.getUrl();
                url = url.split("\\?")[0];
                url = url + "\\?raw=1";

                System.out.println(url);

        } catch (IOException | DbxException e) {
            e.printStackTrace();
            return null;
        }
        return url;
    }

    public ByteArrayOutputStream downloadPdf(String fileName){

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        try {
            FileMetadata metadata = client.files()
                    .downloadBuilder("/pdf/" + fileName)
                    .download(outputStream);
            return outputStream;
        } catch (DbxException | IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
