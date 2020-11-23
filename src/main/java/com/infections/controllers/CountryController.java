package com.infections.controllers;

import com.infections.model.Country;
import com.infections.services.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Comparator;
import java.util.List;

@Controller
public class CountryController {

    @Autowired
    private CountryService countryService;

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
}
