package com.infections.services;

import com.infections.model.Country;
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
}
