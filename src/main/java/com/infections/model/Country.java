package com.infections.model;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.util.Objects;
import java.util.Set;

@Entity
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String countryName;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private UploadFile flag;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private UploadFile memoFile;

    @Column(length = 1024)
    private String googleMap;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Vaccine> vaccines;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<OtherDiseases> otherDiseasesSet;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Prevention prevention;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Health health;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private AfterTheTrip afterTheTrip;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private ListOfReferences listOfReferences;

    public Country(String countryName, UploadFile flag, UploadFile memoFile, String googleMap) {
        this.countryName = countryName;
        this.flag = flag;
        this.memoFile = memoFile;
        this.googleMap = googleMap;
    }

    public Country(String countryName){
        this.countryName = countryName;
    }

    public Country(){}

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

    public Set<Vaccine> getVaccines() {
        return vaccines;
    }

    public void setVaccines(Set<Vaccine> vaccines) {
        this.vaccines = vaccines;
    }

    public Set<OtherDiseases> getOtherDiseasesSet() {
        return otherDiseasesSet;
    }

    public void setOtherDiseasesSet(Set<OtherDiseases> otherDiseasesSet) {
        this.otherDiseasesSet = otherDiseasesSet;
    }

    public void addVaccine(Vaccine vaccine){
        vaccines.add(vaccine);
    }
    public void deleteVaccine(Vaccine vaccine){
        vaccines.remove(vaccine);
    }

    public void addDiseases(OtherDiseases otherDiseases){
        otherDiseasesSet.add(otherDiseases);
    }

    public void deleteDiseases(OtherDiseases otherDiseases){
        otherDiseasesSet.remove(otherDiseases);
    }

    public Prevention getPrevention() {
        return prevention;
    }

    public void setPrevention(Prevention prevention) {
        this.prevention = prevention;
    }

    public Health getHealth() {
        return health;
    }

    public void setHealth(Health health) {
        this.health = health;
    }

    public AfterTheTrip getAfterTheTrip() {
        return afterTheTrip;
    }

    public void setAfterTheTrip(AfterTheTrip afterTheTrip) {
        this.afterTheTrip = afterTheTrip;
    }

    public ListOfReferences getListOfReferences() {
        return listOfReferences;
    }

    public void setListOfReferences(ListOfReferences listOfReferences) {
        this.listOfReferences = listOfReferences;
    }

    public UploadFile getFlag() {
        return flag;
    }

    public void setFlag(UploadFile flag) {
        this.flag = flag;
    }

    public UploadFile getMemoFile() {
        return memoFile;
    }

    public void setMemoFile(UploadFile memoFile) {
        this.memoFile = memoFile;
    }

    public String getGoogleMap() {
        return googleMap;
    }

    public void setGoogleMap(String googleMap) {
        this.googleMap = googleMap;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Country country = (Country) o;
        return id == country.id &&
                Objects.equals(countryName, country.countryName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, countryName);
    }
}
