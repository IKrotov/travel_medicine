package com.infections.utils;

import com.infections.storage.DropBoxManager;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.*;
import java.util.regex.Pattern;

public class PdfGenerator {

    public InputStream generateFile(String filename, String text, String countryName){
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);

        try {

            BaseFont bf_russian = BaseFont.createFont(
                    "./src/main/resources/fonts/FreeSans.ttf",
                    "CP1251",
                    BaseFont.EMBEDDED);
            Font russian = new Font(bf_russian, 12);

            BaseFont bf = BaseFont.createFont("./src/main/resources/fonts/arialbd.ttf",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            Font arialbd = new Font(bf, 26);
            Font arialVeryBig = new Font(bf, 40);
            ByteArrayOutputStream os = new ByteArrayOutputStream();

            PdfWriter pdfWriter = PdfWriter.getInstance(document,
                    os);

            document.open();

            String[] lines = text.split("\r\n");

            Anchor anchorTarget = new Anchor("Аптечка " + countryName + ".", arialbd);
            anchorTarget.setName("BackToTop");
            Paragraph paragraph1 = new Paragraph();

            paragraph1.setSpacingBefore(50);

            paragraph1.add(anchorTarget);
            document.add(paragraph1);

            Paragraph mainParagraph = new Paragraph();
            mainParagraph.setLeading(35.0f);

            for (String line: lines){

                mainParagraph.setFont(arialVeryBig);
                mainParagraph.add("\u25A1");
                mainParagraph.setFont(russian);
                mainParagraph.add(Pattern.compile("--").matcher(line).replaceAll(""));
                mainParagraph.add("\r\n");
            }

            document.add(mainParagraph);

            document.close();

            return new ByteArrayInputStream(os.toByteArray());

        } catch (DocumentException | IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
