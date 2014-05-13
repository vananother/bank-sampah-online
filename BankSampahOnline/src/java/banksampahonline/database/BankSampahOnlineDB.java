/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.database;

import banksampahonline.util.Account;
import banksampahonline.util.Sampah;
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

    public boolean addAccount(String username, String password, String firstname, String lastname, String email, String alamat, String phone) {
        boolean isValid = true;
        try {
            String query = "INSERT INTO akun (username, password, firstname, lastname, email, alamat, phone)"
                    + " VALUES ('" + username + "', '" + password + "', '" + firstname + "', '" + lastname + "', '" + email
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

    public boolean addSampah(Sampah sampah) {
        boolean isValid = true;
        try {
            String query = "INSERT INTO sampah (id_pengguna, kategori, jumlah, status, tanggal, jam, keterangan)"
                    + " VALUES ('" + sampah.getIdPengguna() + "', '" + sampah.getKategori() + "', '" + sampah.getJumlah() + "', '" + sampah.getStatus() + "', '" + sampah.getTanggal()
                    + "', '" + sampah.getJam() + "', '" + sampah.getKeterangan() + "');";

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

    public ArrayList<Sampah> getSampah(int accountId) {
        ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
        Sampah temp = new Sampah();
        try {
            String query = "SELECT * FROM sampah WHERE id_pengguna ='" + accountId + "'";
            ResultSet res = null;
            int numberOfColumns = 0;
            openConnection();
            res = stmt.executeQuery(query);
            numberOfColumns = res.getMetaData().getColumnCount();
            while (res.next()) {
                temp = new Sampah();
                temp.setIdSampah(Integer.parseInt(res.getObject(1).toString()));
                temp.setIdPengguna(Integer.parseInt(res.getObject(2).toString()));
                temp.setKategori(res.getObject(3).toString());
                temp.setJumlah(Double.parseDouble(res.getObject(4).toString()));
                temp.setStatus(res.getObject(5).toString());
                temp.setTanggal(res.getObject(6).toString());
                temp.setJam(res.getObject("jam").toString());
                temp.setKeterangan(res.getObject("keterangan").toString());
                sesampahan.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return sesampahan;
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
            failBecause = ex.getMessage() + " " + ex.getErrorCode();
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
                account.setFirstname(res.getObject(5).toString());
                account.setLastname(res.getObject(6).toString());
                account.setEmail(res.getObject(7).toString());
                account.setAlamat(res.getObject(8).toString());
                account.setPhone(res.getObject(9).toString());
                account.setUangvirtual(Double.parseDouble(res.getObject(10).toString()));
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
