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
public class Pesan {
    private int id;
    private int id_pengirim;
    private int id_penerima;
    private String subjek;
    private String isi;
    private String tanggal;
    private String jam;
    private boolean seen;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the id_pengirim
     */
    public int getId_pengirim() {
        return id_pengirim;
    }

    /**
     * @param id_pengirim the id_pengirim to set
     */
    public void setId_pengirim(int id_pengirim) {
        this.id_pengirim = id_pengirim;
    }

    /**
     * @return the id_penerima
     */
    public int getId_penerima() {
        return id_penerima;
    }

    /**
     * @param id_penerima the id_penerima to set
     */
    public void setId_penerima(int id_penerima) {
        this.id_penerima = id_penerima;
    }

    /**
     * @return the subjek
     */
    public String getSubjek() {
        return subjek;
    }

    /**
     * @param subjek the subjek to set
     */
    public void setSubjek(String subjek) {
        this.subjek = subjek;
    }

    /**
     * @return the isi
     */
    public String getIsi() {
        return isi;
    }

    /**
     * @param isi the isi to set
     */
    public void setIsi(String isi) {
        this.isi = isi;
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
     * @return the seen
     */
    public boolean isSeen() {
        return seen;
    }

    /**
     * @param seen the seen to set
     */
    public void setSeen(boolean seen) {
        this.seen = seen;
    }
}
