/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.jfoenix.controls.JFXTextField;
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
    private ComboBox<?> comboNamaBarang;
    @FXML
    private ComboBox<?> comboMerkBarang;
    @FXML
    private JFXTextField fieldStokAwal;
    @FXML
    private ComboBox<?> comboSatuanBarang;
    @FXML
    private Button btnSimpanEditBarang;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
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
    private void btnSimpanEditBarangAction(ActionEvent event) {
    }
    
}
