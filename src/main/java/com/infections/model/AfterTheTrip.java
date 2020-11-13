package com.infections.model;

import javax.persistence.*;

@Entity
public class AfterTheTrip {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(columnDefinition = "TEXT")
    private String afterTripText;

    public AfterTheTrip(String afterTripText) {
        this.afterTripText = afterTripText;
    }

    public AfterTheTrip(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAfterTripText() {
        return afterTripText;
    }

    public void setAfterTripText(String afterTripText) {
        this.afterTripText = afterTripText;
    }
}
