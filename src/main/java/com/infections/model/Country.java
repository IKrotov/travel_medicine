package com.infections.model;

import javax.persistence.*;
import java.util.Objects;
import java.util.Set;

@Entity
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String countryName;
    private String flagFileName;
    private String mapFileName;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Set<Vaccine> vaccines;

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

    public Set<Vaccine> getVaccines() {
        return vaccines;
    }

    public void setVaccines(Set<Vaccine> vaccines) {
        this.vaccines = vaccines;
    }

    public void addVaccine(Vaccine vaccine){
        vaccines.add(vaccine);
    }
    public void deleteVaccine(Vaccine vaccine){
        vaccines.remove(vaccine);
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Country country = (Country) o;
        return id == country.id &&
                Objects.equals(countryName, country.countryName) &&
                Objects.equals(flagFileName, country.flagFileName) &&
                Objects.equals(mapFileName, country.mapFileName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, countryName, flagFileName, mapFileName);
    }
}
