/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.FileInputStream;
import java.time.LocalDate;

/**
 *
 * @author ravi
 */
public class Karyawan {
    int nip;
    String nama_karyawan, password_karyawan, level_karyawan, departemen_karyawan, area_kerja;
    LocalDate mulai_kerja, akhir_kerja;
    FileInputStream fotoProfil;
    boolean isAktif;

    public Karyawan(int nip, String nama_karyawan, String password_karyawan, String level_karyawan, String departemen_karyawan, String area_kerja, LocalDate mulai_kerja, LocalDate akhir_kerja, FileInputStream fotoProfil, boolean isAktif) {
        this.nip = nip;
        this.nama_karyawan = nama_karyawan;
        this.password_karyawan = password_karyawan;
        this.level_karyawan = level_karyawan;
        this.departemen_karyawan = departemen_karyawan;
        this.area_kerja = area_kerja;
        this.mulai_kerja = mulai_kerja;
        this.akhir_kerja = akhir_kerja;
        this.fotoProfil = fotoProfil;
        this.isAktif = isAktif;
    }

    public String getPassword_karyawan() {
        return password_karyawan;
    }

    public void setPassword_karyawan(String password_karyawan) {
        this.password_karyawan = password_karyawan;
    }
    
    
    public int getNip() {
        return nip;
    }

    public void setNip(int nip) {
        this.nip = nip;
    }

    public String getNama_karyawan() {
        return nama_karyawan;
    }

    public void setNama_karyawan(String nama_karyawan) {
        this.nama_karyawan = nama_karyawan;
    }

    public String getLevel_karyawan() {
        return level_karyawan;
    }

    public void setLevel_karyawan(String level_karyawan) {
        this.level_karyawan = level_karyawan;
    }

    public String getDepartemen_karyawan() {
        return departemen_karyawan;
    }

    public void setDepartemen_karyawan(String departemen_karyawan) {
        this.departemen_karyawan = departemen_karyawan;
    }

    public String getArea_kerja() {
        return area_kerja;
    }

    public void setArea_kerja(String area_kerja) {
        this.area_kerja = area_kerja;
    }

    public LocalDate getMulai_kerja() {
        return mulai_kerja;
    }

    public void setMulai_kerja(LocalDate mulai_kerja) {
        this.mulai_kerja = mulai_kerja;
    }

    public LocalDate getAkhir_kerja() {
        return akhir_kerja;
    }

    public void setAkhir_kerja(LocalDate akhir_kerja) {
        this.akhir_kerja = akhir_kerja;
    }

    public FileInputStream getFotoProfil() {
        return fotoProfil;
    }

    public void setFotoProfil(FileInputStream fotoProfil) {
        this.fotoProfil = fotoProfil;
    }

    public boolean isIsAktif() {
        return isAktif;
    }

    public void setIsAktif(boolean isAktif) {
        this.isAktif = isAktif;
    }
    
    
}
