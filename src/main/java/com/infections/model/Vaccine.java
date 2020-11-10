package com.infections.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Vaccine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String vacName;
    @Column(length = 1024)
    private String recommendation;
    @Column(length = 1024)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Vaccine vaccine = (Vaccine) o;
        return id == vaccine.id &&
                Objects.equals(vacName, vaccine.vacName) &&
                Objects.equals(recommendation, vaccine.recommendation) &&
                Objects.equals(transmission, vaccine.transmission) &&
                Objects.equals(url, vaccine.url);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, vacName, recommendation, transmission, url);
    }
}
