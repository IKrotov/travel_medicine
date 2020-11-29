package com.infections.model;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

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

    public Message(String text, String header) {
        this.text = text;
        this.header = header;
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
}
