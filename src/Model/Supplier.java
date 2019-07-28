/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ravi
 */
public class Supplier {
    int id_supplier;
    String nama_supplier, alamat_supplier;
    boolean isAktif;

    public Supplier(int id_supplier, String nama_supplier, String alamat_supplier, boolean isAktif) {
        this.id_supplier = id_supplier;
        this.nama_supplier = nama_supplier;
        this.alamat_supplier = alamat_supplier;
        this.isAktif = isAktif;
    }

    public int getId_supplier() {
        return id_supplier;
    }

    public void setId_supplier(int id_supplier) {
        this.id_supplier = id_supplier;
    }

    public String getNama_supplier() {
        return nama_supplier;
    }

    public void setNama_supplier(String nama_supplier) {
        this.nama_supplier = nama_supplier;
    }

    public String getAlamat_supplier() {
        return alamat_supplier;
    }

    public void setAlamat_supplier(String alamat_supplier) {
        this.alamat_supplier = alamat_supplier;
    }

    public boolean isIsAktif() {
        return isAktif;
    }

    public void setIsAktif(boolean isAktif) {
        this.isAktif = isAktif;
    }
    
    
}
