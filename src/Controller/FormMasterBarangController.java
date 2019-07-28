/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DBHandler;
import Model.Barang;
import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Optional;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
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
import javafx.scene.control.cell.PropertyValueFactory;
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
public class FormMasterBarangController implements Initializable {

    @FXML
    private JFXTextField fieldCari;
    @FXML
    private ImageView btnCari;
    @FXML
    private Button btnKembali;
    @FXML
    private Button btnTambahBarang;
    @FXML
    private Button btnHapusBarang;
    @FXML
    private Button btnEditBarang;
    @FXML
    private TableView<Barang> tableMasterBarang;
    @FXML
    private TableColumn<Barang, String> colIdBarang;
    @FXML
    private TableColumn<Barang, String> colNamaBarang;
    @FXML
    private TableColumn<Barang, String> colMerkBarang;
    @FXML
    private TableColumn<Barang, String> colTipeBarang;
    @FXML
    private TableColumn<Barang, String> colSatuanBarang;
    @FXML
    private TableColumn<Barang, String> colStokBarang;
    @FXML
    private TableColumn<Barang, String> colMasukBarang;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        initKolom();
        try {
            fetchKolomDatabase();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormMasterBarangController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Method untuk membuat instance agar  method  yg ada di controller ini bisa digunakan oleh controller lain
    private static FormMasterBarangController instance;
    
    public FormMasterBarangController(){
        instance =  this;
    }
    
    public static FormMasterBarangController getInstance(){
        return instance;
    }
    

    @FXML
    private void fieldCariAction(ActionEvent event) {
    }

    @FXML
    private void btnCariAction(MouseEvent event) {
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

    @FXML
    private void btnTambahBarangAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/TambahBarang.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Tambah Barang");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnHapusBarangAction(ActionEvent event) {
    }

    @FXML
    private void btnEditBarangAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/EditBarang.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Edit Barang");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }
    //mengisi nilai model barang pada kolom table master barang
    void initKolom(){
        colIdBarang.setCellValueFactory(new PropertyValueFactory<>("id_barang"));
        colNamaBarang.setCellValueFactory(new PropertyValueFactory<>("nama_barang"));
        colMerkBarang.setCellValueFactory(new PropertyValueFactory<>("merk_barang"));
        colTipeBarang.setCellValueFactory(new PropertyValueFactory<>("tipe_barang"));
        colMasukBarang.setCellValueFactory(new PropertyValueFactory<>("tanggal_masuk_gudang"));
        colSatuanBarang.setCellValueFactory(new PropertyValueFactory<>("satuan_barang"));
        colStokBarang.setCellValueFactory(new PropertyValueFactory<>("stok_barang"));
    }
    
    //mengambil dan mengisi nilai kolom model barang dengan data dari database
    void fetchKolomDatabase() throws ClassNotFoundException{
        ObservableList<Barang> listBarang = FXCollections.observableArrayList();
        listBarang.removeAll(listBarang);
        try {
            Connection con = DBHandler.getConnection();
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `wh`.`m_barang`;");
            while (rs.next()) {                
                listBarang.add(new Barang(rs.getInt("id_barang"), 
                        rs.getString("nama_barang"), rs.getString("merk_barang"),
                        rs.getString("tipe_barang"), rs.getString("satuan_barang"), rs.getDouble("stok_barang"),
                        rs.getDate("masuk_gudang").toLocalDate()));
            }
        } catch (SQLException e) {
            System.out.println("Gagal memuat data " + e);
        }
        tableMasterBarang.setItems(listBarang);
    }

    @FXML
    private void btnHapusAktif(MouseEvent event) {
        btnHapusBarang.setDisable(false);
        btnEditBarang.setDisable(false);
    }
    
    //mencegah user langsung menghapus tanpa klik kolom tabel
    public void btnHapusEditDisable(){
        btnHapusBarang.setDisable(true);
        btnEditBarang.setDisable(true);
    }
}








