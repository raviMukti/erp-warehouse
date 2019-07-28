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
(100000,'ravi','123456','SUPERADMIN','IT','PUSAT','2017-01-01',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0í\0\0\0Õ\0\0\0Œº‡}\0\0\0xPLTEh½Eÿÿÿ_º7f¼BÆä»ËçÁ[¹1c»>\\¹3a»;e¼@Y¸.úıùşÿıøüöl¿Jêõæ½à±}ÅarÁRòùïªØšÏèÆ‡ÉnáñÜ¸Ş«¤Õ“ÙíÒÍzæóá–ÏzÄ]›Ñˆ‰Êq¯Ú “Î~¥Õ”vÂX­ÙÛîÕæMç½\0\0IDATxœÍ]ézê:4$vÂe+§¥í¥}ÿ7¼,…’Xv4ŠÌÏó†LK¶F‹ê4Æj²[ÎT»˜-7İqó[U\rÿşg—§6KZ&«TÙt´ù÷P¶İ™ÉZ\'zEb‹éâal{#İşK-#7ï¯a;^¦÷æzâ[|\rïÏvRäàzD¦ÅŸ³”í—y×#Š—»²í¿Û’UJoïÈv8»£%&a—wc;x8Ù]ÑÛ•°]>ö3>CoîÃvıHõ‡Bàxq¶ãç «5¸ÛGùÙ*,î‡`¶¯Å£Y^QÌ[g;{Äv‘FÛe”íD?šã\rŠŸvÙöŸÁù\\‘ìÛe»{*¶JOÚd;~u†Å¼Ævù,Şç‹í¨ ¶‹ôÑì(6±=÷¹ ƒCÛõ3yŸÈ\0ØŸ‘¬Jfí°}{ü©–‚^·Ávõ|&êÍAòÙNŸÍû\\`wñÙöäXK `&l¶Oè}.ÈÙ^ˆËöó¹6Èe¤\\/Äd;VuBÂ}gÌÿ÷õœŞç®â±]E>û$±€ámxlß#zŸÄš|6ËLTC½ÅcÛè}ìh}:¶Œ?ó˜|ÓU,¶ƒˆ·•~ÿ]vñ!æï±Ø¾Äc[”|Å$¢¥7½8lÇñîÉtË—şŒw¬JFĞ†Á68}T¯ÑüÙoâŞa¶¯ñ^­»¡}¸tÓz/TÏ68Oİ«GÜ~gõÒA-Ûˆâ€ıt/¿‹¸I«—êØ#zM˜ÍuÄë×Kul7-³íÆvé®ûÛ¨â@ël•®ñB5l£Ší³µÿ5a»8ˆ\\£-ejÙl³Ã%Œ–Ø¯\Zé Ì÷™ùêş¬zÿL¶¹y[ŒçãÅFÀ×İ¿ğÙââ€y»¸ø‰›ßÊc«——Ké…i0Ó&ÄvˆşX’ŞÅq^¥Ëb«oã¥“ı¸ÂÒAˆ-êù3UZ5c‡ƒmåS\\)ôk\nØ¶ÿÀ\r²öË¨.ÛjÈe¸G¾\rH¶ 8@ä•VÂO¶™÷ÿ\0GH:ğ³ÅCüÈ¦ü2Ø\ZÂÈ¼tÒŸ-æ}å×{åûä°¥>C0¢¼l±°I¶ó\n³ÍÉ­ß{»~ÛÇvı€¦×\nÎÖ£Nbs2BÙBâ€ı¢/2)ÛSÛÔ³æ¶eöJ¶81‰*-[ë»O,€•z¼‡-â}’QŸ¾È¼b]l½úÕP!F“pd¶8úÎÛÊ#ãì.4Í9ád˜Z: Ùœ-nˆ¬/lídä³öÉ^-¶‹lí¨€Ÿ-\"x·.ßÎÒçRßF÷\r±T´t@±E¤iß™c°tó|›úô:$ÖK\0ê·€÷ñlÓÆ#â\ZÜØ…İÓ&rT8—b‹ˆ£òcšEjrÚğAò%`lÆó/èZU~.±ô\'ƒìİ)éÀe‹ˆ´¡_x¾8 æ˜Ğn\r*X!¤‡mX´´şï½%$ÂšX’.bRÛa‹ˆdn‡\0Å““„2UsäåVÕb—-\"ŠéĞß ‹g¤ª)5YõüXe»>Mí÷ş€Zy²‚N¢Ní[…-bHzö¨2Bîª /TT…-²]1Ä«õ™ã`¨z³GTVAä!¶ˆ÷¡¦À¢U¶9µt¡(wE:(±í#ÇJ`\nG<pÚªAaîJĞ¦Ä©[£¶*5«^ hRŠs—¥ƒ[¶ÿ gFœCkV½€muáÑƒBr%éà–-ôĞrøÎEj5±ıÃKµo7l!iš²Qu¡#	[*©q·;î¶PœË¸çZƒ.ÊD Y,¥ìV:øc‰T€ºö8&bKébéàÊˆ¹~!È²Lˆ€:Vuvóf”ì\n„WŸ~#cK”ØbVùF:¸°+Ü]#cG\'Ì rë§¡İ£ºQ/l1åXLŒ>![¢yÖKÇ¸J¿lAiš8ş0n@È6wO~0ã=³@ŞçpßÎ²å¤¹pÎ¡]¸W¯}fû\r¦r¸‰Ïœ»–²uM\"œüÿ+(î‹)!sîú‹±î¥l‰ˆšh“$l‘HŞÄ^é•²%vp1ğÙÒÙş ß…ÛëˆõuˆsXçÏğ”u=ÿeÚs*ëyÁ¹i1[wS§¬g_g¶xİšk’Yå¹b¶îÓE²:ë\ZJRâÊ¬/KÌÖuï+<»õØJIê}Ü®wÎ³u÷’ætÅüÀVP£’;»d–‰”³uŒòPP’e\'¶à6JQ‡[^ğDÌ–NlÏL¡y¹äóÇ\rª(œ½£¤–E÷• hÃ­2â-#9[ë,I™’Y©|ÙºlyN9[W_“”ÿé®ª¦p1p¶î»•°µßŠå;ÊˆÉ–·)Šón³\Zá%eK¥lòÎåî»•Ôíæ‚?\"<¯Ñ,emäˆ³›œL¤‡À3‘n€·t?¦¤à[ÈÖ-BámQÜDZ^U¤ûQˆúæØ\nÖ-‘ìÌ<]WT™Ç/7S	ËßıÅaİ\nl2qŞän¶ËÉíéš7QwƒMæ”ªp#¼ÜÓur›ÃÄn)îş¨l7û–ì¥§‰ê³fÿº™.N6®ßÛóÿÆ‘‚DÍ½lW	¢\0*s¤à–kı¾İî50‘ÅT/³’œ¨  \0I2h¢á§áPÚz(9ßRÕ*¸Fª/2ÉSYì‚L±‚B¸.@–:=4Q\\ŠØß÷Ûë#M”L$Fê—’4¢qÍT‹¤‰R&‰ÛÌ¶Âx2Õ#%nãŠ[y&[óO–8w0B¿-¶DB‹dßxÊİé@dG˜˜İ„nA(ã’V>æ¢	|5‘åå\r æklÄŸÆ‡ë·T4¡%;ETjñÛMÎ‰Š2mLıˆØRíD©ŒÀ ŞjópŞ°ÛF?iªÿrŞ… tá°¬]ıÏ¸¯V x]ª´dùRŠ:õ	O&á_!fMà§½ë\"Ì…£Kø¢wYN\\5‘©\'–àäÂáıù©¶#±ç7PuÛøÜÍssX•§eH\\CEvh„iT+Ş•jâ?³àmfÄwŒû9*?ßjgTåY/âŠìF	=·i]Áén¨ê[°§L\0†êô¿ÚÛlnqÍˆò5û‰5wÒ’Å½ğy­Ô³A\\tÙrn0‹b©è)¨ø.È[Ï(£Ëæ‡£t³)Õ{	ßáúk½°:¾ÓµÈ&:sÕ˜n¶\'Mıç®êøğöÁôœ€!Õí%ß¬àªÑÄ#r±ZÃi#S¥?È«â›ùjëÎ\nÛ`µ0ãé*ÓdŠwá;÷\r;·šÚj¨nş_¿¥µt\Z}îkj„Ÿrj´šôD8ßœ¯!õ*}Ízæy||8‰NjÔïâ|IOS¸Î`wQUyáíÃÿ[¾ú~P/“3¼\r¡:?3l¥%fêí<‰/Z\"Äß¬OÍ.¾ËÿT­üÓ3§\rNŸ\Z‰.èH=øÌx²ôk ;îN–×ƒHpÌH’ÀˆÁddjWG–ÎBıèÇdgñ0˜ı¥Á´|œ\0øúfµ_O2“m‚ã}æ”ÙD§i_¸_d³ğÀÃÁb§ŒÎœ½Pi3Ú¼†ïÏƒ±è‘2{ş]éÖÎ4w7S]­í	Z›Â.7½Ú¶ó\\pÈp½—-ÔÏñ¹bÍİ¯İõúós½î.V¬Ñcÿ€ä›¿»¡GAEèÕyùË\Z­…âUBÖ7æËÓ÷T2¥()8Ã¦@LDQ=ß·=v¯(œjÆ¦ØÉÔß`¤(ı“¯ĞKş,Zæï²c²·umœŞØWd68COË\">xolé8µ$åÏŞ\r£ÿ&ÕĞ¼]£õ´ÿƒUQ^oÏJc[nÂa¶âaÆIºåÍğ`¼”GzDó\n\Zèu™ùdŒôc¸IåAKÙ,\nxÎHé\'íDÌ·ÿÙh~ªpÎH³|/¬=ÍßÃ¾dÍ¢³¡Á¿Qç•X³a¿`µ+š‰f~ïSÇ¶qb5Ó.ğ‚ç“}ı¹¿òÙOæ>æÚl{¬ıÕ¼ûaD€<Ú­df›s:~ş_ñğõe–\n7Nexg\'pØFÊ]Ì­±ï›îŠxÉóŸÉn¯ îDJ¯ØÆ›µ˜dÚz¿İ}¯\'İ^¯;Y¿ì>ö¦0Vtò¡á¬Å¨s4Õ©6æ£9ÂÚL\"	\"8ÁŒÃ6æŒÔ¶Ñ|FjÌù·m£ùüÛ˜³[FŒÙÆ-%Y·€(s«#Î$on‹/Ûˆóæ[DB{ƒÙJ¤ƒûƒ$`‹µg~¼	0[‘tpgxÄ	[‘tpWÙÃR¶2éà`x>[¡tp7xÅ[´cñ}áY(d+k¹p/xgøIÙ6Ú´‡€8 e+–ÚG@²m¥&1\nBâ€˜-Bz\'x&7c‹×¾İAq@Î–×íŞ‹r¶Ñk£€í}P¶Ïè…ãÖ›²åöúº#é³MÙ¶ØEˆ:q ÛxÒA$(â±…kßZF­8ĞŒmÿ©ØúÆHÇbû\\ÒAXšÀö™¤ƒ¼^hÊ\Z/Ü.ˆ~=±Ù>t@\rÉ‹ÎV2* \rĞ•±ÙòŠ¶‹Ù ËÙFëĞ\ZÛEÉÙFêĞöCpã\"¶áìÑ{ºcB;l;ııc?f\r{Ú&l;í#M•¸ZCÊ¶3)µx3¢\']Ûl;ã©yÄ&2/Şäu)r¶NO5OÃD¹š÷&UMØv:İYã[\0‰-¦Í*4š±ít~vyÔLEòL§£ÿàìîÈlXMvÓYËdgËM·)ÕşÛ™¼çÂÌ=e\0\0\0\0IEND®B`‚',1),
(100002,'icardi','123456','STAFF','GUDANG','MEDAN','2018-09-11',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0í\0\0\0Õ\0\0\0Œº‡}\0\0\0xPLTEh½Eÿÿÿ_º7f¼BÆä»ËçÁ[¹1c»>\\¹3a»;e¼@Y¸.úıùşÿıøüöl¿Jêõæ½à±}ÅarÁRòùïªØšÏèÆ‡ÉnáñÜ¸Ş«¤Õ“ÙíÒÍzæóá–ÏzÄ]›Ñˆ‰Êq¯Ú “Î~¥Õ”vÂX­ÙÛîÕæMç½\0\0IDATxœÍ]ézê:4$vÂe+§¥í¥}ÿ7¼,…’Xv4ŠÌÏó†LK¶F‹ê4Æj²[ÎT»˜-7İqó[U\rÿşg—§6KZ&«TÙt´ù÷P¶İ™ÉZ\'zEb‹éâal{#İşK-#7ï¯a;^¦÷æzâ[|\rïÏvRäàzD¦ÅŸ³”í—y×#Š—»²í¿Û’UJoïÈv8»£%&a—wc;x8Ù]ÑÛ•°]>ö3>CoîÃvıHõ‡Bàxq¶ãç «5¸ÛGùÙ*,î‡`¶¯Å£Y^QÌ[g;{Äv‘FÛe”íD?šã\rŠŸvÙöŸÁù\\‘ìÛe»{*¶JOÚd;~u†Å¼Ævù,Şç‹í¨ ¶‹ôÑì(6±=÷¹ ƒCÛõ3yŸÈ\0ØŸ‘¬Jfí°}{ü©–‚^·Ávõ|&êÍAòÙNŸÍû\\`wñÙöäXK `&l¶Oè}.ÈÙ^ˆËöó¹6Èe¤\\/Äd;VuBÂ}gÌÿ÷õœŞç®â±]E>û$±€ámxlß#zŸÄš|6ËLTC½ÅcÛè}ìh}:¶Œ?ó˜|ÓU,¶ƒˆ·•~ÿ]vñ!æï±Ø¾Äc[”|Å$¢¥7½8lÇñîÉtË—şŒw¬JFĞ†Á68}T¯ÑüÙoâŞa¶¯ñ^­»¡}¸tÓz/TÏ68Oİ«GÜ~gõÒA-Ûˆâ€ıt/¿‹¸I«—êØ#zM˜ÍuÄë×Kul7-³íÆvé®ûÛ¨â@ël•®ñB5l£Ší³µÿ5a»8ˆ\\£-ejÙl³Ã%Œ–Ø¯\Zé Ì÷™ùêş¬zÿL¶¹y[ŒçãÅFÀ×İ¿ğÙââ€y»¸ø‰›ßÊc«——Ké…i0Ó&ÄvˆşX’ŞÅq^¥Ëb«oã¥“ı¸ÂÒAˆ-êù3UZ5c‡ƒmåS\\)ôk\nØ¶ÿÀ\r²öË¨.ÛjÈe¸G¾\rH¶ 8@ä•VÂO¶™÷ÿ\0GH:ğ³ÅCüÈ¦ü2Ø\ZÂÈ¼tÒŸ-æ}å×{åûä°¥>C0¢¼l±°I¶ó\n³ÍÉ­ß{»~ÛÇvı€¦×\nÎÖ£Nbs2BÙBâ€ı¢/2)ÛSÛÔ³æ¶eöJ¶81‰*-[ë»O,€•z¼‡-â}’QŸ¾È¼b]l½úÕP!F“pd¶8úÎÛÊ#ãì.4Í9ád˜Z: Ùœ-nˆ¬/lídä³öÉ^-¶‹lí¨€Ÿ-\"x·.ßÎÒçRßF÷\r±T´t@±E¤iß™c°tó|›úô:$ÖK\0ê·€÷ñlÓÆ#â\ZÜØ…İÓ&rT8—b‹ˆ£òcšEjrÚğAò%`lÆó/èZU~.±ô\'ƒìİ)éÀe‹ˆ´¡_x¾8 æ˜Ğn\r*X!¤‡mX´´şï½%$ÂšX’.bRÛa‹ˆdn‡\0Å““„2UsäåVÕb—-\"ŠéĞß ‹g¤ª)5YõüXe»>Mí÷ş€Zy²‚N¢Ní[…-bHzö¨2Bîª /TT…-²]1Ä«õ™ã`¨z³GTVAä!¶ˆ÷¡¦À¢U¶9µt¡(wE:(±í#ÇJ`\nG<pÚªAaîJĞ¦Ä©[£¶*5«^ hRŠs—¥ƒ[¶ÿ gFœCkV½€muáÑƒBr%éà–-ôĞrøÎEj5±ıÃKµo7l!iš²Qu¡#	[*©q·;î¶PœË¸çZƒ.ÊD Y,¥ìV:øc‰T€ºö8&bKébéàÊˆ¹~!È²Lˆ€:Vuvóf”ì\n„WŸ~#cK”ØbVùF:¸°+Ü]#cG\'Ì rë§¡İ£ºQ/l1åXLŒ>![¢yÖKÇ¸J¿lAiš8ş0n@È6wO~0ã=³@ŞçpßÎ²å¤¹pÎ¡]¸W¯}fû\r¦r¸‰Ïœ»–²uM\"œüÿ+(î‹)!sîú‹±î¥l‰ˆšh“$l‘HŞÄ^é•²%vp1ğÙÒÙş ß…ÛëˆõuˆsXçÏğ”u=ÿeÚs*ëyÁ¹i1[wS§¬g_g¶xİšk’Yå¹b¶îÓE²:ë\ZJRâÊ¬/KÌÖuï+<»õØJIê}Ü®wÎ³u÷’ætÅüÀVP£’;»d–‰”³uŒòPP’e\'¶à6JQ‡[^ğDÌ–NlÏL¡y¹äóÇ\rª(œ½£¤–E÷• hÃ­2â-#9[ë,I™’Y©|ÙºlyN9[W_“”ÿé®ª¦p1p¶î»•°µßŠå;ÊˆÉ–·)Šón³\Zá%eK¥lòÎåî»•Ôíæ‚?\"<¯Ñ,emäˆ³›œL¤‡À3‘n€·t?¦¤à[ÈÖ-BámQÜDZ^U¤ûQˆúæØ\nÖ-‘ìÌ<]WT™Ç/7S	ËßıÅaİ\nl2qŞän¶ËÉíéš7QwƒMæ”ªp#¼ÜÓur›ÃÄn)îş¨l7û–ì¥§‰ê³fÿº™.N6®ßÛóÿÆ‘‚DÍ½lW	¢\0*s¤à–kı¾İî50‘ÅT/³’œ¨  \0I2h¢á§áPÚz(9ßRÕ*¸Fª/2ÉSYì‚L±‚B¸.@–:=4Q\\ŠØß÷Ûë#M”L$Fê—’4¢qÍT‹¤‰R&‰ÛÌ¶Âx2Õ#%nãŠ[y&[óO–8w0B¿-¶DB‹dßxÊİé@dG˜˜İ„nA(ã’V>æ¢	|5‘åå\r æklÄŸÆ‡ë·T4¡%;ETjñÛMÎ‰Š2mLıˆØRíD©ŒÀ ŞjópŞ°ÛF?iªÿrŞ… tá°¬]ıÏ¸¯V x]ª´dùRŠ:õ	O&á_!fMà§½ë\"Ì…£Kø¢wYN\\5‘©\'–àäÂáıù©¶#±ç7PuÛøÜÍssX•§eH\\CEvh„iT+Ş•jâ?³àmfÄwŒû9*?ßjgTåY/âŠìF	=·i]Áén¨ê[°§L\0†êô¿ÚÛlnqÍˆò5û‰5wÒ’Å½ğy­Ô³A\\tÙrn0‹b©è)¨ø.È[Ï(£Ëæ‡£t³)Õ{	ßáúk½°:¾ÓµÈ&:sÕ˜n¶\'Mıç®êøğöÁôœ€!Õí%ß¬àªÑÄ#r±ZÃi#S¥?È«â›ùjëÎ\nÛ`µ0ãé*ÓdŠwá;÷\r;·šÚj¨nş_¿¥µt\Z}îkj„Ÿrj´šôD8ßœ¯!õ*}Ízæy||8‰NjÔïâ|IOS¸Î`wQUyáíÃÿ[¾ú~P/“3¼\r¡:?3l¥%fêí<‰/Z\"Äß¬OÍ.¾ËÿT­üÓ3§\rNŸ\Z‰.èH=øÌx²ôk ;îN–×ƒHpÌH’ÀˆÁddjWG–ÎBıèÇdgñ0˜ı¥Á´|œ\0øúfµ_O2“m‚ã}æ”ÙD§i_¸_d³ğÀÃÁb§ŒÎœ½Pi3Ú¼†ïÏƒ±è‘2{ş]éÖÎ4w7S]­í	Z›Â.7½Ú¶ó\\pÈp½—-ÔÏñ¹bÍİ¯İõúós½î.V¬Ñcÿ€ä›¿»¡GAEèÕyùË\Z­…âUBÖ7æËÓ÷T2¥()8Ã¦@LDQ=ß·=v¯(œjÆ¦ØÉÔß`¤(ı“¯ĞKş,Zæï²c²·umœŞØWd68COË\">xolé8µ$åÏŞ\r£ÿ&ÕĞ¼]£õ´ÿƒUQ^oÏJc[nÂa¶âaÆIºåÍğ`¼”GzDó\n\Zèu™ùdŒôc¸IåAKÙ,\nxÎHé\'íDÌ·ÿÙh~ªpÎH³|/¬=ÍßÃ¾dÍ¢³¡Á¿Qç•X³a¿`µ+š‰f~ïSÇ¶qb5Ó.ğ‚ç“}ı¹¿òÙOæ>æÚl{¬ıÕ¼ûaD€<Ú­df›s:~ş_ñğõe–\n7Nexg\'pØFÊ]Ì­±ï›îŠxÉóŸÉn¯ îDJ¯ØÆ›µ˜dÚz¿İ}¯\'İ^¯;Y¿ì>ö¦0Vtò¡á¬Å¨s4Õ©6æ£9ÂÚL\"	\"8ÁŒÃ6æŒÔ¶Ñ|FjÌù·m£ùüÛ˜³[FŒÙÆ-%Y·€(s«#Î$on‹/Ûˆóæ[DB{ƒÙJ¤ƒûƒ$`‹µg~¼	0[‘tpgxÄ	[‘tpWÙÃR¶2éà`x>[¡tp7xÅ[´cñ}áY(d+k¹p/xgøIÙ6Ú´‡€8 e+–ÚG@²m¥&1\nBâ€˜-Bz\'x&7c‹×¾İAq@Î–×íŞ‹r¶Ñk£€í}P¶Ïè…ãÖ›²åöúº#é³MÙ¶ØEˆ:q ÛxÒA$(â±…kßZF­8ĞŒmÿ©ØúÆHÇbû\\ÒAXšÀö™¤ƒ¼^hÊ\Z/Ü.ˆ~=±Ù>t@\rÉ‹ÎV2* \rĞ•±ÙòŠ¶‹Ù ËÙFëĞ\ZÛEÉÙFêĞöCpã\"¶áìÑ{ºcB;l;ııc?f\r{Ú&l;í#M•¸ZCÊ¶3)µx3¢\']Ûl;ã©yÄ&2/Şäu)r¶NO5OÃD¹š÷&UMØv:İYã[\0‰-¦Í*4š±ít~vyÔLEòL§£ÿàìîÈlXMvÓYËdgËM·)ÕşÛ™¼çÂÌ=e\0\0\0\0IEND®B`‚',1),
(100003,'pipih','123456','STAFF','KEUANGAN','JAYAPURA','2019-07-15',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0í\0\0\0Õ\0\0\0Œº‡}\0\0\0xPLTEh½Eÿÿÿ_º7f¼BÆä»ËçÁ[¹1c»>\\¹3a»;e¼@Y¸.úıùşÿıøüöl¿Jêõæ½à±}ÅarÁRòùïªØšÏèÆ‡ÉnáñÜ¸Ş«¤Õ“ÙíÒÍzæóá–ÏzÄ]›Ñˆ‰Êq¯Ú “Î~¥Õ”vÂX­ÙÛîÕæMç½\0\0IDATxœÍ]ézê:4$vÂe+§¥í¥}ÿ7¼,…’Xv4ŠÌÏó†LK¶F‹ê4Æj²[ÎT»˜-7İqó[U\rÿşg—§6KZ&«TÙt´ù÷P¶İ™ÉZ\'zEb‹éâal{#İşK-#7ï¯a;^¦÷æzâ[|\rïÏvRäàzD¦ÅŸ³”í—y×#Š—»²í¿Û’UJoïÈv8»£%&a—wc;x8Ù]ÑÛ•°]>ö3>CoîÃvıHõ‡Bàxq¶ãç «5¸ÛGùÙ*,î‡`¶¯Å£Y^QÌ[g;{Äv‘FÛe”íD?šã\rŠŸvÙöŸÁù\\‘ìÛe»{*¶JOÚd;~u†Å¼Ævù,Şç‹í¨ ¶‹ôÑì(6±=÷¹ ƒCÛõ3yŸÈ\0ØŸ‘¬Jfí°}{ü©–‚^·Ávõ|&êÍAòÙNŸÍû\\`wñÙöäXK `&l¶Oè}.ÈÙ^ˆËöó¹6Èe¤\\/Äd;VuBÂ}gÌÿ÷õœŞç®â±]E>û$±€ámxlß#zŸÄš|6ËLTC½ÅcÛè}ìh}:¶Œ?ó˜|ÓU,¶ƒˆ·•~ÿ]vñ!æï±Ø¾Äc[”|Å$¢¥7½8lÇñîÉtË—şŒw¬JFĞ†Á68}T¯ÑüÙoâŞa¶¯ñ^­»¡}¸tÓz/TÏ68Oİ«GÜ~gõÒA-Ûˆâ€ıt/¿‹¸I«—êØ#zM˜ÍuÄë×Kul7-³íÆvé®ûÛ¨â@ël•®ñB5l£Ší³µÿ5a»8ˆ\\£-ejÙl³Ã%Œ–Ø¯\Zé Ì÷™ùêş¬zÿL¶¹y[ŒçãÅFÀ×İ¿ğÙââ€y»¸ø‰›ßÊc«——Ké…i0Ó&ÄvˆşX’ŞÅq^¥Ëb«oã¥“ı¸ÂÒAˆ-êù3UZ5c‡ƒmåS\\)ôk\nØ¶ÿÀ\r²öË¨.ÛjÈe¸G¾\rH¶ 8@ä•VÂO¶™÷ÿ\0GH:ğ³ÅCüÈ¦ü2Ø\ZÂÈ¼tÒŸ-æ}å×{åûä°¥>C0¢¼l±°I¶ó\n³ÍÉ­ß{»~ÛÇvı€¦×\nÎÖ£Nbs2BÙBâ€ı¢/2)ÛSÛÔ³æ¶eöJ¶81‰*-[ë»O,€•z¼‡-â}’QŸ¾È¼b]l½úÕP!F“pd¶8úÎÛÊ#ãì.4Í9ád˜Z: Ùœ-nˆ¬/lídä³öÉ^-¶‹lí¨€Ÿ-\"x·.ßÎÒçRßF÷\r±T´t@±E¤iß™c°tó|›úô:$ÖK\0ê·€÷ñlÓÆ#â\ZÜØ…İÓ&rT8—b‹ˆ£òcšEjrÚğAò%`lÆó/èZU~.±ô\'ƒìİ)éÀe‹ˆ´¡_x¾8 æ˜Ğn\r*X!¤‡mX´´şï½%$ÂšX’.bRÛa‹ˆdn‡\0Å““„2UsäåVÕb—-\"ŠéĞß ‹g¤ª)5YõüXe»>Mí÷ş€Zy²‚N¢Ní[…-bHzö¨2Bîª /TT…-²]1Ä«õ™ã`¨z³GTVAä!¶ˆ÷¡¦À¢U¶9µt¡(wE:(±í#ÇJ`\nG<pÚªAaîJĞ¦Ä©[£¶*5«^ hRŠs—¥ƒ[¶ÿ gFœCkV½€muáÑƒBr%éà–-ôĞrøÎEj5±ıÃKµo7l!iš²Qu¡#	[*©q·;î¶PœË¸çZƒ.ÊD Y,¥ìV:øc‰T€ºö8&bKébéàÊˆ¹~!È²Lˆ€:Vuvóf”ì\n„WŸ~#cK”ØbVùF:¸°+Ü]#cG\'Ì rë§¡İ£ºQ/l1åXLŒ>![¢yÖKÇ¸J¿lAiš8ş0n@È6wO~0ã=³@ŞçpßÎ²å¤¹pÎ¡]¸W¯}fû\r¦r¸‰Ïœ»–²uM\"œüÿ+(î‹)!sîú‹±î¥l‰ˆšh“$l‘HŞÄ^é•²%vp1ğÙÒÙş ß…ÛëˆõuˆsXçÏğ”u=ÿeÚs*ëyÁ¹i1[wS§¬g_g¶xİšk’Yå¹b¶îÓE²:ë\ZJRâÊ¬/KÌÖuï+<»õØJIê}Ü®wÎ³u÷’ætÅüÀVP£’;»d–‰”³uŒòPP’e\'¶à6JQ‡[^ğDÌ–NlÏL¡y¹äóÇ\rª(œ½£¤–E÷• hÃ­2â-#9[ë,I™’Y©|ÙºlyN9[W_“”ÿé®ª¦p1p¶î»•°µßŠå;ÊˆÉ–·)Šón³\Zá%eK¥lòÎåî»•Ôíæ‚?\"<¯Ñ,emäˆ³›œL¤‡À3‘n€·t?¦¤à[ÈÖ-BámQÜDZ^U¤ûQˆúæØ\nÖ-‘ìÌ<]WT™Ç/7S	ËßıÅaİ\nl2qŞän¶ËÉíéš7QwƒMæ”ªp#¼ÜÓur›ÃÄn)îş¨l7û–ì¥§‰ê³fÿº™.N6®ßÛóÿÆ‘‚DÍ½lW	¢\0*s¤à–kı¾İî50‘ÅT/³’œ¨  \0I2h¢á§áPÚz(9ßRÕ*¸Fª/2ÉSYì‚L±‚B¸.@–:=4Q\\ŠØß÷Ûë#M”L$Fê—’4¢qÍT‹¤‰R&‰ÛÌ¶Âx2Õ#%nãŠ[y&[óO–8w0B¿-¶DB‹dßxÊİé@dG˜˜İ„nA(ã’V>æ¢	|5‘åå\r æklÄŸÆ‡ë·T4¡%;ETjñÛMÎ‰Š2mLıˆØRíD©ŒÀ ŞjópŞ°ÛF?iªÿrŞ… tá°¬]ıÏ¸¯V x]ª´dùRŠ:õ	O&á_!fMà§½ë\"Ì…£Kø¢wYN\\5‘©\'–àäÂáıù©¶#±ç7PuÛøÜÍssX•§eH\\CEvh„iT+Ş•jâ?³àmfÄwŒû9*?ßjgTåY/âŠìF	=·i]Áén¨ê[°§L\0†êô¿ÚÛlnqÍˆò5û‰5wÒ’Å½ğy­Ô³A\\tÙrn0‹b©è)¨ø.È[Ï(£Ëæ‡£t³)Õ{	ßáúk½°:¾ÓµÈ&:sÕ˜n¶\'Mıç®êøğöÁôœ€!Õí%ß¬àªÑÄ#r±ZÃi#S¥?È«â›ùjëÎ\nÛ`µ0ãé*ÓdŠwá;÷\r;·šÚj¨nş_¿¥µt\Z}îkj„Ÿrj´šôD8ßœ¯!õ*}Ízæy||8‰NjÔïâ|IOS¸Î`wQUyáíÃÿ[¾ú~P/“3¼\r¡:?3l¥%fêí<‰/Z\"Äß¬OÍ.¾ËÿT­üÓ3§\rNŸ\Z‰.èH=øÌx²ôk ;îN–×ƒHpÌH’ÀˆÁddjWG–ÎBıèÇdgñ0˜ı¥Á´|œ\0øúfµ_O2“m‚ã}æ”ÙD§i_¸_d³ğÀÃÁb§ŒÎœ½Pi3Ú¼†ïÏƒ±è‘2{ş]éÖÎ4w7S]­í	Z›Â.7½Ú¶ó\\pÈp½—-ÔÏñ¹bÍİ¯İõúós½î.V¬Ñcÿ€ä›¿»¡GAEèÕyùË\Z­…âUBÖ7æËÓ÷T2¥()8Ã¦@LDQ=ß·=v¯(œjÆ¦ØÉÔß`¤(ı“¯ĞKş,Zæï²c²·umœŞØWd68COË\">xolé8µ$åÏŞ\r£ÿ&ÕĞ¼]£õ´ÿƒUQ^oÏJc[nÂa¶âaÆIºåÍğ`¼”GzDó\n\Zèu™ùdŒôc¸IåAKÙ,\nxÎHé\'íDÌ·ÿÙh~ªpÎH³|/¬=ÍßÃ¾dÍ¢³¡Á¿Qç•X³a¿`µ+š‰f~ïSÇ¶qb5Ó.ğ‚ç“}ı¹¿òÙOæ>æÚl{¬ıÕ¼ûaD€<Ú­df›s:~ş_ñğõe–\n7Nexg\'pØFÊ]Ì­±ï›îŠxÉóŸÉn¯ îDJ¯ØÆ›µ˜dÚz¿İ}¯\'İ^¯;Y¿ì>ö¦0Vtò¡á¬Å¨s4Õ©6æ£9ÂÚL\"	\"8ÁŒÃ6æŒÔ¶Ñ|FjÌù·m£ùüÛ˜³[FŒÙÆ-%Y·€(s«#Î$on‹/Ûˆóæ[DB{ƒÙJ¤ƒûƒ$`‹µg~¼	0[‘tpgxÄ	[‘tpWÙÃR¶2éà`x>[¡tp7xÅ[´cñ}áY(d+k¹p/xgøIÙ6Ú´‡€8 e+–ÚG@²m¥&1\nBâ€˜-Bz\'x&7c‹×¾İAq@Î–×íŞ‹r¶Ñk£€í}P¶Ïè…ãÖ›²åöúº#é³MÙ¶ØEˆ:q ÛxÒA$(â±…kßZF­8ĞŒmÿ©ØúÆHÇbû\\ÒAXšÀö™¤ƒ¼^hÊ\Z/Ü.ˆ~=±Ù>t@\rÉ‹ÎV2* \rĞ•±ÙòŠ¶‹Ù ËÙFëĞ\ZÛEÉÙFêĞöCpã\"¶áìÑ{ºcB;l;ııc?f\r{Ú&l;í#M•¸ZCÊ¶3)µx3¢\']Ûl;ã©yÄ&2/Şäu)r¶NO5OÃD¹š÷&UMØv:İYã[\0‰-¦Í*4š±ít~vyÔLEòL§£ÿàìîÈlXMvÓYËdgËM·)ÕşÛ™¼çÂÌ=e\0\0\0\0IEND®B`‚',1),
(100004,'zaenal','123456','STAFF','GUDANG','SURABAYA','2019-04-16',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0í\0\0\0Õ\0\0\0Œº‡}\0\0\0xPLTEh½Eÿÿÿ_º7f¼BÆä»ËçÁ[¹1c»>\\¹3a»;e¼@Y¸.úıùşÿıøüöl¿Jêõæ½à±}ÅarÁRòùïªØšÏèÆ‡ÉnáñÜ¸Ş«¤Õ“ÙíÒÍzæóá–ÏzÄ]›Ñˆ‰Êq¯Ú “Î~¥Õ”vÂX­ÙÛîÕæMç½\0\0IDATxœÍ]ézê:4$vÂe+§¥í¥}ÿ7¼,…’Xv4ŠÌÏó†LK¶F‹ê4Æj²[ÎT»˜-7İqó[U\rÿşg—§6KZ&«TÙt´ù÷P¶İ™ÉZ\'zEb‹éâal{#İşK-#7ï¯a;^¦÷æzâ[|\rïÏvRäàzD¦ÅŸ³”í—y×#Š—»²í¿Û’UJoïÈv8»£%&a—wc;x8Ù]ÑÛ•°]>ö3>CoîÃvıHõ‡Bàxq¶ãç «5¸ÛGùÙ*,î‡`¶¯Å£Y^QÌ[g;{Äv‘FÛe”íD?šã\rŠŸvÙöŸÁù\\‘ìÛe»{*¶JOÚd;~u†Å¼Ævù,Şç‹í¨ ¶‹ôÑì(6±=÷¹ ƒCÛõ3yŸÈ\0ØŸ‘¬Jfí°}{ü©–‚^·Ávõ|&êÍAòÙNŸÍû\\`wñÙöäXK `&l¶Oè}.ÈÙ^ˆËöó¹6Èe¤\\/Äd;VuBÂ}gÌÿ÷õœŞç®â±]E>û$±€ámxlß#zŸÄš|6ËLTC½ÅcÛè}ìh}:¶Œ?ó˜|ÓU,¶ƒˆ·•~ÿ]vñ!æï±Ø¾Äc[”|Å$¢¥7½8lÇñîÉtË—şŒw¬JFĞ†Á68}T¯ÑüÙoâŞa¶¯ñ^­»¡}¸tÓz/TÏ68Oİ«GÜ~gõÒA-Ûˆâ€ıt/¿‹¸I«—êØ#zM˜ÍuÄë×Kul7-³íÆvé®ûÛ¨â@ël•®ñB5l£Ší³µÿ5a»8ˆ\\£-ejÙl³Ã%Œ–Ø¯\Zé Ì÷™ùêş¬zÿL¶¹y[ŒçãÅFÀ×İ¿ğÙââ€y»¸ø‰›ßÊc«——Ké…i0Ó&ÄvˆşX’ŞÅq^¥Ëb«oã¥“ı¸ÂÒAˆ-êù3UZ5c‡ƒmåS\\)ôk\nØ¶ÿÀ\r²öË¨.ÛjÈe¸G¾\rH¶ 8@ä•VÂO¶™÷ÿ\0GH:ğ³ÅCüÈ¦ü2Ø\ZÂÈ¼tÒŸ-æ}å×{åûä°¥>C0¢¼l±°I¶ó\n³ÍÉ­ß{»~ÛÇvı€¦×\nÎÖ£Nbs2BÙBâ€ı¢/2)ÛSÛÔ³æ¶eöJ¶81‰*-[ë»O,€•z¼‡-â}’QŸ¾È¼b]l½úÕP!F“pd¶8úÎÛÊ#ãì.4Í9ád˜Z: Ùœ-nˆ¬/lídä³öÉ^-¶‹lí¨€Ÿ-\"x·.ßÎÒçRßF÷\r±T´t@±E¤iß™c°tó|›úô:$ÖK\0ê·€÷ñlÓÆ#â\ZÜØ…İÓ&rT8—b‹ˆ£òcšEjrÚğAò%`lÆó/èZU~.±ô\'ƒìİ)éÀe‹ˆ´¡_x¾8 æ˜Ğn\r*X!¤‡mX´´şï½%$ÂšX’.bRÛa‹ˆdn‡\0Å““„2UsäåVÕb—-\"ŠéĞß ‹g¤ª)5YõüXe»>Mí÷ş€Zy²‚N¢Ní[…-bHzö¨2Bîª /TT…-²]1Ä«õ™ã`¨z³GTVAä!¶ˆ÷¡¦À¢U¶9µt¡(wE:(±í#ÇJ`\nG<pÚªAaîJĞ¦Ä©[£¶*5«^ hRŠs—¥ƒ[¶ÿ gFœCkV½€muáÑƒBr%éà–-ôĞrøÎEj5±ıÃKµo7l!iš²Qu¡#	[*©q·;î¶PœË¸çZƒ.ÊD Y,¥ìV:øc‰T€ºö8&bKébéàÊˆ¹~!È²Lˆ€:Vuvóf”ì\n„WŸ~#cK”ØbVùF:¸°+Ü]#cG\'Ì rë§¡İ£ºQ/l1åXLŒ>![¢yÖKÇ¸J¿lAiš8ş0n@È6wO~0ã=³@ŞçpßÎ²å¤¹pÎ¡]¸W¯}fû\r¦r¸‰Ïœ»–²uM\"œüÿ+(î‹)!sîú‹±î¥l‰ˆšh“$l‘HŞÄ^é•²%vp1ğÙÒÙş ß…ÛëˆõuˆsXçÏğ”u=ÿeÚs*ëyÁ¹i1[wS§¬g_g¶xİšk’Yå¹b¶îÓE²:ë\ZJRâÊ¬/KÌÖuï+<»õØJIê}Ü®wÎ³u÷’ætÅüÀVP£’;»d–‰”³uŒòPP’e\'¶à6JQ‡[^ğDÌ–NlÏL¡y¹äóÇ\rª(œ½£¤–E÷• hÃ­2â-#9[ë,I™’Y©|ÙºlyN9[W_“”ÿé®ª¦p1p¶î»•°µßŠå;ÊˆÉ–·)Šón³\Zá%eK¥lòÎåî»•Ôíæ‚?\"<¯Ñ,emäˆ³›œL¤‡À3‘n€·t?¦¤à[ÈÖ-BámQÜDZ^U¤ûQˆúæØ\nÖ-‘ìÌ<]WT™Ç/7S	ËßıÅaİ\nl2qŞän¶ËÉíéš7QwƒMæ”ªp#¼ÜÓur›ÃÄn)îş¨l7û–ì¥§‰ê³fÿº™.N6®ßÛóÿÆ‘‚DÍ½lW	¢\0*s¤à–kı¾İî50‘ÅT/³’œ¨  \0I2h¢á§áPÚz(9ßRÕ*¸Fª/2ÉSYì‚L±‚B¸.@–:=4Q\\ŠØß÷Ûë#M”L$Fê—’4¢qÍT‹¤‰R&‰ÛÌ¶Âx2Õ#%nãŠ[y&[óO–8w0B¿-¶DB‹dßxÊİé@dG˜˜İ„nA(ã’V>æ¢	|5‘åå\r æklÄŸÆ‡ë·T4¡%;ETjñÛMÎ‰Š2mLıˆØRíD©ŒÀ ŞjópŞ°ÛF?iªÿrŞ… tá°¬]ıÏ¸¯V x]ª´dùRŠ:õ	O&á_!fMà§½ë\"Ì…£Kø¢wYN\\5‘©\'–àäÂáıù©¶#±ç7PuÛøÜÍssX•§eH\\CEvh„iT+Ş•jâ?³àmfÄwŒû9*?ßjgTåY/âŠìF	=·i]Áén¨ê[°§L\0†êô¿ÚÛlnqÍˆò5û‰5wÒ’Å½ğy­Ô³A\\tÙrn0‹b©è)¨ø.È[Ï(£Ëæ‡£t³)Õ{	ßáúk½°:¾ÓµÈ&:sÕ˜n¶\'Mıç®êøğöÁôœ€!Õí%ß¬àªÑÄ#r±ZÃi#S¥?È«â›ùjëÎ\nÛ`µ0ãé*ÓdŠwá;÷\r;·šÚj¨nş_¿¥µt\Z}îkj„Ÿrj´šôD8ßœ¯!õ*}Ízæy||8‰NjÔïâ|IOS¸Î`wQUyáíÃÿ[¾ú~P/“3¼\r¡:?3l¥%fêí<‰/Z\"Äß¬OÍ.¾ËÿT­üÓ3§\rNŸ\Z‰.èH=øÌx²ôk ;îN–×ƒHpÌH’ÀˆÁddjWG–ÎBıèÇdgñ0˜ı¥Á´|œ\0øúfµ_O2“m‚ã}æ”ÙD§i_¸_d³ğÀÃÁb§ŒÎœ½Pi3Ú¼†ïÏƒ±è‘2{ş]éÖÎ4w7S]­í	Z›Â.7½Ú¶ó\\pÈp½—-ÔÏñ¹bÍİ¯İõúós½î.V¬Ñcÿ€ä›¿»¡GAEèÕyùË\Z­…âUBÖ7æËÓ÷T2¥()8Ã¦@LDQ=ß·=v¯(œjÆ¦ØÉÔß`¤(ı“¯ĞKş,Zæï²c²·umœŞØWd68COË\">xolé8µ$åÏŞ\r£ÿ&ÕĞ¼]£õ´ÿƒUQ^oÏJc[nÂa¶âaÆIºåÍğ`¼”GzDó\n\Zèu™ùdŒôc¸IåAKÙ,\nxÎHé\'íDÌ·ÿÙh~ªpÎH³|/¬=ÍßÃ¾dÍ¢³¡Á¿Qç•X³a¿`µ+š‰f~ïSÇ¶qb5Ó.ğ‚ç“}ı¹¿òÙOæ>æÚl{¬ıÕ¼ûaD€<Ú­df›s:~ş_ñğõe–\n7Nexg\'pØFÊ]Ì­±ï›îŠxÉóŸÉn¯ îDJ¯ØÆ›µ˜dÚz¿İ}¯\'İ^¯;Y¿ì>ö¦0Vtò¡á¬Å¨s4Õ©6æ£9ÂÚL\"	\"8ÁŒÃ6æŒÔ¶Ñ|FjÌù·m£ùüÛ˜³[FŒÙÆ-%Y·€(s«#Î$on‹/Ûˆóæ[DB{ƒÙJ¤ƒûƒ$`‹µg~¼	0[‘tpgxÄ	[‘tpWÙÃR¶2éà`x>[¡tp7xÅ[´cñ}áY(d+k¹p/xgøIÙ6Ú´‡€8 e+–ÚG@²m¥&1\nBâ€˜-Bz\'x&7c‹×¾İAq@Î–×íŞ‹r¶Ñk£€í}P¶Ïè…ãÖ›²åöúº#é³MÙ¶ØEˆ:q ÛxÒA$(â±…kßZF­8ĞŒmÿ©ØúÆHÇbû\\ÒAXšÀö™¤ƒ¼^hÊ\Z/Ü.ˆ~=±Ù>t@\rÉ‹ÎV2* \rĞ•±ÙòŠ¶‹Ù ËÙFëĞ\ZÛEÉÙFêĞöCpã\"¶áìÑ{ºcB;l;ııc?f\r{Ú&l;í#M•¸ZCÊ¶3)µx3¢\']Ûl;ã©yÄ&2/Şäu)r¶NO5OÃD¹š÷&UMØv:İYã[\0‰-¦Í*4š±ít~vyÔLEòL§£ÿàìîÈlXMvÓYËdgËM·)ÕşÛ™¼çÂÌ=e\0\0\0\0IEND®B`‚',1);

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
