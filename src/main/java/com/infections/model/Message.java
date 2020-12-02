package com.infections.model;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String text;
    @Length(max = 255, message = "Длинна заголовка не должна превышать 255 сиволов")
    private String header;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private UploadFile file;

    private Date date;

    @Enumerated(EnumType.STRING)
    private Continent continent;

    private String countryName;

    public Message(String text, String header, Date date, String countryName, Continent continent) {
        this.text = text;
        this.header = header;
        this.date = date;
        this.countryName = countryName;
        this.continent = continent;
    }

    public Message() {

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public UploadFile getFile() {
        return file;
    }

    public void setFile(UploadFile file) {
        this.file = file;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public Continent getContinent() {
        return continent;
    }

    public void setContinent(Continent continent) {
        this.continent = continent;
    }
}
