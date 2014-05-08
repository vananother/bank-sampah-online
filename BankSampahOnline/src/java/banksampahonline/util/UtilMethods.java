/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author van
 */
public class UtilMethods {

    public static String hashInput(String input) {
        MessageDigest md = null;
        String output = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
            md.update(input.getBytes());
            byte[] pass = md.digest();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < pass.length; i++) {
                sb.append(Integer.toString((pass[i] & 0xff) + 0x100, 16).substring(1));
            }

            output = sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UtilMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return output;
    }
    
    public static int registrationFormValidation(String username, String password1, String password2, String firstname, String lastname, String email, String alamat, String phone){
        if(username==null || username.length() < 4 || username.length() > 32){
            return 1;
        } else if(!username.matches("[A-Za-z0-9]+")){
            return 9;
        }
        
        if(password1 == null || password1.length() < 6){
            return 2;
        }
        
        if(password2 == null || !password2.equals(password1)){
            return 3;
        }
        
        if(firstname == null || firstname.trim().length() < 1){
            return 4;
        }
        
        //if(lastname == null || lastname.trim().length() < 1){
        //    return 5;
        //}
        
        if(email == null || email.trim().length() < 1){
            return 6;
        }
        
        if(alamat == null || alamat.trim().length() < 1){
            return 7;
        }
        
        if(phone == null || phone.trim().length() < 1){
            return 8;
        }
               
        return 0;
    }
}
