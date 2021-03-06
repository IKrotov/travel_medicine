package com.infections.model;


import javax.persistence.*;

@Entity
public class Health {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(columnDefinition = "TEXT")
    private String healthText;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private UploadFile file;

    public Health(String healthText) {
        this.healthText = healthText;
    }

    public Health(){}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHealthText() {
        return healthText;
    }

    public void setHealthText(String healthText) {
        this.healthText = healthText;
    }

    public UploadFile getFile() {
        return file;
    }

    public void setFile(UploadFile file) {
        this.file = file;
    }
}
