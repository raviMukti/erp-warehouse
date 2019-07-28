/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.DBHandler;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author ravi
 */
public class SupplierDAO {
    //method insert
    public static void insertSupplier(String nama_supplier, String alamat_supplier) throws ClassNotFoundException{
        String qInsertSupplier = "INSERT INTO `wh`.`m_supplier` (`nama_supplier`, `alamat_supplier`) "
                + "VALUES ('"+nama_supplier+"', '"+alamat_supplier+"');";
        try {
            DBHandler.dbExecuteUpdate(qInsertSupplier);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal Simpan Data Supplier" + e);
        }
    }
    
    //method delete
    public static void deleteSupplier(String id_supplier) throws ClassNotFoundException{
        String qDeleteSupplier = "DELETE FROM `wh`.`m_supplier` WHERE `id_supplier` = '"+id_supplier+"';";
        try {
            DBHandler.dbExecuteUpdate(qDeleteSupplier);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal Hapus Data " + e);
        }
    }
    
    //method Update
    public static void updateSupplier(String nama_supplier, String alamat_supplier, int isAktif, 
            String colIdTrigger) throws ClassNotFoundException{
        String qUpdateSupplier = "UPDATE `wh`.`m_supplier` SET `nama_supplier`='"+nama_supplier+"',"
                + "`alamat_supplier`='"+alamat_supplier+"', `is_aktif`='"+isAktif+"' "
                + "WHERE id_supplier='"+colIdTrigger+"';";
        try {
            DBHandler.dbExecuteUpdate(qUpdateSupplier);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal Update Supplier" + e);
        }
    }
}
