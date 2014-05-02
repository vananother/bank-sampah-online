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
}
