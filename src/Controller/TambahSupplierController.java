/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SupplierDAO;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import java.net.URL;
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

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class TambahSupplierController implements Initializable {

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
        comboStatusAktif.setValue(TRUE);
    }    


    @FXML
    private void btnBatalAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Batal");
        alertBatal.setHeaderText("Batal Tambah Supplier");
        alertBatal.setContentText("Apakah anda yakin akan membatalkan penambahan supplier?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnBatal.getScene().getWindow().hide();
        }
    }

    @FXML
    private void btnSimpanSupplierAction(ActionEvent event) throws ClassNotFoundException {
        if (fieldNamaSupplier.getText().isEmpty()||textAlamatSupplier.getText().isEmpty()
                ||comboStatusAktif.getValue().toString().isEmpty()) {
            //Muncul Pesan Warning
            Alert fieldKosong = new Alert(Alert.AlertType.WARNING);
            fieldKosong.setTitle("Perhatian");
            fieldKosong.setHeaderText("Form Kosong");
            fieldKosong.setContentText("Harap Mengisi Semua Field !!!");
            fieldKosong.showAndWait();
        } else {
            SupplierDAO.insertSupplier(fieldNamaSupplier.getText(), textAlamatSupplier.getText());
            // Menampilkan dialog box informasi
            Alert alertSimpan = new Alert(Alert.AlertType.INFORMATION);
            alertSimpan.setTitle("WareHouse App - Informasi");
            alertSimpan.setHeaderText("Informasi Simpan Data");
            alertSimpan.setContentText("Simpan data ke database berhasil !");
            alertSimpan.showAndWait();
            btnSimpanSupplier.getScene().getWindow().hide();
            FormMasterSupplierController.getInstance().fetchKolomDatabase();
            FormMasterSupplierController.getInstance().btnHapusEditDisable();
        }
    }
    
    
}
