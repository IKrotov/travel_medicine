package com.infections.services;

import com.infections.model.*;
import com.infections.repos.CountryRepository;
import com.sun.xml.bind.v2.runtime.unmarshaller.Patcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
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

       country.setHealth(new Health(replaceBreak(healthText)));

       countryRepository.save(country);
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

    public void addCountry(String countryName, MultipartFile flagFileName, MultipartFile mapFileName) {

        Country country = new Country(countryName);

        if (flagFileName != null && !flagFileName.getOriginalFilename().isEmpty()){

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String resultFileName = getFullFileName(flagFileName);

            try {
                flagFileName.transferTo(new File(uploadPath + "/" + resultFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            country.setFlagFileName(resultFileName);
        }

        if (mapFileName != null && !mapFileName.getOriginalFilename().isEmpty()){

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String resultFileName = getFullFileName(mapFileName);

            try {
                flagFileName.transferTo(new File(uploadPath + "/" + resultFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            country.setMapFileName(resultFileName);
        }

        countryRepository.save(country);


    }

    private String getFullFileName(MultipartFile file){
        String uuidFile = UUID.randomUUID().toString();

        return uuidFile + "." + file.getOriginalFilename();
    }

    private String replaceBreak(String text){
        return Pattern.compile("\r\n").matcher(text).replaceAll("<br/>");
    }


    public void deleteCountry(int countryId) {

        Country country = countryRepository.findById(countryId).orElse(null);
        if (country != null) {
            if (country.getMapFileName() != null){
                File mapFile = new File(uploadPath + "/" + country.getMapFileName());
                mapFile.delete();
            }
            if (country.getFlagFileName() != null){
                File flagFile = new File(uploadPath + "/" + country.getFlagFileName());
                flagFile.delete();

            }
            countryRepository.delete(country);

        }

    }
}
