/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.database;

import banksampahonline.util.Account;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author van
 */
public class BankSampahOnlineDB {

    public static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
    public static final String DATABASE_URL = "jdbc:mysql://localhost/banksampahonline";
    public static final String DATABASE_USERNAME = "root";
    public static final String DATABASE_PASSWORD = "";
    public Connection con = null;
    public Statement stmt = null;
    public String failBecause = "";
    public String opc = "kosong";

    public void openConnection() {
        try {
            Class.forName(DATABASE_DRIVER);

            con = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
            stmt = con.createStatement();
        } catch (ClassNotFoundException ex) {
            opc = "connect fail";
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            opc = "connect fail";
        }
        opc = "connect success";
    }

    public void closeConnection() {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean addAccount(String username, String password) {
        boolean isValid = true;
        try {
            String query = "INSERT INTO akun (role, username, password) VALUES (\"pengguna\", \"" + username
                    + "\", \"" + password + "\");";

            openConnection();
            int res = stmt.executeUpdate(query);

        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public boolean addPengguna(int id, String username, String firstname, String lastname, String email, String alamat, String phone) {
        boolean isValid = true;
        try {
            String query = "INSERT INTO pengguna (id, username, firstname, lastname, email, alamat, phone)"
                    + " VALUES ('" + id + "', '" + username + "', '" + firstname + "', '" + lastname + "', '" + email
                    + "', '" + alamat + "', '" + phone + "');";

            openConnection();
            int res = stmt.executeUpdate(query);

        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public int getAccountID(String username) {
        int val = 0;
        try {
            String query = "SELECT * FROM akun WHERE username ='" + username + "'";
            ResultSet res = null;
            int numberOfColumns = 0;
            openConnection();
            res = stmt.executeQuery(query);
            numberOfColumns = res.getMetaData().getColumnCount();
            if (res.next()) {
                String id = res.getObject(1).toString();
                val = Integer.parseInt(id);
            }
        } catch (SQLException ex) {
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return val;
    }

    public boolean isLoginValid(String username1, String password1) {
        boolean isValid = false;

        try {
            String query = "SELECT * FROM akun WHERE username ='" + username1 + "' AND password ='" + password1 + "'";

            openConnection();

            ResultSet res = stmt.executeQuery(query);
            isValid = res.next();
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public Account login(String username, String password) {
        Account account = null;
        try {
            String query = "SELECT * FROM akun WHERE username ='" + username + "' AND password = '" + password + "'";
            ResultSet res = null;
            int numberOfColumns = 0;
            openConnection();
            res = stmt.executeQuery(query);
            numberOfColumns = res.getMetaData().getColumnCount();
            if (res.next()) {
                String id = res.getObject(1).toString();
                String role = res.getObject(2).toString();
                String uname = res.getObject(3).toString();
                account = new Account(Integer.parseInt(id), role, uname);
                return account;
            } else {
                account = null;
            }

            if (res.next()) {
                return new Account(0, "Fail", "Fail");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return account;
    }

    public String testConnection() throws SQLException {
        String retval = "";
        ResultSet res = null;
        int numberOfColumns = 0;
        try {
            String query = "SELECT * FROM test";
            openConnection();
            res = stmt.executeQuery(query);
            numberOfColumns = res.getMetaData().getColumnCount();
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

        }

        if (numberOfColumns == 0) {
            return "";
        } else {
            while (res.next()) {
                retval += "" + res.getObject(1) + " " + res.getObject(2);
            }
            return retval;
        }
    }
}
