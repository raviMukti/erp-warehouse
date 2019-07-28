/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class FormMasterKaryawanController implements Initializable {

    @FXML
    private JFXTextField fieldCari;
    @FXML
    private ImageView btnCari;
    @FXML
    private Button btnTambahKaryawan;
    @FXML
    private Button btnHapusKaryawan;
    @FXML
    private Button btnEditKaryawan;
    @FXML
    private Button btnKembali;
    @FXML
    private TableView<?> tableMasterKaryawan;
    @FXML
    private TableColumn<?, ?> colNip;
    @FXML
    private TableColumn<?, ?> colNamaKaryawan;
    @FXML
    private TableColumn<?, ?> colJabatanKaryawan;
    @FXML
    private TableColumn<?, ?> colDivisiKaryawan;
    @FXML
    private TableColumn<?, ?> colAreaKaryawan;
    @FXML
    private TableColumn<?, ?> colMulaiKerja;
    @FXML
    private TableColumn<?, ?> colAkhirKerja;
    @FXML
    private TableColumn<?, ?> colStatusKaryawan;
    @FXML
    private TableColumn<?, ?> colFotoKaryawan;

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
    private void btnTambahKaryawanAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/TambahKaryawan.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Tambah Karyawan");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnHapusKaryawanAction(ActionEvent event) {
    }

    @FXML
    private void btnEditKaryawanAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/EditKaryawan.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Edit Karyawan");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
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
