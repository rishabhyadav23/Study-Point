
package com.tech.blog.entities;

import java.sql.Timestamp;


public class User {
    private int id;
    private  String user_name;
    private String user_email;
    private String user_pass;
    private String gender;
    private Timestamp reg_date;
    private String user_profile;

    public User(int id, String user_name, String user_email, String user_pass, String gender, Timestamp reg_date) {
        this.id = id;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pass = user_pass;
        this.gender = gender;
        this.reg_date = reg_date;
    }
    public User(String user_name, String user_email, String user_pass, String gender) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pass = user_pass;
        this.gender = gender;
    }
    
    public User(){
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public String getUser_profile() {
        return user_profile;
    }

    public void setUser_profile(String user_profile) {
        this.user_profile = user_profile;
    }
    
}
