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
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class FormMutasiBarangController implements Initializable {

    @FXML
    private JFXTextField fieldCari;
    @FXML
    private ImageView btnCari;
    @FXML
    private Button btnCetakUlang;
    @FXML
    private Button btnHapusTransaksi;
    @FXML
    private Button btnEditTransaksi;
    @FXML
    private Button btnKembali;
    @FXML
    private TableView<?> tableMutasiBarang;
    @FXML
    private TableColumn<?, ?> colIdTransaksi;
    @FXML
    private TableColumn<?, ?> colJenisTransaksi;
    @FXML
    private TableColumn<?, ?> colTanggalTransaksi;
    @FXML
    private TableColumn<?, ?> colPetugas;
    @FXML
    private TableColumn<?, ?> colNamaBarang;
    @FXML
    private TableColumn<?, ?> colJenisBarang;
    @FXML
    private TableColumn<?, ?> colMerkBarang;
    @FXML
    private TableColumn<?, ?> colTipeBarang;
    @FXML
    private TableColumn<?, ?> colSatuanBarang;
    @FXML
    private TableColumn<?, ?> colJumlahBarang;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void fieldCariAction(ActionEvent event) {
    }

    @FXML
    private void btnCariAction(MouseEvent event) {
    }

    @FXML
    private void btnCetakUlangAction(ActionEvent event) {
    }

    @FXML
    private void btnHapusTransaksiAction(ActionEvent event) {
    }

    @FXML
    private void btnEditTransaksiAction(ActionEvent event) {
    }

    @FXML
    private void btnKembaliAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Kembali");
        alertBatal.setHeaderText("Kembali Ke Dashboard");
        alertBatal.setContentText("Apakah anda yakin akan kembali?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            btnKembali.getScene().getWindow().hide();
        }
    }
    
}
