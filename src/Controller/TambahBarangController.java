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
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.input.KeyEvent;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class TambahBarangController implements Initializable {

    @FXML
    private Button btnBatal;
    @FXML
    private Button btnSimpanBarang;
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
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            // TODO
            initComboBox();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TambahBarangController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    


    @FXML
    private void btnBatalAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Batal");
        alertBatal.setHeaderText("Batal Tambah Barang");
        alertBatal.setContentText("Apakah anda yakin akan membatalkan penambahan barang?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnBatal.getScene().getWindow().hide();
        }
    }

    @FXML
    private void btnSimpanBarangAction(ActionEvent event) throws ClassNotFoundException {
        //Validasi Form
        if (comboNamaBarang.getValue().isEmpty() || comboMerkBarang.getValue().isEmpty()
                || fieldTipeBarang.getText().isEmpty() || masukGudangDatePicker.getValue().toString().isEmpty()
                || comboSatuanBarang.getValue().isEmpty() || fieldStokAwal.getText().isEmpty()) {
            //Muncul Pesan Warning
            Alert fieldKosong = new Alert(Alert.AlertType.WARNING);
            fieldKosong.setTitle("Perhatian");
            fieldKosong.setHeaderText("Form Kosong");
            fieldKosong.setContentText("Harap Mengisi Semua Field !!!");
            fieldKosong.showAndWait();
        } else {
            //Simpan data ke database
            BarangDAO.insertBarang(comboNamaBarang.getValue(), comboMerkBarang.getValue(), 
                    fieldTipeBarang.getText(), masukGudangDatePicker.getValue(), comboSatuanBarang.getValue(), 
                    Double.valueOf(fieldStokAwal.getText()));
            // Menampilkan dialog box informasi
            Alert alertSimpan = new Alert(Alert.AlertType.INFORMATION);
            alertSimpan.setTitle("WareHouse App - Informasi");
            alertSimpan.setHeaderText("Informasi Simpan Data");
            alertSimpan.setContentText("Simpan data ke database berhasil !");
            alertSimpan.showAndWait();
            btnSimpanBarang.getScene().getWindow().hide();
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

    @FXML
    private void validasiAngka(KeyEvent event) {
        // Hanya membolehkan inputan Angka / Numerik
        fieldStokAwal.textProperty().addListener((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                fieldStokAwal.setText(newValue.replaceAll("[^\\d]", ""));
            }
        });
    }
}
