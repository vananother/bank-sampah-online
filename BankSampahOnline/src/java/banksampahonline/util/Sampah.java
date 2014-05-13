/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package banksampahonline.util;

/**
 *
 * @author van
 */
public class Sampah {
    private int idSampah;
    private int idPengguna;
    private String kategori;
    private double jumlah;
    private String status;
    private String tanggal;
    private String jam;
    private String keterangan;

    public Sampah(){
        this.status = "Belum Dijemput";
    }
    /**
     * @return the idSampah
     */
    public int getIdSampah() {
        return idSampah;
    }

    /**
     * @param idSampah the idSampah to set
     */
    public void setIdSampah(int idSampah) {
        this.idSampah = idSampah;
    }

    /**
     * @return the idPengguna
     */
    public int getIdPengguna() {
        return idPengguna;
    }

    /**
     * @param idPengguna the idPengguna to set
     */
    public void setIdPengguna(int idPengguna) {
        this.idPengguna = idPengguna;
    }

    /**
     * @return the kategori
     */
    public String getKategori() {
        return kategori;
    }

    /**
     * @param kategori the kategori to set
     */
    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    /**
     * @return the jumlah
     */
    public double getJumlah() {
        return jumlah;
    }

    /**
     * @param jumlah the jumlah to set
     */
    public void setJumlah(double jumlah) {
        this.jumlah = jumlah;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the tanggal
     */
    public String getTanggal() {
        return tanggal;
    }

    /**
     * @param tanggal the tanggal to set
     */
    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    /**
     * @return the jam
     */
    public String getJam() {
        return jam;
    }

    /**
     * @param jam the jam to set
     */
    public void setJam(String jam) {
        this.jam = jam;
    }

    /**
     * @return the keterangan
     */
    public String getKeterangan() {
        return keterangan;
    }

    /**
     * @param keterangan the keterangan to set
     */
    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }
    
    
}
