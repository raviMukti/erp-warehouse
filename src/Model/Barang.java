/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author ravi
 */
public class Barang {
    int id_barang;
    String nama_barang, merk_barang, tipe_barang, satuan_barang;
    double stok_barang;
    LocalDate tanggal_masuk_gudang;

    public Barang(int id_barang, String nama_barang, String merk_barang, String tipe_barang, String satuan_barang, double stok_barang, LocalDate tanggal_masuk_gudang) {
        this.id_barang = id_barang;
        this.nama_barang = nama_barang;
        this.merk_barang = merk_barang;
        this.tipe_barang = tipe_barang;
        this.satuan_barang = satuan_barang;
        this.stok_barang = stok_barang;
        this.tanggal_masuk_gudang = tanggal_masuk_gudang;
    }

    public int getId_barang() {
        return id_barang;
    }

    public void setId_barang(int id_barang) {
        this.id_barang = id_barang;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public String getMerk_barang() {
        return merk_barang;
    }

    public void setMerk_barang(String merk_barang) {
        this.merk_barang = merk_barang;
    }

    public String getTipe_barang() {
        return tipe_barang;
    }

    public void setTipe_barang(String tipe_barang) {
        this.tipe_barang = tipe_barang;
    }

    public String getSatuan_barang() {
        return satuan_barang;
    }

    public void setSatuan_barang(String satuan_barang) {
        this.satuan_barang = satuan_barang;
    }

    public double getStok_barang() {
        return stok_barang;
    }

    public void setStok_barang(double stok_barang) {
        this.stok_barang = stok_barang;
    }

    public LocalDate getTanggal_masuk_gudang() {
        return tanggal_masuk_gudang;
    }

    public void setTanggal_masuk_gudang(LocalDate tanggal_masuk_gudang) {
        this.tanggal_masuk_gudang = tanggal_masuk_gudang;
    }    
}
