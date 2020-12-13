package com.infections.controllers;

import com.infections.model.Country;
import com.infections.services.CountryService;
import com.infections.storage.DropBoxManager;
import com.infections.utils.MediaTypeUtils;
import com.infections.utils.PdfGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.List;

@Controller
public class CountryController {

    @Autowired
    private CountryService countryService;

    @Autowired
    private ServletContext servletContext;

    @GetMapping("/country")
    public String getCountry(Model model){

        List<Country> countries = countryService.getAllCountry();

        countries.sort(Comparator.comparing(Country::getCountryName));

        model.addAttribute("allCountry", countries);

        return "country";
    }

    @GetMapping("/country/{id}")
    public String getCurCountry(Model model, @PathVariable int id){

        model.addAttribute("country", countryService.getCountry(id));

        return "curcountry";
    }


    @GetMapping("/country/getPDF/{countryId}")
    public ResponseEntity<ByteArrayResource> downloadFile2(@PathVariable int countryId) throws IOException {

        Country country = countryService.getCountry(countryId);

        String fileName = country.getHealth().getFile().getFileName();
        String url = country.getHealth().getFile().getUrl();

        MediaType mediaType = MediaTypeUtils.getMediaTypeForFileName(this.servletContext, fileName);

        //Path path = Paths.get(url);
        //byte[] data = Files.readAllBytes(path);
        DropBoxManager dropBoxManager = new DropBoxManager();
        byte[] data = dropBoxManager.downloadPdf(fileName).toByteArray();
        ByteArrayResource resource = new ByteArrayResource(data);

        return ResponseEntity.ok()
                // Content-Disposition
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + fileName)
                // Content-Type
                .contentType(mediaType) //
                // Content-Lengh
                .contentLength(data.length) //
                .body(resource);
    }
}
