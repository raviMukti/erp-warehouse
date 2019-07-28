/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DBHandler;
import Model.Barang;
import Model.Supplier;
import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class FormMasterSupplierController implements Initializable {

    @FXML
    private JFXTextField fieldCari;
    @FXML
    private ImageView btnCari;
    @FXML
    private Button btnKembali;
    @FXML
    private Button btnTambahSupplier;
    @FXML
    private Button btnHapusSupplier;
    @FXML
    private Button btnEditSupplier;
    @FXML
    private TableView<Supplier> tableMasterSupplier;
    @FXML
    private TableColumn<Supplier, String> colIdSupplier;
    @FXML
    private TableColumn<Supplier, String> colNamaSupplier;
    @FXML
    private TableColumn<Supplier, String> colAlamatSupplieir;
    @FXML
    private TableColumn<Supplier, String> colStatusSupplier;

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
            Logger.getLogger(FormMasterSupplierController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
    
    private static FormMasterSupplierController instance;
    public FormMasterSupplierController(){
        instance = this;
    }
    public static FormMasterSupplierController getInstance(){
        return instance;
    }
    
    public static String idSupplierGlobal;
    
    @FXML
    private void fieldCariAction(ActionEvent event) {
    }

    @FXML
    private void btnCariAction(MouseEvent event) {
    }

    @FXML
    private void btnTambahSupplierAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/TambahSupplier.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Tambah Supplier");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnHapusSupplierAction(ActionEvent event) {
    }

    @FXML
    private void btnEditSupplierAction(ActionEvent event) throws IOException, ClassNotFoundException {
        idSupplierGlobal = String.valueOf(tableMasterSupplier.getSelectionModel().getSelectedItem().getId_supplier());
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/EditSupplier.fxml"));
        Parent root = (Parent) loader.load();
        EditSupplierController ctrl = loader.getController();
        ctrl.initDataEdit(idSupplierGlobal);
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Edit Supplier");
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
    
    void initKolom(){
        colIdSupplier.setCellValueFactory(new PropertyValueFactory<>("id_supplier"));
        colNamaSupplier.setCellValueFactory(new PropertyValueFactory<>("nama_supplier"));
        colAlamatSupplieir.setCellValueFactory(new PropertyValueFactory<>("alamat_supplier"));
        colStatusSupplier.setCellValueFactory(new PropertyValueFactory<>("isAktif"));       
    }
    
    void fetchKolomDatabase() throws ClassNotFoundException{
        ObservableList<Supplier> listSupplier = FXCollections.observableArrayList();
        listSupplier.removeAll(listSupplier);
        try {
            Connection con = DBHandler.getConnection();
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM `wh`.`m_supplier`;");
            while (rs.next()) {                
                listSupplier.add(new Supplier(rs.getInt("id_supplier"), 
                        rs.getString("nama_supplier"), rs.getString("alamat_supplier"),
                        rs.getBoolean("is_aktif")));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal memuat data " + e);
        }
        tableMasterSupplier.setItems(listSupplier);
    }
    
}
