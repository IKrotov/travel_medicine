package com.infections.model;

import javax.persistence.*;

@Entity
public class Prevention {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(columnDefinition="TEXT")
    private String preventionText;

    public Prevention(){}

    public Prevention(String preventionText) {
        this.preventionText = preventionText;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPreventionText() {
        return preventionText;
    }

    public void setPreventionText(String preventionText) {
        this.preventionText = preventionText;
    }
}
