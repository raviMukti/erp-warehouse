/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DBHandler;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.animation.Animation;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.control.TitledPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Duration;

/**
 * FXML Controller class
 *
 * @author ravi
 */
public class DashboardController implements Initializable {

    @FXML
    private Button btnMasterKaryawan;
    @FXML
    private Button btnMasterSupplier;
    @FXML
    private Button btnMasterBarang;
    @FXML
    private Button btnTransBarangMasuk;
    @FXML
    private Button btnTransBarangKeluar;
    @FXML
    private Button btnInfoStok;
    @FXML
    private Button btnLapPenerimaan;
    @FXML
    private Button btnLapPengeluaran;
    @FXML
    private ImageView fotoProfil;
    @FXML
    private Button btnKeluar;
    @FXML
    private Label labelTanggal;
    @FXML
    private Label labelNamaUser;
    @FXML
    private LineChart<?, ?> lineChart;
    @FXML
    private NumberAxis jumlahPenjualan;
    @FXML
    private CategoryAxis bulanPenjualan;
    @FXML
    private Button btnSettingHakAkses;
    @FXML
    private TitledPane titleDataMaster;
    @FXML
    private TitledPane titleTransaksi;
    @FXML
    private TitledPane titleLaporan;
    @FXML
    private TitledPane titleProfil;
    @FXML
    private TitledPane titlePengaturan;
    @FXML
    private Button btnCatatanMutasi;
    @FXML
    private Button btnGantiPassword;
    
    private int minute;
    private int hour;
    private int second;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        realTime();
    }    

    @FXML
    private void btnMasterKaryawanAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/FormMasterKaryawan.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Master Karyawan");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnMasterSupplierAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/FormMasterSupplier.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Master Supplier");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnMasterBarangAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/FormMasterBarang.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Master Barang");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnTransBarangMasukAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/TransBarangMasuk.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Transaki Barang Masuk");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnTransBarangKeluarAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/TransBarangKeluar.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Transaksi Barang Keluar");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }


    @FXML
    private void btnInfoStokAction(ActionEvent event) {
    }

    @FXML
    private void btnLapPenerimaanAction(ActionEvent event) {
    }

    @FXML
    private void btnLapPengeluaranAction(ActionEvent event) {
    }


    @FXML
    private void btnKeluarAction(ActionEvent event) {
        // Membuat dialog box konfirmasi
        Alert alertBatal = new Alert(Alert.AlertType.CONFIRMATION);
        alertBatal.setTitle("WareHouse - Konfirmasi Keluar");
        alertBatal.setHeaderText("Keluar Aplikasi");
        alertBatal.setContentText("Apakah anda yakin akan Keluar?");
        Optional<ButtonType> konfirmasiBatal = alertBatal.showAndWait();
        if(konfirmasiBatal.get() == ButtonType.OK){
            System.exit(1);
        }
    }

    @FXML
    private void btnSettingHakAksesAction(ActionEvent event) {
    }

    @FXML
    private void btnCatatanMutasiAction(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/View/FormMutasiBarang.fxml"));
        Parent root = (Parent) loader.load();
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setResizable(false);
        stage.getIcons().add(new Image("/Resources/icons8-depot-64.png"));
        stage.setTitle("Catatan Mutasi");
        stage.setScene(scene);
        stage.setOnCloseRequest((event1) -> {
            event1.consume();
        });
        stage.showAndWait();
    }

    @FXML
    private void btnGantiPasswordAction(ActionEvent event) {
    }
    
    public void cekHakAkses(String user) throws ClassNotFoundException{
        try {
            Connection connection = DBHandler.getConnection();
            ResultSet rs = connection.createStatement().executeQuery("SELECT * FROM m_hak_akses WHERE nip = '"+user+"'");
            while (rs.next()) {                
                boolean m1 = rs.getBoolean("menu_master");
                titleDataMaster.setVisible(m1);
                boolean m2 = rs.getBoolean("menu_transaksi");
                titleTransaksi.setVisible(m2);
                boolean m3 = rs.getBoolean("menu_laporan");
                titleLaporan.setVisible(m3);
                boolean m4 = rs.getBoolean("menu_profil");
                titleProfil.setVisible(m4);
                boolean m5 = rs.getBoolean("menu_hak_akses");
                titlePengaturan.setVisible(m5);
            }
        } catch (SQLException e) {
            System.out.println("Aduh ada kendala nih, iya kendala, putra petir " + e);
        }
    }
    
    //Untuk mengambil nilai nama user pada form login
    public void setNamaUserDashboard(String nama){
        this.labelNamaUser.setText(nama);
    }
    
    //Untuk menampilkan tanggal dan waktu realtime saat aplikasi dijalankan
    private void realTime(){
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        Timeline clock = new Timeline(new KeyFrame(Duration.ZERO, e -> {        
        second = LocalDateTime.now().getSecond();
        minute = LocalDateTime.now().getMinute();
        hour = LocalDateTime.now().getHour();
        labelTanggal.setText(dateFormat.format(date) + "  --  " +hour + ":" + (minute) + ":" + second);
    }),
         new KeyFrame(Duration.seconds(1))
    );
    clock.setCycleCount(Animation.INDEFINITE);
    clock.play();
    }
}
