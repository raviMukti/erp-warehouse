/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.DBHandler;
import java.io.FileInputStream;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.swing.JOptionPane;

/**
 *
 * @author ravi
 */
public class KaryawanDAO {
    //Method Insert
    public static void insertKaryawan(String nama_karyawan, String level_karyawan, String departemen_karyawan,
            String area_kerja, LocalDate mulai_kerja, LocalDate akhir_kerja, FileInputStream fotoProfil
            ) throws ClassNotFoundException{
        String qInsertKaryawan = "INSERT INTO `m_karyawan` (`nama_karyawan`,"
                + "`level_karyawan`, `departemen`, `area_kerja`, `mulai_kerja`, `akhir_kerja`, "
                + "`foto_karyawan`) VALUES "
                + "('"+nama_karyawan+"', '"+level_karyawan+"', '"+departemen_karyawan+"', '"+area_kerja+"',"
                + " '"+mulai_kerja+"', '"+akhir_kerja+"', '"+fotoProfil+"')";
        try {
            DBHandler.dbExecuteUpdate(qInsertKaryawan);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal Simpan karyawan baru " + e);
        }
    }
    
    //Method hapus karyawan
    public static void deleteKaryawan(String nip) throws ClassNotFoundException{
        //Perintah query
        String qHapusKaryawan = "DELETE FROM `wh`.`m_karyawan` WHERE `nip` = '"+nip+"'";
        try {
            DBHandler.dbExecuteUpdate(qHapusKaryawan);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal menghapus data " + e);
        }
    }
    
    //method update karyawan
    public static void updateKaryawan(String nama_karyawan, String level_karyawan, String departemen_karyawan,
            String area_kerja, LocalDate mulai_kerja, LocalDate akhir_kerja, FileInputStream fotoProfil, String idTriger) throws ClassNotFoundException{
        //Perintah qUpdateKaryawan
        String qUpdateKaryawan = "UPDATE `wh`.`m_karyawan` SET `nama_karyawan`='"+nama_karyawan+"', "
                + "`level_karyawan`='"+level_karyawan+"', `departemen_karyawan`='"+departemen_karyawan+"',"
                + "`area_kerja`='"+area_kerja+"', `mulai_kerja`='"+mulai_kerja+"', `akhir_kerja`='"+akhir_kerja+"', "
                + "`foto_karyawan`='"+fotoProfil+"' WHERE nip='"+idTriger+"'";
        try {
            DBHandler.dbExecuteUpdate(qUpdateKaryawan);   
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal Update data " + e);
        }
    }
}
