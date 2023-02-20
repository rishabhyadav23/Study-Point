package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // method to insert data into database.
    public boolean registerUser(User user) {
        boolean f = false;
        try {
            String query = "insert into user(user_name,user_email,user_pass, gender)values(?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, user.getUser_name());
            pst.setString(2, user.getUser_email());
            pst.setString(3, user.getUser_pass());
            pst.setString(4, user.getGender());

            pst.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // get user email and password
    public User getuserEmailAndPass(String email, String pass) {

        User user = null;

        try {

            String query = "select* from user where user_email=? and user_pass=?";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, email);
            pst.setString(2, pass);

            ResultSet set = pst.executeQuery();

            if (set.next()) {
                user = new User();

                //fetch data from databse and set in user
                user.setId(set.getInt("id"));
                user.setUser_name(set.getString("user_name"));
                user.setUser_email(set.getString("user_email"));
                user.setUser_pass(set.getString("user_pass"));
                user.setGender(set.getString("gender"));
                user.setReg_date(set.getTimestamp("reg_date"));
                user.setUser_profile(set.getString("user_profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    //udate user information
    public boolean updateUser(User user) {
        boolean f = false;
        try {

            String query = "update user set user_name=?, user_email=?,user_pass=?,gender=?, user_profile=? where id=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, user.getUser_name());
            pst.setString(2, user.getUser_email());
            pst.setString(3, user.getUser_pass());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getUser_profile());
            pst.setInt(6, user.getId());

            pst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserById(int userId) {
        User user = null;
        try {
            String q = "select* from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();
                user.setId(set.getInt("id"));
                user.setUser_name(set.getString("user_name"));
                user.setUser_email(set.getString("user_email"));
                user.setUser_pass(set.getString("user_pass"));
                user.setGender(set.getString("gender"));
                user.setReg_date(set.getTimestamp("reg_date"));
                user.setUser_profile(set.getString("user_profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
