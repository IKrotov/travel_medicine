package com.infections.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OtherDiseases {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String disName;
    private String prevention;
    private String comment;

    public OtherDiseases(){}

    public OtherDiseases(String disName, String prevention, String comment) {
        this.disName = disName;
        this.prevention = prevention;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDisName() {
        return disName;
    }

    public void setDisName(String disName) {
        this.disName = disName;
    }

    public String getPrevention() {
        return prevention;
    }

    public void setPrevention(String prevention) {
        this.prevention = prevention;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
