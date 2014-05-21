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
public class Penjemputan extends Sampah{
    private String pengirim;
    private String alamat;

    /**
     * @return the pengirim
     */
    public String getPengirim() {
        return pengirim;
    }

    /**
     * @param pengirim the pengirim to set
     */
    public void setPengirim(String pengirim) {
        this.pengirim = pengirim;
    }

    /**
     * @return the alamat
     */
    public String getAlamat() {
        return alamat;
    }

    /**
     * @param alamat the alamat to set
     */
    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }
}
