package com.infections.services;

import com.infections.model.*;
import com.infections.repos.CountryRepository;
import com.infections.storage.DropBoxManager;
import com.infections.storage.StorageManager;
import com.infections.utils.PdfGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

@Service
@Transactional
public class CountryService {

    @Autowired
    private CountryRepository countryRepository;

    @Value("${upload.path}")
    private String uploadPath;

    private StorageManager storageManager = new DropBoxManager();

    public List<Country> getAllCountry(){
        return countryRepository.findAll();
    }

    public Country getCountry(int id){

       return countryRepository.findById(id).orElse(null);
    }

    public void addVaccineToCountry(int id, Vaccine vaccine){

        Country country = countryRepository.findById(id).get();

        country.addVaccine(vaccine);
        countryRepository.save(country);
    }

    public void addDiseases(int id, OtherDiseases otherDiseases){
        Country country = countryRepository.findById(id).get();

        country.addDiseases(otherDiseases);
        countryRepository.save(country);
    }

    public void deleteVaccine(int countryId, int vaccineId){

        Country country = countryRepository.findById(countryId).get();

        for (Vaccine vaccine :country.getVaccines()){
            if (vaccine.getId() == vaccineId){
                country.deleteVaccine(vaccine);
            }
        }
        countryRepository.save(country);
    }

    public void deleteDiseases(int countryId, int diseasesId){

        Country country = countryRepository.findById(countryId).get();

        for (OtherDiseases diseases :country.getOtherDiseasesSet()){
            if (diseases.getId() == diseasesId){
                country.deleteDiseases(diseases);
            }
        }
        countryRepository.save(country);
    }

    public void setPrevention(int countryId, String preventionText){

        Country country = countryRepository.findById(countryId).get();

        country.setPrevention(new Prevention(replaceBreak(preventionText)));

        countryRepository.save(country);
    }

    public void setHealth(int countryId, String healthText){
       Country country = countryRepository.findById(countryId).get();

        PdfGenerator pdfGenerator = new PdfGenerator();

        String pdfFileName = country.getCountryName() + ".pdf";
        String text = parseHealthList(healthText);

        if (pdfGenerator.generateFile(pdfFileName, healthText, country.getCountryName())){
            Health health = new Health(text);
            health.setFile(new UploadFile(country.getCountryName() + ".pdf"));
            country.setHealth(health);
            countryRepository.save(country);
        }


    }

    public void setAfterTrip(int countryId, String afterTripText){
        Country country = countryRepository.findById(countryId).get();

        country.setAfterTheTrip(new AfterTheTrip(replaceBreak(afterTripText)));

        countryRepository.save(country);
    }

    public void setListOfReferencesText(int countryId, String listOfReferencesText) {
        Country country = countryRepository.findById(countryId).get();

        country.setAfterTheTrip(new AfterTheTrip(replaceBreak(listOfReferencesText)));

        countryRepository.save(country);
    }

    public void addCountry(String countryName, MultipartFile flagFile, MultipartFile memoFile, String map) {

        Country country = new Country(countryName);

        String url;
        String fileName;

        if (flagFile != null && !flagFile.getOriginalFilename().isEmpty()) {

            fileName = storageManager.getUUIDFileName(flagFile);
            url = storageManager.saveFileToStorage(flagFile, fileName);

            country.setFlag(new UploadFile(fileName, url));
        }

        if (memoFile != null && !memoFile.getOriginalFilename().isEmpty()) {

            fileName = storageManager.getUUIDFileName(memoFile);
            url = storageManager.saveFileToStorage(memoFile, fileName);

            country.setMemoFile(new UploadFile(fileName, url));
        }

        if (!StringUtils.isEmpty(map)){
            country.setGoogleMap(map);
        }

        countryRepository.save(country);

    }

    public void deleteCountry(int countryId) {

        Country country = countryRepository.findById(countryId).orElse(null);
        if (country != null) {

            if (country.getFlag() != null) {
                storageManager.deleteFromStorage(country.getFlag().getFileName());
            }
            if (country.getMemoFile() != null){
                storageManager.deleteFromStorage(country.getMemoFile().getFileName());
            }

            countryRepository.delete(country);

        }
    }


    private String getFullFileName(MultipartFile file){
        String uuidFile = UUID.randomUUID().toString();

        return uuidFile + "." + file.getOriginalFilename();
    }

    private String replaceBreak(String text){
        return Pattern.compile("\r\n").matcher(text).replaceAll("<br/>");
    }

    private String parseHealthList(String text){
        String textWithSymbols;
        textWithSymbols = Pattern.compile("--").matcher(text).replaceAll("&#10004;");
        return replaceBreak(textWithSymbols);
    }

}
