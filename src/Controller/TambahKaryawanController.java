/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DBHandler;
import java.io.File;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import javafx.scene.control.TextField;
import javafx.stage.FileChooser;
import javafx.stage.FileChooser.ExtensionFilter;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class TambahKaryawanController implements Initializable {

    @FXML
    private Button btnSimpanKaryawan;
    @FXML
    private Button btnBatal;
    @FXML
    private TextField fieldNamaKaryawan;
    @FXML
    private ComboBox<String> comboJabatan;
    @FXML
    private ComboBox<String> comboDivisi;
    @FXML
    private ComboBox<String> comboAreaKerja;
    @FXML
    private Button btnUploadBerkas;
    @FXML
    private DatePicker masukDatePicker;
    @FXML
    private DatePicker akhirDatePicker;

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
            initCombobox();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TambahKaryawanController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    

    @FXML
    private void btnSimpanKaryawanAction(ActionEvent event) {
    }

    @FXML
    private void btnBatalAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Batal");
        alertBatal.setHeaderText("Batal Tambah Karyawan");
        alertBatal.setContentText("Apakah anda yakin akan membatalkan penambahan karyawan?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnBatal.getScene().getWindow().hide();
        }
    }

    @FXML
    private void btnUploadBerkasAction(ActionEvent event) {
        FileChooser fc = new FileChooser();
        File selectedFile = fc.showOpenDialog(null);
        fc.getExtensionFilters().addAll(new ExtensionFilter("Image File", "*.jpg"));
        String nama = selectedFile.getAbsoluteFile().getName();
        btnUploadBerkas.setText(nama);
    }
    
    public void initCombobox() throws ClassNotFoundException{
        String sql1 = "SELECT nama_level FROM `t_level_karyawan`";
        String sql2 = "SELECT nama_departemen FROm `t_departemen`";
        String sql3 = "SELECT nama_area FROM `t_area_kerja`";
        
        try {
            //Untuk combo level karyawan
            conn = DBHandler.getConnection();
            ps = conn.prepareStatement(sql1);
            rs = ps.executeQuery();
            while (rs.next()) {                
                comboJabatan.getItems().addAll(rs.getString("nama_level"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi kesalahan saat retrieve dari databasse " + e);
        }
        
        try {
            //Untuk combo divisi karyawan
            conn = DBHandler.getConnection();
            ps = conn.prepareStatement(sql2);
            rs = ps.executeQuery();
            while (rs.next()) {                
                comboDivisi.getItems().addAll(rs.getString("nama_departemen"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi kesalahan saat retrieve dari databasse " + e);
        }
        
        try {
            //Untuk combo area kerja karyawan
            conn = DBHandler.getConnection();
            ps = conn.prepareStatement(sql3);
            rs = ps.executeQuery();
            while (rs.next()) {                
                comboAreaKerja.getItems().addAll(rs.getString("nama_area"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Terjadi kesalahan saat retrieve dari databasse " + e);
        }
    }
    
}
