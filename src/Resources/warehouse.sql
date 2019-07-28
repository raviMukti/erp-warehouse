/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.3.15-MariaDB : Database - wh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wh` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wh`;

/*Table structure for table `m_barang` */

DROP TABLE IF EXISTS `m_barang`;

CREATE TABLE `m_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) DEFAULT NULL,
  `merk_barang` varchar(255) NOT NULL,
  `tipe_barang` varchar(255) NOT NULL,
  `masuk_gudang` date DEFAULT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `stok_barang` double DEFAULT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `fk_merk_barang` (`merk_barang`),
  KEY `fk_satuan_barang` (`satuan_barang`),
  CONSTRAINT `fk_merk_barang` FOREIGN KEY (`merk_barang`) REFERENCES `t_merk_barang` (`nama_merk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_satuan_barang` FOREIGN KEY (`satuan_barang`) REFERENCES `t_satuan_barang` (`nama_satuan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `m_barang` */

insert  into `m_barang`(`id_barang`,`nama_barang`,`merk_barang`,`tipe_barang`,`masuk_gudang`,`satuan_barang`,`stok_barang`) values 
(1,'ROUTER','MIKROTIK','RB 750','2019-03-12','DUS',45),
(2,'MODEM','HUAWEII','HB340','2018-06-11','UNIT',100),
(3,'SWITCH HUB','TP LINK','24 PORT','2019-03-12','UNIT',30),
(4,'KABEL UTP','BELDEN','RJ 45','2019-03-19','ROLL',150);

/*Table structure for table `m_hak_akses` */

DROP TABLE IF EXISTS `m_hak_akses`;

CREATE TABLE `m_hak_akses` (
  `nip` int(11) NOT NULL,
  `menu_master` tinyint(1) NOT NULL DEFAULT 1,
  `menu_transaksi` tinyint(1) NOT NULL DEFAULT 1,
  `menu_laporan` tinyint(1) NOT NULL DEFAULT 1,
  `menu_profil` tinyint(1) NOT NULL DEFAULT 1,
  `menu_hak_akses` tinyint(1) NOT NULL DEFAULT 1,
  KEY `fk_nip` (`nip`),
  CONSTRAINT `fk_nip` FOREIGN KEY (`nip`) REFERENCES `m_karyawan` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_hak_akses` */

insert  into `m_hak_akses`(`nip`,`menu_master`,`menu_transaksi`,`menu_laporan`,`menu_profil`,`menu_hak_akses`) values 
(100000,1,1,1,1,1),
(100002,0,1,1,1,0);

/*Table structure for table `m_karyawan` */

DROP TABLE IF EXISTS `m_karyawan`;

CREATE TABLE `m_karyawan` (
  `nip` int(11) NOT NULL AUTO_INCREMENT,
  `nama_karyawan` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level_karyawan` varchar(255) NOT NULL,
  `departemen` varchar(255) NOT NULL,
  `area_kerja` varchar(255) NOT NULL,
  `mulai_kerja` date DEFAULT NULL,
  `akhir_kerja` date DEFAULT NULL,
  `foto_karyawan` blob DEFAULT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`nip`),
  KEY `fk_level_karyawan` (`level_karyawan`),
  KEY `fk_departemen` (`departemen`),
  KEY `fk_area_kerja` (`area_kerja`),
  CONSTRAINT `fk_area_kerja` FOREIGN KEY (`area_kerja`) REFERENCES `t_area_kerja` (`nama_area`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_departemen` FOREIGN KEY (`departemen`) REFERENCES `t_departemen` (`nama_departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_level_karyawan` FOREIGN KEY (`level_karyawan`) REFERENCES `t_level_karyawan` (`nama_level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100005 DEFAULT CHARSET=latin1;

/*Data for the table `m_karyawan` */

insert  into `m_karyawan`(`nip`,`nama_karyawan`,`password`,`level_karyawan`,`departemen`,`area_kerja`,`mulai_kerja`,`akhir_kerja`,`foto_karyawan`,`is_aktif`) values 
(100000,'ravi','123456','SUPERADMIN','IT','PUSAT','2017-01-01',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0���}\0\0\0xPLTEh�E���_�7f�B�����[�1c�>\\�3a�;e�@Y�.���������l�J����}�ar�R���ؚ��Ƈ�n��ܸޫ�Փ��Ґ�z���ρz�]�ш��q�ڠ��~�Քv�X�ٝ����M�\0\0IDATx��]�z�:4$v�e+���}�7�,��Xv4����LK�F��4�j�[�T��-7�q�[U\r��g��6KZ&�T��t���P�ݙ�Z\'zEb���al{#��K-#7�a;^���z�[|\r��vR��zD�ş���y�#�������UJo��v8��%&a�wc;x8�]�ە�]>�3>Co��v�H��B�xq��� �5�ۏG��*,�`��ţY^Q�[g;{�v�F�e��D?��\r��v�����\\���e�{*�JO�d;~u�ż�v�,���� �����(6�=��� �C��3y��\0����Jf�}{����^��v�|&�͏A��N���\\`w�����XK�`&l�O�}.��^����6�e�\\/�d;VuB�}g���������]E>�$����mxl�#z�Ě|6�LTC���cۍ�}�h}:��?�|�U,�����~�]v�!��ؾ�c[�|�$��7�8l����t˗��w�JFІ�6�8�}T����o��a���^���}��t�z/T�6�8�OݫG�~g��A-ۈ��t/���I����#zM��u���Kul7-���v��ۨ�@�l���B5l����5a�8�\\�-ej�l��%��د\Z� �������z��L��y[����F��ݿ����y�������c���K�i0�&�v��X���q^��b�o㥓����A�-��3UZ5c��m�S\\)�k\n����\r�����.�j�e�G�\rH��8@�V�O����\0�GH:��C�Ȧ�2�\Z�ȼ�tҁ�-�}��{��䰥>C0���l��I��\n��ɭ�{�~��v����\n�֣Nbs2B�B���/2)�S�Գ涐e�J��8�1�*-[�O,��z���-�}�Q��ȼb]l���P!F�pd��8�����#��.4�9�d�Z: ��-n��/l�d���^-��l���-\"x�.���睁R�F�\r�T�t@�E�iߙc�t��|���:$�K\0�����l��#�\Z�؅��&rT8�b����c�Ejr��A�%`l���/�ZU~.��\'���)��e����_x�8 ��n\r*X!��mX����%$X�.bR�a��dn�\0œ��2Us��V�b�-\"����� ��g��)5Y��Xe�>M����Zy��N�N�[�-bH�z��2B� /TT�-�]1ī���`�z�GTVA�!�������U�9�t�(wE:(��#�J`\nG<p��ڪAa�JЦ��[��*5�^�hR��s���[�� gF�CkV��mu�уBr%���-��r��Ej5���K�o7l!i��Qu�#	[*��q�;��P�˸�Z�.�D Y,��V:�c�T���8&bK�b�����~!ȲL��:Vuv�f��\n�W�~#cK��bV�F:��+�]#cG\'� r맡ݣ�Q/l1�XL�>![�y�KǸJ�lAi�8�0n@�6wO~0�=�@��p�β���pΡ]�W�}f�\r�r��Ϝ���uM\"���+(�)!s�����l���h�$l�H��^�镲%v�p1������߅���u�sX���u=�e�s*�y��i1[wS���g_g�xݚk�Y�b���E��:�\ZJR���/K��u�+<��؍JI�}��w��u���t���VP��;�d����u��PP�e\'��6JQ�[^�D̖Nl�L�y����\r�(�����E���hí2�-#9[�,I��Y�|ٺlyN9[W_���鮪�p1p���ߊ�;ʈɖ�)��n��\Z�%eK�l�������?\"<��,em����L���3�n��t?����[��-B�mQ�DZ^U��Q����\n�-���<]WT��/7S	����a�\nl2q��n�����7Qw��M���p#���ur���n)����l7��쥎���f���.N6�����Ƒ�DͽlW	�\0*s���k����50��T��/�����  \0I2h���P�z(9�R�*�F�/2�SY�L���B�.@�:=4Q\\������#M�L$F���4�q�T����R&��̶�x2�#%n�[y&[�O�8w0B�-�DB�d�x���@dG��݄nA(�V>�	|5���\r �klğƇ�T4�%;ETj��MΉ�2m�L���R�D��� �j�p����F?i���rޅ�t���]�ϸ�V�x]��d�R�:�	O&�_!fM৽�\"̅�K��wYN\\5��\'���������#��7Pu�����ssX��eH\\CEvh�iT+��j�?��mf�w��9*?�jgT�Y/⎊�F	=��i]��n��[��L\0�����lnq͈�5��5wҒŽ�y�ԳA\\t�rn0�b��)��.�[�(��懣t�)�{	���k��:�ӵ�&:s՘n�\'M����������!���%߬����#r��Z�i#S�?ȫ��j��\n�`�0��*�d�w�;�\r;���j�n�_���t\Z}�kj��rj���D8ߜ�!�*}�z�y||8�Nj���|IOS��`wQUy����[��~P/�3�\r�:?3l�%f��<�/Z\"�߬O��.���T���3�\rN�\Z�.�H=��x��k�;�N�׃Hp�H����ddjWG��B���dg�0�����|�\0��f�_�O2�m��}搔�D�i_�_d�����b��Μ�P�i3ڼ������2�{�]���4w7S]��	Z��.7����\\p�p���-����b�ݝ�����s��.V��c��䛿��GAE��y��\Z���UB�7����T2�()8æ@LDQ=��=v�(�jƦ����`�(����K�,Z��c��um���Wd68CO�\">xol�8�$���\r��&�м]�����UQ^o�Jc[�n�a��a�I����`��GzD�\n\Z�u��d��c�I�AK�,\nx�H�\'�D̷��h~�p�H�|/��=����d͢����Q���X�a�`�+��f~�SǶqb�5�.���}�����O�>��l{��ռ�aD�<���df�s:�~�_���e�\n7Nexg\'p�F�]̭���x���n�� �D�J��ƛ��d�z��}�\'�^�;Y��>��0Vt��Ũs4թ6��9��L\"	\"8���6�Զ�|Fj���m���ۘ��[F���-%Y��(s�#�$on�/ۈ��[DB�{��J����$`��g~�	0[�tpgx�	[�tpW���R�2���`x>[�tp7x�[�c�}�Y(d+k�p/xg�I�6ڴ��8 e+��G@��m�&1\nB‘-�Bz\'x&7c�׾�Aq@Ζ����r��k���}P����֛�����#�Mٶ؞E�:q��x�A$�(ⱅk�ZF�8Ќm�����H�b�\\�AX��������^h�\Z/�.�~=��>�t@\rɋ�V2*�\rЕ������� ��F��\Z�E��F���Cp�\"�����{�cB;l;��c?f\r{�&l;��#M��ZCʶ3)�x3�\']�l;�y�&2/��u)r��NO5O�D���&UM�v:�Y�[\0�-��*4���t~vy�LE�L�������lXMv�Y�dg�M�)��ۙ����=e\0\0\0\0IEND�B`�',1),
(100002,'icardi','123456','STAFF','GUDANG','MEDAN','2018-09-11',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0���}\0\0\0xPLTEh�E���_�7f�B�����[�1c�>\\�3a�;e�@Y�.���������l�J����}�ar�R���ؚ��Ƈ�n��ܸޫ�Փ��Ґ�z���ρz�]�ш��q�ڠ��~�Քv�X�ٝ����M�\0\0IDATx��]�z�:4$v�e+���}�7�,��Xv4����LK�F��4�j�[�T��-7�q�[U\r��g��6KZ&�T��t���P�ݙ�Z\'zEb���al{#��K-#7�a;^���z�[|\r��vR��zD�ş���y�#�������UJo��v8��%&a�wc;x8�]�ە�]>�3>Co��v�H��B�xq��� �5�ۏG��*,�`��ţY^Q�[g;{�v�F�e��D?��\r��v�����\\���e�{*�JO�d;~u�ż�v�,���� �����(6�=��� �C��3y��\0����Jf�}{����^��v�|&�͏A��N���\\`w�����XK�`&l�O�}.��^����6�e�\\/�d;VuB�}g���������]E>�$����mxl�#z�Ě|6�LTC���cۍ�}�h}:��?�|�U,�����~�]v�!��ؾ�c[�|�$��7�8l����t˗��w�JFІ�6�8�}T����o��a���^���}��t�z/T�6�8�OݫG�~g��A-ۈ��t/���I����#zM��u���Kul7-���v��ۨ�@�l���B5l����5a�8�\\�-ej�l��%��د\Z� �������z��L��y[����F��ݿ����y�������c���K�i0�&�v��X���q^��b�o㥓����A�-��3UZ5c��m�S\\)�k\n����\r�����.�j�e�G�\rH��8@�V�O����\0�GH:��C�Ȧ�2�\Z�ȼ�tҁ�-�}��{��䰥>C0���l��I��\n��ɭ�{�~��v����\n�֣Nbs2B�B���/2)�S�Գ涐e�J��8�1�*-[�O,��z���-�}�Q��ȼb]l���P!F�pd��8�����#��.4�9�d�Z: ��-n��/l�d���^-��l���-\"x�.���睁R�F�\r�T�t@�E�iߙc�t��|���:$�K\0�����l��#�\Z�؅��&rT8�b����c�Ejr��A�%`l���/�ZU~.��\'���)��e����_x�8 ��n\r*X!��mX����%$X�.bR�a��dn�\0œ��2Us��V�b�-\"����� ��g��)5Y��Xe�>M����Zy��N�N�[�-bH�z��2B� /TT�-�]1ī���`�z�GTVA�!�������U�9�t�(wE:(��#�J`\nG<p��ڪAa�JЦ��[��*5�^�hR��s���[�� gF�CkV��mu�уBr%���-��r��Ej5���K�o7l!i��Qu�#	[*��q�;��P�˸�Z�.�D Y,��V:�c�T���8&bK�b�����~!ȲL��:Vuv�f��\n�W�~#cK��bV�F:��+�]#cG\'� r맡ݣ�Q/l1�XL�>![�y�KǸJ�lAi�8�0n@�6wO~0�=�@��p�β���pΡ]�W�}f�\r�r��Ϝ���uM\"���+(�)!s�����l���h�$l�H��^�镲%v�p1������߅���u�sX���u=�e�s*�y��i1[wS���g_g�xݚk�Y�b���E��:�\ZJR���/K��u�+<��؍JI�}��w��u���t���VP��;�d����u��PP�e\'��6JQ�[^�D̖Nl�L�y����\r�(�����E���hí2�-#9[�,I��Y�|ٺlyN9[W_���鮪�p1p���ߊ�;ʈɖ�)��n��\Z�%eK�l�������?\"<��,em����L���3�n��t?����[��-B�mQ�DZ^U��Q����\n�-���<]WT��/7S	����a�\nl2q��n�����7Qw��M���p#���ur���n)����l7��쥎���f���.N6�����Ƒ�DͽlW	�\0*s���k����50��T��/�����  \0I2h���P�z(9�R�*�F�/2�SY�L���B�.@�:=4Q\\������#M�L$F���4�q�T����R&��̶�x2�#%n�[y&[�O�8w0B�-�DB�d�x���@dG��݄nA(�V>�	|5���\r �klğƇ�T4�%;ETj��MΉ�2m�L���R�D��� �j�p����F?i���rޅ�t���]�ϸ�V�x]��d�R�:�	O&�_!fM৽�\"̅�K��wYN\\5��\'���������#��7Pu�����ssX��eH\\CEvh�iT+��j�?��mf�w��9*?�jgT�Y/⎊�F	=��i]��n��[��L\0�����lnq͈�5��5wҒŽ�y�ԳA\\t�rn0�b��)��.�[�(��懣t�)�{	���k��:�ӵ�&:s՘n�\'M����������!���%߬����#r��Z�i#S�?ȫ��j��\n�`�0��*�d�w�;�\r;���j�n�_���t\Z}�kj��rj���D8ߜ�!�*}�z�y||8�Nj���|IOS��`wQUy����[��~P/�3�\r�:?3l�%f��<�/Z\"�߬O��.���T���3�\rN�\Z�.�H=��x��k�;�N�׃Hp�H����ddjWG��B���dg�0�����|�\0��f�_�O2�m��}搔�D�i_�_d�����b��Μ�P�i3ڼ������2�{�]���4w7S]��	Z��.7����\\p�p���-����b�ݝ�����s��.V��c��䛿��GAE��y��\Z���UB�7����T2�()8æ@LDQ=��=v�(�jƦ����`�(����K�,Z��c��um���Wd68CO�\">xol�8�$���\r��&�м]�����UQ^o�Jc[�n�a��a�I����`��GzD�\n\Z�u��d��c�I�AK�,\nx�H�\'�D̷��h~�p�H�|/��=����d͢����Q���X�a�`�+��f~�SǶqb�5�.���}�����O�>��l{��ռ�aD�<���df�s:�~�_���e�\n7Nexg\'p�F�]̭���x���n�� �D�J��ƛ��d�z��}�\'�^�;Y��>��0Vt��Ũs4թ6��9��L\"	\"8���6�Զ�|Fj���m���ۘ��[F���-%Y��(s�#�$on�/ۈ��[DB�{��J����$`��g~�	0[�tpgx�	[�tpW���R�2���`x>[�tp7x�[�c�}�Y(d+k�p/xg�I�6ڴ��8 e+��G@��m�&1\nB‘-�Bz\'x&7c�׾�Aq@Ζ����r��k���}P����֛�����#�Mٶ؞E�:q��x�A$�(ⱅk�ZF�8Ќm�����H�b�\\�AX��������^h�\Z/�.�~=��>�t@\rɋ�V2*�\rЕ������� ��F��\Z�E��F���Cp�\"�����{�cB;l;��c?f\r{�&l;��#M��ZCʶ3)�x3�\']�l;�y�&2/��u)r��NO5O�D���&UM�v:�Y�[\0�-��*4���t~vy�LE�L�������lXMv�Y�dg�M�)��ۙ����=e\0\0\0\0IEND�B`�',1),
(100003,'pipih','123456','STAFF','KEUANGAN','JAYAPURA','2019-07-15',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0���}\0\0\0xPLTEh�E���_�7f�B�����[�1c�>\\�3a�;e�@Y�.���������l�J����}�ar�R���ؚ��Ƈ�n��ܸޫ�Փ��Ґ�z���ρz�]�ш��q�ڠ��~�Քv�X�ٝ����M�\0\0IDATx��]�z�:4$v�e+���}�7�,��Xv4����LK�F��4�j�[�T��-7�q�[U\r��g��6KZ&�T��t���P�ݙ�Z\'zEb���al{#��K-#7�a;^���z�[|\r��vR��zD�ş���y�#�������UJo��v8��%&a�wc;x8�]�ە�]>�3>Co��v�H��B�xq��� �5�ۏG��*,�`��ţY^Q�[g;{�v�F�e��D?��\r��v�����\\���e�{*�JO�d;~u�ż�v�,���� �����(6�=��� �C��3y��\0����Jf�}{����^��v�|&�͏A��N���\\`w�����XK�`&l�O�}.��^����6�e�\\/�d;VuB�}g���������]E>�$����mxl�#z�Ě|6�LTC���cۍ�}�h}:��?�|�U,�����~�]v�!��ؾ�c[�|�$��7�8l����t˗��w�JFІ�6�8�}T����o��a���^���}��t�z/T�6�8�OݫG�~g��A-ۈ��t/���I����#zM��u���Kul7-���v��ۨ�@�l���B5l����5a�8�\\�-ej�l��%��د\Z� �������z��L��y[����F��ݿ����y�������c���K�i0�&�v��X���q^��b�o㥓����A�-��3UZ5c��m�S\\)�k\n����\r�����.�j�e�G�\rH��8@�V�O����\0�GH:��C�Ȧ�2�\Z�ȼ�tҁ�-�}��{��䰥>C0���l��I��\n��ɭ�{�~��v����\n�֣Nbs2B�B���/2)�S�Գ涐e�J��8�1�*-[�O,��z���-�}�Q��ȼb]l���P!F�pd��8�����#��.4�9�d�Z: ��-n��/l�d���^-��l���-\"x�.���睁R�F�\r�T�t@�E�iߙc�t��|���:$�K\0�����l��#�\Z�؅��&rT8�b����c�Ejr��A�%`l���/�ZU~.��\'���)��e����_x�8 ��n\r*X!��mX����%$X�.bR�a��dn�\0œ��2Us��V�b�-\"����� ��g��)5Y��Xe�>M����Zy��N�N�[�-bH�z��2B� /TT�-�]1ī���`�z�GTVA�!�������U�9�t�(wE:(��#�J`\nG<p��ڪAa�JЦ��[��*5�^�hR��s���[�� gF�CkV��mu�уBr%���-��r��Ej5���K�o7l!i��Qu�#	[*��q�;��P�˸�Z�.�D Y,��V:�c�T���8&bK�b�����~!ȲL��:Vuv�f��\n�W�~#cK��bV�F:��+�]#cG\'� r맡ݣ�Q/l1�XL�>![�y�KǸJ�lAi�8�0n@�6wO~0�=�@��p�β���pΡ]�W�}f�\r�r��Ϝ���uM\"���+(�)!s�����l���h�$l�H��^�镲%v�p1������߅���u�sX���u=�e�s*�y��i1[wS���g_g�xݚk�Y�b���E��:�\ZJR���/K��u�+<��؍JI�}��w��u���t���VP��;�d����u��PP�e\'��6JQ�[^�D̖Nl�L�y����\r�(�����E���hí2�-#9[�,I��Y�|ٺlyN9[W_���鮪�p1p���ߊ�;ʈɖ�)��n��\Z�%eK�l�������?\"<��,em����L���3�n��t?����[��-B�mQ�DZ^U��Q����\n�-���<]WT��/7S	����a�\nl2q��n�����7Qw��M���p#���ur���n)����l7��쥎���f���.N6�����Ƒ�DͽlW	�\0*s���k����50��T��/�����  \0I2h���P�z(9�R�*�F�/2�SY�L���B�.@�:=4Q\\������#M�L$F���4�q�T����R&��̶�x2�#%n�[y&[�O�8w0B�-�DB�d�x���@dG��݄nA(�V>�	|5���\r �klğƇ�T4�%;ETj��MΉ�2m�L���R�D��� �j�p����F?i���rޅ�t���]�ϸ�V�x]��d�R�:�	O&�_!fM৽�\"̅�K��wYN\\5��\'���������#��7Pu�����ssX��eH\\CEvh�iT+��j�?��mf�w��9*?�jgT�Y/⎊�F	=��i]��n��[��L\0�����lnq͈�5��5wҒŽ�y�ԳA\\t�rn0�b��)��.�[�(��懣t�)�{	���k��:�ӵ�&:s՘n�\'M����������!���%߬����#r��Z�i#S�?ȫ��j��\n�`�0��*�d�w�;�\r;���j�n�_���t\Z}�kj��rj���D8ߜ�!�*}�z�y||8�Nj���|IOS��`wQUy����[��~P/�3�\r�:?3l�%f��<�/Z\"�߬O��.���T���3�\rN�\Z�.�H=��x��k�;�N�׃Hp�H����ddjWG��B���dg�0�����|�\0��f�_�O2�m��}搔�D�i_�_d�����b��Μ�P�i3ڼ������2�{�]���4w7S]��	Z��.7����\\p�p���-����b�ݝ�����s��.V��c��䛿��GAE��y��\Z���UB�7����T2�()8æ@LDQ=��=v�(�jƦ����`�(����K�,Z��c��um���Wd68CO�\">xol�8�$���\r��&�м]�����UQ^o�Jc[�n�a��a�I����`��GzD�\n\Z�u��d��c�I�AK�,\nx�H�\'�D̷��h~�p�H�|/��=����d͢����Q���X�a�`�+��f~�SǶqb�5�.���}�����O�>��l{��ռ�aD�<���df�s:�~�_���e�\n7Nexg\'p�F�]̭���x���n�� �D�J��ƛ��d�z��}�\'�^�;Y��>��0Vt��Ũs4թ6��9��L\"	\"8���6�Զ�|Fj���m���ۘ��[F���-%Y��(s�#�$on�/ۈ��[DB�{��J����$`��g~�	0[�tpgx�	[�tpW���R�2���`x>[�tp7x�[�c�}�Y(d+k�p/xg�I�6ڴ��8 e+��G@��m�&1\nB‘-�Bz\'x&7c�׾�Aq@Ζ����r��k���}P����֛�����#�Mٶ؞E�:q��x�A$�(ⱅk�ZF�8Ќm�����H�b�\\�AX��������^h�\Z/�.�~=��>�t@\rɋ�V2*�\rЕ������� ��F��\Z�E��F���Cp�\"�����{�cB;l;��c?f\r{�&l;��#M��ZCʶ3)�x3�\']�l;�y�&2/��u)r��NO5O�D���&UM�v:�Y�[\0�-��*4���t~vy�LE�L�������lXMv�Y�dg�M�)��ۙ����=e\0\0\0\0IEND�B`�',1),
(100004,'zaenal','123456','STAFF','GUDANG','SURABAYA','2019-04-16',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0���}\0\0\0xPLTEh�E���_�7f�B�����[�1c�>\\�3a�;e�@Y�.���������l�J����}�ar�R���ؚ��Ƈ�n��ܸޫ�Փ��Ґ�z���ρz�]�ш��q�ڠ��~�Քv�X�ٝ����M�\0\0IDATx��]�z�:4$v�e+���}�7�,��Xv4����LK�F��4�j�[�T��-7�q�[U\r��g��6KZ&�T��t���P�ݙ�Z\'zEb���al{#��K-#7�a;^���z�[|\r��vR��zD�ş���y�#�������UJo��v8��%&a�wc;x8�]�ە�]>�3>Co��v�H��B�xq��� �5�ۏG��*,�`��ţY^Q�[g;{�v�F�e��D?��\r��v�����\\���e�{*�JO�d;~u�ż�v�,���� �����(6�=��� �C��3y��\0����Jf�}{����^��v�|&�͏A��N���\\`w�����XK�`&l�O�}.��^����6�e�\\/�d;VuB�}g���������]E>�$����mxl�#z�Ě|6�LTC���cۍ�}�h}:��?�|�U,�����~�]v�!��ؾ�c[�|�$��7�8l����t˗��w�JFІ�6�8�}T����o��a���^���}��t�z/T�6�8�OݫG�~g��A-ۈ��t/���I����#zM��u���Kul7-���v��ۨ�@�l���B5l����5a�8�\\�-ej�l��%��د\Z� �������z��L��y[����F��ݿ����y�������c���K�i0�&�v��X���q^��b�o㥓����A�-��3UZ5c��m�S\\)�k\n����\r�����.�j�e�G�\rH��8@�V�O����\0�GH:��C�Ȧ�2�\Z�ȼ�tҁ�-�}��{��䰥>C0���l��I��\n��ɭ�{�~��v����\n�֣Nbs2B�B���/2)�S�Գ涐e�J��8�1�*-[�O,��z���-�}�Q��ȼb]l���P!F�pd��8�����#��.4�9�d�Z: ��-n��/l�d���^-��l���-\"x�.���睁R�F�\r�T�t@�E�iߙc�t��|���:$�K\0�����l��#�\Z�؅��&rT8�b����c�Ejr��A�%`l���/�ZU~.��\'���)��e����_x�8 ��n\r*X!��mX����%$X�.bR�a��dn�\0œ��2Us��V�b�-\"����� ��g��)5Y��Xe�>M����Zy��N�N�[�-bH�z��2B� /TT�-�]1ī���`�z�GTVA�!�������U�9�t�(wE:(��#�J`\nG<p��ڪAa�JЦ��[��*5�^�hR��s���[�� gF�CkV��mu�уBr%���-��r��Ej5���K�o7l!i��Qu�#	[*��q�;��P�˸�Z�.�D Y,��V:�c�T���8&bK�b�����~!ȲL��:Vuv�f��\n�W�~#cK��bV�F:��+�]#cG\'� r맡ݣ�Q/l1�XL�>![�y�KǸJ�lAi�8�0n@�6wO~0�=�@��p�β���pΡ]�W�}f�\r�r��Ϝ���uM\"���+(�)!s�����l���h�$l�H��^�镲%v�p1������߅���u�sX���u=�e�s*�y��i1[wS���g_g�xݚk�Y�b���E��:�\ZJR���/K��u�+<��؍JI�}��w��u���t���VP��;�d����u��PP�e\'��6JQ�[^�D̖Nl�L�y����\r�(�����E���hí2�-#9[�,I��Y�|ٺlyN9[W_���鮪�p1p���ߊ�;ʈɖ�)��n��\Z�%eK�l�������?\"<��,em����L���3�n��t?����[��-B�mQ�DZ^U��Q����\n�-���<]WT��/7S	����a�\nl2q��n�����7Qw��M���p#���ur���n)����l7��쥎���f���.N6�����Ƒ�DͽlW	�\0*s���k����50��T��/�����  \0I2h���P�z(9�R�*�F�/2�SY�L���B�.@�:=4Q\\������#M�L$F���4�q�T����R&��̶�x2�#%n�[y&[�O�8w0B�-�DB�d�x���@dG��݄nA(�V>�	|5���\r �klğƇ�T4�%;ETj��MΉ�2m�L���R�D��� �j�p����F?i���rޅ�t���]�ϸ�V�x]��d�R�:�	O&�_!fM৽�\"̅�K��wYN\\5��\'���������#��7Pu�����ssX��eH\\CEvh�iT+��j�?��mf�w��9*?�jgT�Y/⎊�F	=��i]��n��[��L\0�����lnq͈�5��5wҒŽ�y�ԳA\\t�rn0�b��)��.�[�(��懣t�)�{	���k��:�ӵ�&:s՘n�\'M����������!���%߬����#r��Z�i#S�?ȫ��j��\n�`�0��*�d�w�;�\r;���j�n�_���t\Z}�kj��rj���D8ߜ�!�*}�z�y||8�Nj���|IOS��`wQUy����[��~P/�3�\r�:?3l�%f��<�/Z\"�߬O��.���T���3�\rN�\Z�.�H=��x��k�;�N�׃Hp�H����ddjWG��B���dg�0�����|�\0��f�_�O2�m��}搔�D�i_�_d�����b��Μ�P�i3ڼ������2�{�]���4w7S]��	Z��.7����\\p�p���-����b�ݝ�����s��.V��c��䛿��GAE��y��\Z���UB�7����T2�()8æ@LDQ=��=v�(�jƦ����`�(����K�,Z��c��um���Wd68CO�\">xol�8�$���\r��&�м]�����UQ^o�Jc[�n�a��a�I����`��GzD�\n\Z�u��d��c�I�AK�,\nx�H�\'�D̷��h~�p�H�|/��=����d͢����Q���X�a�`�+��f~�SǶqb�5�.���}�����O�>��l{��ռ�aD�<���df�s:�~�_���e�\n7Nexg\'p�F�]̭���x���n�� �D�J��ƛ��d�z��}�\'�^�;Y��>��0Vt��Ũs4թ6��9��L\"	\"8���6�Զ�|Fj���m���ۘ��[F���-%Y��(s�#�$on�/ۈ��[DB�{��J����$`��g~�	0[�tpgx�	[�tpW���R�2���`x>[�tp7x�[�c�}�Y(d+k�p/xg�I�6ڴ��8 e+��G@��m�&1\nB‘-�Bz\'x&7c�׾�Aq@Ζ����r��k���}P����֛�����#�Mٶ؞E�:q��x�A$�(ⱅk�ZF�8Ќm�����H�b�\\�AX��������^h�\Z/�.�~=��>�t@\rɋ�V2*�\rЕ������� ��F��\Z�E��F���Cp�\"�����{�cB;l;��c?f\r{�&l;��#M��ZCʶ3)�x3�\']�l;�y�&2/��u)r��NO5O�D���&UM�v:�Y�[\0�-��*4���t~vy�LE�L�������lXMv�Y�dg�M�)��ۙ����=e\0\0\0\0IEND�B`�',1);

/*Table structure for table `m_supplier` */

DROP TABLE IF EXISTS `m_supplier`;

CREATE TABLE `m_supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `alamat_supplier` text DEFAULT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_supplier`),
  UNIQUE KEY `UNIQUE` (`nama_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `m_supplier` */

insert  into `m_supplier`(`id_supplier`,`nama_supplier`,`alamat_supplier`,`is_aktif`) values 
(1,'PT. KUKIRA TAKADA','Jalan Kebenaran Yang Tidak Terduga dan Disangka Sangka',1),
(2,'VOC','Perusahaan Nenek Moyang Para Kumpeni',1),
(3,'PT. SUBUR MAKMUR ABADI','KAWASAN INDUSTRI YANG BELUM BERES AKSES JALANNYA',1),
(4,'CV. HIDUP SEGAN MATI TAK MAU','JALAN ANGAN ANGAN MENUJU KEBAIKAN',1);

/*Table structure for table `t_area_kerja` */

DROP TABLE IF EXISTS `t_area_kerja`;

CREATE TABLE `t_area_kerja` (
  `id_area_kerja` int(11) NOT NULL AUTO_INCREMENT,
  `nama_area` varchar(255) NOT NULL,
  PRIMARY KEY (`id_area_kerja`),
  UNIQUE KEY `UNIQUE` (`nama_area`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

/*Data for the table `t_area_kerja` */

insert  into `t_area_kerja`(`id_area_kerja`,`nama_area`) values 
(101,'BANDUNG'),
(107,'DENPASAR'),
(102,'JAKARTA'),
(108,'JAYAPURA'),
(106,'MEDAN'),
(100,'PUSAT'),
(103,'SOLO'),
(105,'SURABAYA'),
(104,'YOGYAKARTA');

/*Table structure for table `t_departemen` */

DROP TABLE IF EXISTS `t_departemen`;

CREATE TABLE `t_departemen` (
  `id_departemen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_departemen` varchar(255) NOT NULL,
  PRIMARY KEY (`id_departemen`),
  UNIQUE KEY `UNIQUE` (`nama_departemen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `t_departemen` */

insert  into `t_departemen`(`id_departemen`,`nama_departemen`) values 
(4,'GA'),
(7,'GUDANG'),
(3,'HRD'),
(6,'IT'),
(8,'KEUANGAN'),
(5,'PAJAK'),
(1,'PEMASARAN'),
(2,'PEMBELIAN');

/*Table structure for table `t_detail_transaksi` */

DROP TABLE IF EXISTS `t_detail_transaksi`;

CREATE TABLE `t_detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_detail_barang` int(11) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `merk_barang` varchar(255) NOT NULL,
  `tipe_barang` varchar(255) NOT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `jumlah_barang` double NOT NULL,
  KEY `fk_id_transaksi` (`id_detail_transaksi`),
  KEY `fk_id_barang` (`id_detail_barang`),
  KEY `fk_nama_supplier` (`supplier`),
  CONSTRAINT `fk_id_barang` FOREIGN KEY (`id_detail_barang`) REFERENCES `m_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_transaksi` FOREIGN KEY (`id_detail_transaksi`) REFERENCES `t_transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nama_supplier` FOREIGN KEY (`supplier`) REFERENCES `m_supplier` (`nama_supplier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_detail_transaksi` */

/*Table structure for table `t_jenis_transaksi` */

DROP TABLE IF EXISTS `t_jenis_transaksi`;

CREATE TABLE `t_jenis_transaksi` (
  `id_jenis_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_transaksi` varchar(255) NOT NULL,
  PRIMARY KEY (`id_jenis_transaksi`),
  UNIQUE KEY `UNIQUE` (`nama_jenis_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `t_jenis_transaksi` */

insert  into `t_jenis_transaksi`(`id_jenis_transaksi`,`nama_jenis_transaksi`) values 
(2,'KELUAR'),
(1,'MASUK');

/*Table structure for table `t_level_karyawan` */

DROP TABLE IF EXISTS `t_level_karyawan`;

CREATE TABLE `t_level_karyawan` (
  `id_level_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(255) NOT NULL,
  PRIMARY KEY (`id_level_karyawan`),
  UNIQUE KEY `UNIQUE` (`nama_level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `t_level_karyawan` */

insert  into `t_level_karyawan`(`id_level_karyawan`,`nama_level`) values 
(1,'ADMINISTRATOR'),
(4,'DIREKTUR'),
(3,'KOMISARIS'),
(5,'MANAJER'),
(7,'STAFF'),
(2,'SUPERADMIN'),
(6,'SUPERVISOR');

/*Table structure for table `t_merk_barang` */

DROP TABLE IF EXISTS `t_merk_barang`;

CREATE TABLE `t_merk_barang` (
  `id_merk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_merk` varchar(255) NOT NULL,
  PRIMARY KEY (`id_merk`),
  UNIQUE KEY `UNIQUE` (`nama_merk`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `t_merk_barang` */

insert  into `t_merk_barang`(`id_merk`,`nama_merk`) values 
(4,'AMP'),
(3,'BELDEN'),
(2,'CISCO'),
(8,'D LINK'),
(6,'HUAWEII'),
(1,'MIKROTIK'),
(7,'TP LINK'),
(9,'VODAFONE'),
(5,'ZTE');

/*Table structure for table `t_satuan_barang` */

DROP TABLE IF EXISTS `t_satuan_barang`;

CREATE TABLE `t_satuan_barang` (
  `id_satuan_barang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_satuan_barang`),
  UNIQUE KEY `UNIQUE` (`nama_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `t_satuan_barang` */

insert  into `t_satuan_barang`(`id_satuan_barang`,`nama_satuan`) values 
(4,'BUNGKUS'),
(3,'DUS'),
(1,'PCS'),
(5,'ROLL'),
(2,'UNIT');

/*Table structure for table `t_transaksi` */

DROP TABLE IF EXISTS `t_transaksi`;

CREATE TABLE `t_transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_transaksi` varchar(255) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jam_transaksi` time NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `fk_nip_karyawan` (`id_karyawan`),
  CONSTRAINT `fk_nip_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `m_karyawan` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
