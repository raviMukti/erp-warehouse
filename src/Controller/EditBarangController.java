/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BarangDAO;
import Database.DBHandler;
import com.jfoenix.controls.JFXTextField;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Optional;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class EditBarangController implements Initializable {

    @FXML
    private Button btnBatal;
    @FXML
    private DatePicker masukGudangDatePicker;
    @FXML
    private JFXTextField fieldTipeBarang;
    @FXML
    private ComboBox<String> comboNamaBarang;
    @FXML
    private ComboBox<String> comboMerkBarang;
    @FXML
    private JFXTextField fieldStokAwal;
    @FXML
    private ComboBox<String> comboSatuanBarang;
    @FXML
    private Button btnSimpanEditBarang;
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String str = FormMasterBarangController.idBarangGlobal;
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            // TODO
            initComboBox();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditBarangController.class.getName()).log(Level.SEVERE, null, ex);
        }
        //Mengambil nilai dari controller formMasterBarang
    }    


    @FXML
    private void btnBatalAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Batal");
        alertBatal.setHeaderText("Batal Edit Barang");
        alertBatal.setContentText("Apakah anda yakin akan membatalkan perubahan barang?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnBatal.getScene().getWindow().hide();
        }
    }

    @FXML
    private void btnSimpanEditBarangAction(ActionEvent event) throws ClassNotFoundException {
        if (comboNamaBarang.getValue().isEmpty() || comboMerkBarang.getValue().isEmpty() || fieldTipeBarang.getText().isEmpty()
                || masukGudangDatePicker.getValue().toString().isEmpty() || comboSatuanBarang.getValue().isEmpty()
                || fieldStokAwal.getText().isEmpty()) {
           //Muncul Pesan Warning
            Alert fieldKosong = new Alert(Alert.AlertType.WARNING);
            fieldKosong.setTitle("Perhatian");
            fieldKosong.setHeaderText("Form Kosong");
            fieldKosong.setContentText("Harap Mengisi Semua Field !!!");
            fieldKosong.showAndWait();
        } else {
            BarangDAO.updateBarang(comboNamaBarang.getValue(), comboMerkBarang.getValue(),
                    fieldTipeBarang.getText(), masukGudangDatePicker.getValue(),
                    comboSatuanBarang.getValue(), Double.valueOf(fieldStokAwal.getText()), str);
            // Menampilkan dialog box informasi
            Alert alertSimpan = new Alert(Alert.AlertType.INFORMATION);
            alertSimpan.setTitle("WareHouse App - Informasi");
            alertSimpan.setHeaderText("Informasi Update Data");
            alertSimpan.setContentText("Berhasil Update Data!");
            alertSimpan.showAndWait();
            //Refresh FormMasterBarang
            FormMasterBarangController.getInstance().fetchKolomDatabase();
            FormMasterBarangController.getInstance().btnHapusEditDisable();
            btnSimpanEditBarang.getScene().getWindow().hide();
        }
    }
    
    public void initDataEdit(String id_barang) throws SQLException, ClassNotFoundException{
        try {
            Connection con = DBHandler.getConnection();
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `wh`.`m_barang` WHERE `id_barang`="
                    + "'"+id_barang+"'");
            while (rs.next()) {
                String val1 = rs.getString("nama_barang");
                comboNamaBarang.setValue(val1);
                String val2 = rs.getString("merk_barang");
                comboMerkBarang.setValue(val2);
                String add1 = rs.getString("tipe_barang");
                fieldTipeBarang.setText(add1);
                LocalDate add2 = rs.getDate("masuk_gudang").toLocalDate();
                masukGudangDatePicker.setValue(add2);
                String val3 = rs.getString("satuan_barang");
                comboSatuanBarang.setValue(val3);
                double add3 = rs.getDouble("stok_barang");
                String str = String.valueOf(add3);
                fieldStokAwal.setText(str);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Gagal ambil data yang dimaksud " + e);
        }
    }
    
     public void initComboBox() throws ClassNotFoundException{
        String sql1 = "SELECT nama_barang FROM m_barang";
        String sql2 = "SELECT nama_merk FROM t_merk_barang";
        String sql3 = "SELECT nama_satuan FROM t_satuan_barang";
        //Untuk combo nama barang
        try {
            conn = DBHandler.getConnection();
            ps = conn.prepareStatement(sql1);
            rs = ps.executeQuery();
            while (rs.next()) {                
                comboNamaBarang.getItems().addAll(rs.getString("nama_barang"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi kesalahan saat retrieve dari databasse " + e);
        }
        
        //Untuk  combo merk barang
        try {
            conn = DBHandler.getConnection();
            ps = conn.prepareStatement(sql2);
            rs = ps.executeQuery();
            while (rs.next()) {                
                comboMerkBarang.getItems().addAll(rs.getString("nama_merk"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi kesalahan saat retrieve dari databasse " + e);
        }
        
        //Untuk combo satuan barang
        try {
            conn = DBHandler.getConnection();
            ps = conn.prepareStatement(sql3);
            rs = ps.executeQuery();
            while (rs.next()) {                
                comboSatuanBarang.getItems().addAll(rs.getString("nama_satuan"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi kesalahan saat retrieve dari databasse " + e);
        }
    }
}
