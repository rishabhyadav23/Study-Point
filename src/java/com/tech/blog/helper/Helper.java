
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    // this function is used to delete profile pic with the help of path from the folder
    public static boolean  deleteFile(String path){
        boolean flag = false;
        
        try {
            
            File file = new File(path);
            flag = file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  flag;
    }
    
    // this function is used to save uploaded file in the folder
    
    public static boolean saveFile(InputStream is, String path){
        
        boolean flag = false;
        
        try {
            byte[] b = new byte[is.available()];
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            flag= true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
