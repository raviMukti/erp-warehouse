/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SupplierDAO;
import Database.DBHandler;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class EditSupplierController implements Initializable {

    @FXML
    private Button btnBatal;
    @FXML
    private Button btnSimpanSupplier;
    @FXML
    private ComboBox<Boolean> comboStatusAktif;
    @FXML
    private JFXTextArea textAlamatSupplier;
    @FXML
    private JFXTextField fieldNamaSupplier;
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String str = FormMasterSupplierController.idSupplierGlobal;
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        ObservableList<Boolean> aktif = FXCollections.observableArrayList(
                FALSE,
                TRUE
        );
        
        comboStatusAktif.setItems(aktif);
    }    


    @FXML
    private void btnBatalAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Batal");
        alertBatal.setHeaderText("Batal Edit Supplier");
        alertBatal.setContentText("Apakah anda yakin akan membatalkan perubahan Supplier?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnBatal.getScene().getWindow().hide();
        }
    }

    @FXML
    private void btnSimpanSupplierAction(ActionEvent event) throws ClassNotFoundException {
        if (fieldNamaSupplier.getText().isEmpty()||textAlamatSupplier.getText().isEmpty()||comboStatusAktif.getValue()
                .toString().isEmpty()) {
            //Muncul Pesan Warning
            Alert fieldKosong = new Alert(Alert.AlertType.WARNING);
            fieldKosong.setTitle("Perhatian");
            fieldKosong.setHeaderText("Form Kosong");
            fieldKosong.setContentText("Harap Mengisi Semua Field !!!");
            fieldKosong.showAndWait();
        } else {
            int val = comboStatusAktif.getValue() ? 1 : 0;
            SupplierDAO.updateSupplier(fieldNamaSupplier.getText(), textAlamatSupplier.getText(), 
                    val, str);
            // Menampilkan dialog box informasi
            Alert alertSimpan = new Alert(Alert.AlertType.INFORMATION);
            alertSimpan.setTitle("WareHouse App - Informasi");
            alertSimpan.setHeaderText("Informasi Update Data");
            alertSimpan.setContentText("Berhasil Update Data!");
            alertSimpan.showAndWait();
            //Refresh FormMasterBarang
            FormMasterSupplierController.getInstance().fetchKolomDatabase();
            FormMasterSupplierController.getInstance().btnHapusEditDisable();
            btnSimpanSupplier.getScene().getWindow().hide();
        }
    }
    
    public void initDataEdit(String id_supplier) throws ClassNotFoundException{
        try {
            Connection conn = DBHandler.getConnection();
            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM `wh`.`m_supplier` WHERE `id_supplier`"
                    + "='"+id_supplier+"'");
            while (rs.next()) {                
                String data1 = rs.getString("nama_supplier");
                fieldNamaSupplier.setText(data1);
                String data2 = rs.getString("alamat_supplier");
                textAlamatSupplier.setText(data2);
                boolean data3 = rs.getBoolean("is_aktif");
                comboStatusAktif.setValue(data3);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal mengambil data " + e);
        }
    }
}
