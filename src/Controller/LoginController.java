/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DBHandler;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

/**
 *
 * @author ravi
 */
public class LoginController implements Initializable {
    
    private Label label;
    @FXML
    private JFXTextField fieldUserName;
    @FXML
    private JFXPasswordField fieldPassword;
    @FXML
    private JFXButton btnLogin;
    @FXML
    private JFXComboBox<?> comboDB;
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void btnLoginAction(ActionEvent event) throws IOException, ClassNotFoundException, SQLException {
        if (fieldUserName.getText().isEmpty()||fieldPassword.getText().isEmpty()) {
            Alert fieldKosong = new Alert(Alert.AlertType.WARNING);
            fieldKosong.setTitle("Perhatian");
            fieldKosong.setHeaderText("Form Kosong");
            fieldKosong.setContentText("Harap Mengisi Semua Field !!!");
            fieldKosong.showAndWait();
        } else {
            String userLogin = fieldUserName.getText().toLowerCase();
            String passLogin = fieldPassword.getText().toLowerCase();
            String query = "SELECT * FROM `m_karyawan` WHERE `nama_karyawan` = ? AND `password` = ?";
            try {
                conn = DBHandler.getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, userLogin);
                ps.setString(2, passLogin);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String nip = rs.getString("nip");
                    FXMLLoader loader = new FXMLLoader();
                    loader.setLocation(getClass().getResource("/View/Dashboard.fxml"));
                    Parent root = (Parent) loader.load();
                    DashboardController controll = loader.getController();
                    controll.setNamaUserDashboard(fieldUserName.getText().toUpperCase());
                    controll.cekHakAkses(nip);
                    Stage stage = new Stage();
                    Scene scene = new Scene(root);
                    stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
                    stage.setTitle("WareHouse App - Dashboard");
                    stage.setScene(scene);
                    stage.setMaximized(true);
                    stage.setOnCloseRequest((event1) -> {
                        // Membuat dialog box konfirmasi
                        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
                        alertBatal.setTitle("WareHouse - Konfirmasi Keluar");
                        alertBatal.setHeaderText("Keluar Aplikasi");
                        alertBatal.setContentText("Apakah anda yakin akan Keluar?");
                        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
                        if (konfirmasiBatal.get() == ButtonType.OK) {
                            System.exit(1);
                        } else {
                            event1.consume();
                        }
                    });
                    stage.show();
                    btnLogin.getScene().getWindow().hide();
                } else {
                    JOptionPane.showMessageDialog(null, "User/Password salah");
                }
            } catch (SQLException e) {
                System.out.println("Ada kesalahan pada database silakan hubungi administrator anda" + e);
            }
        }
    }

    @FXML
    private void langsungLogin(ActionEvent event) throws IOException, ClassNotFoundException, SQLException {
        btnLoginAction(event);
    }
      
}
