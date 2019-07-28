/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.DBHandler;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author ravi
 */
public class BarangDAO {
    //Method Insert
    public static void insertBarang(String nama_barang, String merk_barang, String tipe_barang,
            LocalDate tanggal_masuk_gudang, String satuan_barang, double stok_awal) throws ClassNotFoundException{
        //Perintah Query
        String qInsertBarang = "INSERT INTO `wh`.`m_barang` (`nama_barang`, `merk_barang`, "
                + "`tipe_barang`, `masuk_gudang`, `satuan_barang`, `stok_barang`) VALUES "
                + "('"+nama_barang+"', '"+merk_barang+"', '"+tipe_barang+"', '"+tanggal_masuk_gudang+"', "
                + "'"+satuan_barang+"', '"+stok_awal+"');";
        try {
            DBHandler.dbExecuteUpdate(qInsertBarang);
        } catch (SQLException e) {
            System.out.println("Ada kesalahan saat insert data " + e);
        }
    }
    
    //Method Delete
    public static void deleteBarang(String id_barang) throws ClassNotFoundException{
        //Perintah query
        String qHapusBarang = "DELETE FROM `wh`.`m_barang` WHERE `id_barang` = '"+id_barang+"'";
        try {
            DBHandler.dbExecuteUpdate(qHapusBarang);
        } catch (SQLException e) {
            System.out.println("Ada kesalahan saat hapus data " + e);
        }
    }
    
    //Method Update
    public static void updateBarang(String nama_barang, String merk_barang, String tipe_barang,
            LocalDate tanggal_masuk_barang, String satuan_barang, double stok_awal, String colTriggerUpdate){
        //Perintah Query
        String qUpdateBarang = "UPDATE `wh`.`m_barang` SET `nama_barang`='"+nama_barang+"',"
                + "`merk_barang`='"+merk_barang+"', `tipe_barang`='"+tipe_barang+"',"
                + "`masuk_gudang`='"+tanggal_masuk_barang+"', `satuan_barang`='"+satuan_barang+"',"
                + "`stok_barang`='"+stok_awal+"' WHERE id_barang='"+colTriggerUpdate+"';";
    }
}
