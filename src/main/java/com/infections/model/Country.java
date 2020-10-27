package com.infections.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String countryName;
    private String flagFileName;
    private String mapFileName;

    public Country(String countryName, String flagFileName, String mapFileName) {
        this.countryName = countryName;
        this.flagFileName = flagFileName;
        this.mapFileName = mapFileName;
    }
    public Country(){};

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String name) {
        this.countryName = name;
    }

    public String getFlagFileName() {
        return flagFileName;
    }

    public void setFlagFileName(String flagFileName) {
        this.flagFileName = flagFileName;
    }

    public String getMapFileName() {
        return mapFileName;
    }

    public void setMapFileName(String mapFileName) {
        this.mapFileName = mapFileName;
    }
}