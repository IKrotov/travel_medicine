package com.infections.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Vaccine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String vacName;
    private String recommendation;
    private String transmission;
    private String url;

    public Vaccine() {

    }

    public Vaccine(String vacName, String recommendation, String transmission, String url) {
        this.vacName = vacName;
        this.recommendation = recommendation;
        this.transmission = transmission;
        this.url = url;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getVacName() {
        return vacName;
    }

    public void setVacName(String vacName) {
        this.vacName = vacName;
    }

    public String getRecommendation() {
        return recommendation;
    }

    public void setRecommendation(String recommendation) {
        this.recommendation = recommendation;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
