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

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class TransBarangKeluarController implements Initializable {

    @FXML
    private Button btnCetakTransKeluar;
    @FXML
    private Button btnSimpanTransKeluar;
    @FXML
    private Button btnBatal;
    @FXML
    private ComboBox<?> comboJenisBarang;
    @FXML
    private ComboBox<?> comboTipeBarang;
    @FXML
    private ComboBox<?> comboMerkBarang;
    @FXML
    private ComboBox<?> comboDiKirimKe;
    @FXML
    private JFXTextField fieldNamaBarang;
    @FXML
    private ComboBox<?> comboSatuanBarang;
    @FXML
    private JFXTextField fieldJumlahBarang;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void btnCetakTransKeluarAction(ActionEvent event) {
    }

    @FXML
    private void btnSimpanTransKeluarAction(ActionEvent event) {
    }

    @FXML
    private void btnBatalAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Batal");
        alertBatal.setHeaderText("Batal Simpan Transaksi");
        alertBatal.setContentText("Apakah anda yakin akan membatalkan transaksi?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnBatal.getScene().getWindow().hide();
        }
    }
    
}
