package com.infections.model;

import javax.persistence.*;

@Entity
public class ListOfReferences {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(columnDefinition = "TEXT")
    private String listOfReferencesText;

    public ListOfReferences(String listOfReferencesText) {
        this.listOfReferencesText = listOfReferencesText;
    }

    public ListOfReferences(){}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getListOfReferencesText() {
        return listOfReferencesText;
    }

    public void setListOfReferencesText(String listOfReferencesText) {
        this.listOfReferencesText = listOfReferencesText;
    }
}
