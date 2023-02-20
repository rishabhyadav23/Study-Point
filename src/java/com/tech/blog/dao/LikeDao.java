
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    public boolean addLike(int postId, int userId){
        boolean f = false;
        try {
            String q = "insert into likes(postId,userId) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  f;
    }
    
    public long countLikes(int postId){
        long likes = 0;
        try {
            String q = "select count(*) from likes where postId=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, postId);
            ResultSet set = ps.executeQuery();
            if(set.next()){
                likes = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return likes;
    }
    
    public boolean isLikedByUser(int postId, int userId){
        boolean f = false;
        
        try {
            String q = "select* from likes where postId=? and userId=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ResultSet set = ps.executeQuery();
            if(set.next()){
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public boolean deleteLike(int postId, int userId){
        boolean f = false;
        
        try {
            String q = "delete from likes where postId=? and userId=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
