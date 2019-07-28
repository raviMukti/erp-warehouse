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
public class TransaksiBarang {
    int id_transaksi;
    String jenis_transaksi, nama_karyawan, nama_barang, jenis_barang, merk_barang, tipe_barang, satuan_barang;
    LocalDate tanggal_transaksi;
    double jumlah;

    public TransaksiBarang(int id_transaksi, String jenis_transaksi, String nama_karyawan, String nama_barang, String jenis_barang, String merk_barang, String tipe_barang, String satuan_barang, LocalDate tanggal_transaksi, double jumlah) {
        this.id_transaksi = id_transaksi;
        this.jenis_transaksi = jenis_transaksi;
        this.nama_karyawan = nama_karyawan;
        this.nama_barang = nama_barang;
        this.jenis_barang = jenis_barang;
        this.merk_barang = merk_barang;
        this.tipe_barang = tipe_barang;
        this.satuan_barang = satuan_barang;
        this.tanggal_transaksi = tanggal_transaksi;
        this.jumlah = jumlah;
    }

    public int getId_transaksi() {
        return id_transaksi;
    }

    public void setId_transaksi(int id_transaksi) {
        this.id_transaksi = id_transaksi;
    }

    public String getJenis_transaksi() {
        return jenis_transaksi;
    }

    public void setJenis_transaksi(String jenis_transaksi) {
        this.jenis_transaksi = jenis_transaksi;
    }

    public String getNama_karyawan() {
        return nama_karyawan;
    }

    public void setNama_karyawan(String nama_karyawan) {
        this.nama_karyawan = nama_karyawan;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public String getJenis_barang() {
        return jenis_barang;
    }

    public void setJenis_barang(String jenis_barang) {
        this.jenis_barang = jenis_barang;
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

    public LocalDate getTanggal_transaksi() {
        return tanggal_transaksi;
    }

    public void setTanggal_transaksi(LocalDate tanggal_transaksi) {
        this.tanggal_transaksi = tanggal_transaksi;
    }

    public double getJumlah() {
        return jumlah;
    }

    public void setJumlah(double jumlah) {
        this.jumlah = jumlah;
    }
    
    
}
