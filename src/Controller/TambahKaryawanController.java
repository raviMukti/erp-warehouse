/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.net.URL;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;

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
    private ComboBox<?> comboJabatan;
    @FXML
    private ComboBox<?> comboDivisi;
    @FXML
    private ComboBox<?> comboAreaKerja;
    @FXML
    private ComboBox<?> comboStatusKerja;
    @FXML
    private Button btnUploadBerkas;
    @FXML
    private DatePicker masukDatePicker;
    @FXML
    private DatePicker akhirDatePicker;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
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
    }
    
}
