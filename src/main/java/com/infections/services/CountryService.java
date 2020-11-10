package com.infections.services;

import com.infections.model.Country;
import com.infections.model.OtherDiseases;
import com.infections.model.Vaccine;
import com.infections.repos.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
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


}
