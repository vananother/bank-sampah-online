/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.database;

import banksampahonline.util.Account;
import banksampahonline.util.Penjemputan;
import banksampahonline.util.Pesan;
import banksampahonline.util.Sampah;
import banksampahonline.util.UtilMethods;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;

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
    public PreparedStatement pstmt = null;
    public static String failBecause = "";
    public String opc = "kosong";

    public void openConnection() {
        try {
            Class.forName(DATABASE_DRIVER);

            con = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
            stmt = con.createStatement();
            pstmt = con.prepareStatement("");
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

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<String> getAdmins() {
        ArrayList<String> admins = new ArrayList<String>();
        try {
            String query = "SELECT username FROM akun WHERE role = 'admin';";
            openConnection();
            pstmt = con.prepareStatement(query);
            ResultSet res = pstmt.executeQuery();
            while (res.next()) {
                admins.add(res.getObject(1).toString());
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return admins;
    }

    public boolean addAdmin(String username, String password) {
        String query = "";
        boolean isValid = true;
        try {
            query = "INSERT INTO akun (username, password, role) values ( ? , ? , 'admin')";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public boolean deleteAdmin(String target) {
        boolean isValid = true;
        try {
            String query = "DELETE FROM akun WHERE username = ?";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, target);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public ArrayList<Pair<String, String>> getTopTen() {
        ArrayList<Pair<String, String>> topTen = new ArrayList<Pair<String, String>>();
        try {
            String query = "SELECT username, totalpoint FROM akun WHERE role = 'pengguna' ORDER BY totalpoint DESC;";
            openConnection();
            pstmt = con.prepareStatement(query);
            ResultSet res = pstmt.executeQuery();
            int index = 0;
            while (res.next() && index < 10) {
                topTen.add(new Pair(res.getString(1), res.getString(2)));
                index++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return topTen;
    }

    public boolean addAccount(String username, String password, String firstname, String lastname, String email, String alamat, String phone) {
        boolean isValid = true;
        try {
//            String query = "INSERT INTO akun (username, password, firstname, lastname, email, alamat, phone)"
//                    + " VALUES ('" + username + "', '" + password + "', '" + firstname + "', '" + lastname + "', '" + email
//                    + "', '" + alamat + "', '" + phone + "');";

            String query = "INSERT INTO akun (username, password, firstname, lastname, email, alamat, phone)"
                    + " VALUES ( ? , ? , ? , ? , ? , ? , ? );";

            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, firstname);
            pstmt.setString(4, lastname);
            pstmt.setString(5, email);
            pstmt.setString(6, alamat);
            pstmt.setString(7, phone);
            pstmt.executeUpdate();

            //int res = stmt.executeUpdate(query);
        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public double getSaldo(String username, String password) {
        if (!isLoginValid(username, UtilMethods.hashInput(password))) {
            return -1;
        }

        double saldo = 0;
        String query = "";
        try {
            query = "SELECT uangvirtual FROM akun WHERE username = ?";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            ResultSet res = pstmt.executeQuery();
            if (res.next()) {
                saldo = Double.parseDouble(res.getString("uangvirtual").toString());
            }
        } catch (SQLException ex) {
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return saldo;
    }

    public boolean withDraw(String username, String password, double jumlah) {
        boolean withDraw = true;
        if (!isLoginValid(username, UtilMethods.hashInput(password))) {
            return false; //gagal login
        }

        double saldo = getSaldo(username, password);
        if (jumlah > saldo) {
            return false; //"saldo kurang";
        }

        String query = "UPDATE akun SET uangvirtual = uangvirtual - " + jumlah + " WHERE username = '" + username + "'";
        try {
            openConnection();
            int res = stmt.executeUpdate(query);
        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            withDraw = false;
        } finally {
            closeConnection();
        }
//        return failBecause;
        return withDraw;
    }

    public boolean addSampah(Sampah sampah) {
        boolean isValid = true;
        try {
//            String query = "INSERT INTO sampah (id_pengguna, kategori, jumlah, status, tanggal, jam, keterangan)"
//                    + " VALUES ('" + sampah.getIdPengguna() + "', '" + sampah.getKategori() + "', '" + sampah.getJumlah() + "', '" + sampah.getStatus() + "', '" + sampah.getTanggal()
//                    + "', '" + sampah.getJam() + "', '" + sampah.getKeterangan() + ");";

            String query = "INSERT INTO sampah (pengirim, kategori, jumlah, status, tanggal, jam, keterangan)"
                    + " VALUES ( ? , ? , ? , ? , ? , ? , ? );";

            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, sampah.getIdPengguna());
            pstmt.setString(2, sampah.getKategori());
            pstmt.setDouble(3, sampah.getJumlah());
            pstmt.setString(4, sampah.getStatus());
            pstmt.setString(5, sampah.getTanggal());
            pstmt.setString(6, sampah.getJam());
            pstmt.setString(7, sampah.getKeterangan());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public boolean updateProfile(ArrayList<String> newVal, int accountId) {
        boolean isValid = true;
        String query = null;
        try {
            query = "UPDATE akun SET " + newVal.get(0);
            if (newVal.size() > 1) {
                for (int i = 1; i < newVal.size(); i++) {
                    query += ", " + newVal.get(i);
                }
            }
            query += " WHERE akun.id = " + accountId + ";";
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

    public ArrayList<Sampah> getSampah(String username) {
        ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
        Sampah temp = new Sampah();
        try {
            String query = "SELECT * FROM sampah WHERE pengirim = ? ORDER BY tanggal DESC";
            ResultSet res = null;
            // int numberOfColumns = 0;
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            res = pstmt.executeQuery();
            // numberOfColumns = res.getMetaData().getColumnCount();
            while (res.next()) {
                temp = new Sampah();
                temp.setIdSampah(Integer.parseInt(res.getObject(1).toString()));
                temp.setIdPengguna(res.getObject(2).toString());
                temp.setKategori(res.getObject(3).toString());
                temp.setJumlah(Double.parseDouble(res.getObject(4).toString()));
                temp.setStatus(res.getObject(5).toString());
                temp.setTanggal(res.getObject(6).toString());
                temp.setJam(res.getObject("jam").toString());
                temp.setKeterangan(res.getObject("keterangan").toString());
                temp.setBayaran(Double.parseDouble(res.getObject("bayaran").toString()));
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

    public boolean hapusSampah(String idSampah) {
        boolean isValid = true;
        String query = "";
        try {
            query = "DELETE FROM sampah WHERE id_sampah = " + idSampah;
            openConnection();
            int res = stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public boolean jemputSampah(String idSampah) {
        boolean isValid = true;
        String query = "";
        try {
            query = "UPDATE sampah SET status = \"Sudah Diterima\" WHERE id_sampah = " + idSampah;
            openConnection();
            int res = stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public boolean bayarSampah(String idSampah, String username, String bayaran) {
        boolean isValid = true;
        String query = "";
        try {
            query = "UPDATE akun, sampah SET sampah.bayaran = " + bayaran + ", "
                    + "sampah.status = \"Sudah Dibayar\", "
                    + "akun.uangvirtual = akun.uangvirtual +" + bayaran + ", "
                    + "akun.totalpoint = akun.totalpoint +" + bayaran
                    + " WHERE sampah.id_sampah = '" + idSampah + "' AND akun.username = '" + username + "'";
            openConnection();
            int res = stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
            isValid = false;
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public ArrayList<Penjemputan> getWaitingList() {
        ArrayList<Penjemputan> wL = new ArrayList<Penjemputan>();
        String query = "";
        try {
            query = "SELECT * FROM akun, sampah WHERE sampah.status = \"Belum Dijemput\" AND sampah.pengirim = akun.username ORDER BY sampah.tanggal ASC";
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            Penjemputan temp;
            while (res.next()) {
                temp = new Penjemputan();
                temp.setIdSampah(Integer.parseInt(res.getObject("id_sampah").toString()));
                temp.setIdPengguna(res.getObject("username").toString());
                temp.setPengirim(res.getObject("username").toString());
                temp.setKategori(res.getObject("kategori").toString());
                temp.setJumlah(Double.parseDouble(res.getObject("jumlah").toString()));
                temp.setAlamat(res.getObject("alamat").toString());
                temp.setTanggal(res.getObject("tanggal").toString());
                temp.setJam(res.getObject("jam").toString());
                temp.setKeterangan(res.getObject("keterangan").toString());
                wL.add(temp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return wL;
    }

    public ArrayList<Sampah> getPayList() {
        ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
        Sampah temp = new Sampah();
        String query = "";
        try {
            query = "SELECT * FROM `sampah` where status = \"Sudah Diterima\" ORDER BY tanggal ASC";
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                temp = new Sampah();
                temp.setIdSampah(Integer.parseInt(res.getObject("id_sampah").toString()));
                temp.setIdPengguna(res.getObject("pengirim").toString());
                temp.setKategori(res.getObject("kategori").toString());
                temp.setJumlah(Double.parseDouble(res.getObject("jumlah").toString()));
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

    public ArrayList<String> getKategori() {
        ArrayList<String> kategori = new ArrayList<String>();
        try {
            String query = "SELECT * FROM kategori ORDER BY id_kategori ASC";

            int numberOfColumns = 0;
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                kategori.add(res.getObject(2).toString());
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return kategori;
    }

    public String getAccountUsername(int id) {
        String username = "";
        try {
            String query = "SELECT username FROM akun WHERE id = ?;";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet res = pstmt.executeQuery();
            while (res.next()) {
                username = res.getObject(1).toString();
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        }
        return username;
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
            String query = "SELECT * FROM akun WHERE username = ? AND password = ? ";

            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username1);
            pstmt.setString(2, password1);
            ResultSet res = pstmt.executeQuery();
            isValid = res.next();
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class.getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return isValid;
    }

    public ArrayList<Pesan> getAccountMessages(String id_pengirim) {
        ArrayList<Pesan> messages = new ArrayList<Pesan>();
        String query = "";
        try {
            query = "SELECT * FROM pesan WHERE id_pengirim = ? OR id_penerima = ? ORDER BY id_pesan DESC;";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id_pengirim);
            pstmt.setString(2, id_pengirim);
            ResultSet res = pstmt.executeQuery();
            Pesan temp = null;
            while (res.next()) {
                temp = new Pesan();
                temp.setId(Integer.parseInt(res.getObject("id_pesan").toString()));
                temp.setId_pengirim(res.getObject("id_pengirim").toString());
                temp.setId_penerima(res.getObject("id_penerima").toString());
                temp.setSubjek(res.getObject("subjek").toString());
                temp.setIsi(res.getObject("isi").toString());
                temp.setTanggal(res.getObject("tanggal").toString());
                temp.setJam(res.getObject("jam").toString());
                temp.setSeen(true);
                messages.add(temp);
            }
        } catch (SQLException e) {
            failBecause = e.getMessage();
        } finally {
            closeConnection();
        }
        return messages;
    }

    public int getUnreadMessagesCount(String id_penerima) {
        int count = 0;
        String query = "";
        try {
            query = "SELECT COUNT(1) FROM pesan WHERE id_penerima = ? and seen = '0'";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id_penerima);
            ResultSet res = pstmt.executeQuery();
            if (res.next()) {
                count = Integer.parseInt(res.getObject(1).toString());
            }
        } catch (SQLException e) {
            failBecause = e.getMessage();
        } finally {
            closeConnection();
        }
        return count;
    }

    public void readMessages(String id_penerima) {
        String query = "";
        try {
            query = "UPDATE pesan SET seen = '1' WHERE id_penerima = '" + id_penerima + "' AND seen = '0'";
            openConnection();
            int res = stmt.executeUpdate(query);
        } catch (SQLException e) {
            failBecause = e.getMessage() + "eeee";
        } finally {
            closeConnection();
        }
    }

    public ArrayList<Pesan> getMessages(String id_pengirim, String id_penerima) {
        ArrayList<Pesan> messages = new ArrayList<Pesan>();
        String query = "";
        try {
            query = "SELECT * FROM pesan WHERE (id_pengirim = ? AND id_penerima = ?) OR (id_pengirim = ? AND id_penerima = ?) ORDER BY id_pesan DESC";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, "" + id_pengirim);
            pstmt.setString(2, "" + id_penerima);
            pstmt.setString(3, "" + id_penerima);
            pstmt.setString(4, "" + id_pengirim);
            ResultSet res = pstmt.executeQuery();
            Pesan temp;
            while (res.next()) {
                temp = new Pesan();
                temp.setId(Integer.parseInt(res.getObject("id_pesan").toString()));
                temp.setId_pengirim(res.getObject("id_pengirim").toString());
                temp.setId_penerima(res.getObject("id_penerima").toString());
                temp.setSubjek(res.getObject("subjek").toString());
                temp.setIsi(res.getObject("isi").toString());
                temp.setTanggal(res.getObject("tanggal").toString());
                temp.setJam(res.getObject("jam").toString());
                temp.setSeen(true);
                messages.add(temp);
            }
        } catch (SQLException e) {
            failBecause = e.getMessage();
        } finally {
            closeConnection();
        }
        return messages;
    }

    public ArrayList<String> getUsers() {
        ArrayList<String> user = new ArrayList<String>();
        String query = "";
        try {
            query = "SELECT username FROM akun WHERE role = 'pengguna' ";
            openConnection();
            pstmt = con.prepareStatement(query);
            ResultSet res = pstmt.executeQuery();
            while (res.next()) {
                user.add(res.getObject(1).toString());
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class
                    .getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
        } finally {
            closeConnection();
        }
        return user;
    }

    public boolean sendMessage(Pesan pesan) {
        boolean isValid = true;

        try {
            String query = "INSERT INTO pesan (id_pengirim, id_penerima, subjek, isi, tanggal, jam, seen) "
                    + "values ( ?, ?, ?, ?, ?, ?, ?);";
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, pesan.getId_pengirim());
            pstmt.setString(2, pesan.getId_penerima());
            pstmt.setString(3, pesan.getSubjek());
            pstmt.setString(4, pesan.getIsi());
            pstmt.setString(5, pesan.getTanggal());
            pstmt.setString(6, pesan.getJam());
            pstmt.setBoolean(7, pesan.isSeen());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class
                    .getName()).log(Level.SEVERE, null, ex);
            isValid = false;
            failBecause = ex.getMessage();

        } finally {
            closeConnection();
        }
        return isValid;
    }

    public Account login(String username, String password) {
        Account account = null;
        try {
            String query = "SELECT * FROM akun WHERE username = ? AND password = ?";
            ResultSet res = null;
            int numberOfColumns = 0;
            openConnection();
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            res = pstmt.executeQuery();
            numberOfColumns = res.getMetaData().getColumnCount();
            if (res.next()) {
                String id = res.getObject(1).toString();
                String role = res.getObject(2).toString();
                String uname = res.getObject(3).toString();
                account = new Account(Integer.parseInt(id), role, uname);
                account.setHashPassword(res.getObject(4).toString());
                account.setFirstname(res.getObject(5).toString());
                account.setLastname(res.getObject(6).toString());
                account.setEmail(res.getObject(7).toString());
                account.setAlamat(res.getObject(8).toString());
                account.setPhone(res.getObject(9).toString());
                account.setUangvirtual(Double.parseDouble(res.getObject(10).toString()));
            } else {
                account = null;

            }
//
//            if (res.next()) {
//                return null;
//            }
        } catch (SQLException ex) {
            Logger.getLogger(BankSampahOnlineDB.class
                    .getName()).log(Level.SEVERE, null, ex);
            failBecause = ex.getMessage();
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
            Logger.getLogger(BankSampahOnlineDB.class
                    .getName()).log(Level.SEVERE, null, ex);
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
