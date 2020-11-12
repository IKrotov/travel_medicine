package com.infections.services;

import com.infections.model.*;
import com.infections.repos.CountryRepository;
import com.sun.xml.bind.v2.runtime.unmarshaller.Patcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.regex.Pattern;

@Service
@Transactional
public class CountryService {

    @Autowired
    private CountryRepository countryRepository;

    public void saveCountry(Country country){
        countryRepository.save(country);
    }

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


    private String replaceBreak(String text){
        return Pattern.compile("\r\n").matcher(text).replaceAll("<br/>");
    }

}
