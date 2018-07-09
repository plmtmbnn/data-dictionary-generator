/*
SQLyog Community v12.2.1 (64 bit)
MySQL - 10.1.13-MariaDB : Database - db_datadictionary
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_datadictionary` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_datadictionary`;

/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `idAttribute` int(11) NOT NULL AUTO_INCREMENT,
  `attributeName` varchar(255) DEFAULT NULL,
  `dataType` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAttribute`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;

/*Data for the table `attribute` */

insert  into `attribute`(`idAttribute`,`attributeName`,`dataType`,`length`,`description`,`alias`,`createdAt`,`updatedAt`) values 
(191,'sample',NULL,NULL,NULL,NULL,NULL,NULL),
(192,'judul proposal','String','255','qwf','qwf','2018-07-02 14:49:04','2018-07-02 14:49:52'),
(193,'pendahuluan','Number','11','qwf','qwf','2018-07-02 14:49:04','2018-07-08 16:02:07'),
(194,'daftar nama program kerja','Number','11','qwf','qwf','2018-07-02 14:49:04','2018-07-08 16:02:07'),
(195,'tujuan program kerja','Number','11','qwf','qwf','2018-07-02 14:49:04','2018-07-08 16:02:07'),
(196,'rencana pelaksanaan program kerja','Number','11','qwf','qwf','2018-07-02 14:49:04','2018-07-08 16:02:07'),
(197,'anggaran biaya program kerja','Number','11','qwf','qwf','2018-07-02 14:49:04','2018-07-08 16:02:07'),
(198,'penutup','Integer','11','updated3','qwf','2018-07-02 14:49:04','2018-07-08 16:02:07'),
(199,'tandatangan pembuat keputusan','Number','11','qwf','qwf','2018-07-02 14:49:04','2018-07-02 14:49:52'),
(200,'waktu dan tempat rapat','Number','11','123','123','2018-07-02 14:56:19','2018-07-02 14:56:40'),
(201,'peserta rapat','Number','11','123','123','2018-07-02 14:56:20','2018-07-02 14:56:40'),
(202,'pembuka','Number','11','123','123','2018-07-02 14:56:20','2018-07-02 14:56:40'),
(203,'materi rapat','Number','11','123','123','2018-07-02 14:56:20','2018-07-02 14:56:40'),
(204,'hasil keputusan rapat','Number','11','123','123','2018-07-02 14:56:20','2018-07-02 14:56:40'),
(205,'tandatangan pemimpin rapat','String','255','123','123','2018-07-02 14:56:20','2018-07-02 14:56:40'),
(206,'judul laporan','','','','','2018-07-08 15:51:10','2018-07-08 16:02:07'),
(207,'tanda tangan pembuat keputusan','Integer','11','awf','awf','2018-07-08 15:51:10','2018-07-08 16:33:25'),
(208,'nama penerima memo','String','5000','qwf','qwf','2018-07-08 16:36:01',NULL),
(209,'isi memo','Integer','11','qwf','qwf','2018-07-08 16:36:01',NULL),
(210,'tanda tangan pemberi memo','Integer','11','qwf','qwf','2018-07-08 16:36:01',NULL),
(211,'kop surat','','','','','2018-07-08 16:52:35',NULL),
(212,'nomor surat','','','','','2018-07-08 16:52:35',NULL),
(213,'hal surat','','','','','2018-07-08 16:52:35',NULL),
(214,'tujuan surat','','','','','2018-07-08 16:52:36',NULL),
(215,'pembuka surat','','','','','2018-07-08 16:52:36',NULL),
(216,'waktu dan tempat workshop','','','','','2018-07-08 16:52:36',NULL),
(217,'penutup surat','','','','','2018-07-08 16:52:36',NULL),
(218,'tanda tangan pengundang','','','','','2018-07-08 16:52:36',NULL);

/*Table structure for table `datadictionary_attribute` */

DROP TABLE IF EXISTS `datadictionary_attribute`;

CREATE TABLE `datadictionary_attribute` (
  `idDataDictionaryAttribute` int(11) NOT NULL AUTO_INCREMENT,
  `dataDictionaryId` int(11) DEFAULT NULL,
  `attributeId` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  KEY `id` (`idDataDictionaryAttribute`),
  KEY `dataDictionaryId` (`dataDictionaryId`),
  KEY `attributeId` (`attributeId`),
  CONSTRAINT `datadictionary_attribute_ibfk_1` FOREIGN KEY (`dataDictionaryId`) REFERENCES `datadictonary` (`idDataDictionary`),
  CONSTRAINT `datadictionary_attribute_ibfk_2` FOREIGN KEY (`attributeId`) REFERENCES `attribute` (`idAttribute`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `datadictionary_attribute` */

insert  into `datadictionary_attribute`(`idDataDictionaryAttribute`,`dataDictionaryId`,`attributeId`,`createdAt`,`updatedAt`) values 
(35,5,192,'2018-07-02 14:49:05',NULL),
(36,5,193,'2018-07-02 14:49:05',NULL),
(37,5,194,'2018-07-02 14:49:05',NULL),
(38,5,195,'2018-07-02 14:49:05',NULL),
(39,5,196,'2018-07-02 14:49:05',NULL),
(40,5,197,'2018-07-02 14:49:05',NULL),
(41,5,198,'2018-07-02 14:49:05',NULL),
(42,5,199,'2018-07-02 14:49:05',NULL),
(43,6,200,'2018-07-02 14:56:20',NULL),
(44,6,201,'2018-07-02 14:56:20',NULL),
(45,6,202,'2018-07-02 14:56:20',NULL),
(46,6,203,'2018-07-02 14:56:20',NULL),
(47,6,204,'2018-07-02 14:56:20',NULL),
(48,6,198,'2018-07-02 14:56:20',NULL),
(49,6,205,'2018-07-02 14:56:20',NULL),
(50,7,206,'2018-07-08 15:51:10',NULL),
(51,7,193,'2018-07-08 15:51:10',NULL),
(52,7,194,'2018-07-08 15:51:10',NULL),
(53,7,195,'2018-07-08 15:51:10',NULL),
(54,7,196,'2018-07-08 15:51:10',NULL),
(55,7,197,'2018-07-08 15:51:10',NULL),
(56,7,198,'2018-07-08 15:51:10',NULL),
(57,7,207,'2018-07-08 15:51:10',NULL),
(58,8,208,'2018-07-08 16:36:01',NULL),
(59,8,209,'2018-07-08 16:36:01',NULL),
(60,8,210,'2018-07-08 16:36:01',NULL),
(61,9,211,'2018-07-08 16:52:36',NULL),
(62,9,212,'2018-07-08 16:52:36',NULL),
(63,9,213,'2018-07-08 16:52:36',NULL),
(64,9,214,'2018-07-08 16:52:36',NULL),
(65,9,215,'2018-07-08 16:52:36',NULL),
(66,9,216,'2018-07-08 16:52:36',NULL),
(67,9,217,'2018-07-08 16:52:36',NULL),
(68,9,218,'2018-07-08 16:52:36',NULL);

/*Table structure for table `datadictonary` */

DROP TABLE IF EXISTS `datadictonary`;

CREATE TABLE `datadictonary` (
  `idDataDictionary` int(11) NOT NULL AUTO_INCREMENT,
  `dataDictionaryCode` varchar(255) DEFAULT NULL,
  `documentName` varchar(255) DEFAULT NULL,
  `dataForm` varchar(100) DEFAULT NULL,
  `processCode` varchar(255) DEFAULT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idDataDictionary`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `datadictonary` */

insert  into `datadictonary`(`idDataDictionary`,`dataDictionaryCode`,`documentName`,`dataForm`,`processCode`,`processName`,`activity`,`actor`,`description`,`createdAt`,`updatedAt`) values 
(5,'DD-BP-DDiak-03-01-001','Proposal  Program Kerja','awf','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Proposal Program Kerja','Biro Transformasi Sosial','updated','2018-07-02 14:49:04','2018-07-02 14:49:52'),
(6,'DD-BP-DDiak-03-01-002','Laporan Rapat','awf','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Mengadakan rapat ','Departemen Diakonia','updated','2018-07-02 14:56:19','2018-07-02 14:56:40'),
(7,'DD-BP-DDiak-03-01-003','Laporan Program Kerja','Laporan tercetak','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Laporan  Program Kerja','Komisi  Keuangan','updated','2018-07-08 15:51:09','2018-07-08 16:02:07'),
(8,'DD-BP-DDiak-03-04-004','Memo Pencairan Panjar Dana','Dokumen tercetak','BP-DDiak-03-04','Proses Penyelenggaraan Pelatihan Tenaga Pengajar','Membuat memo pencairan  panjar dana','Sekretaris Jenderal','qwf','2018-07-08 16:36:01',NULL),
(9,'DD-BP-DDiak-03-05-003','Undangan Workshop','Dokumen tercetak','BP-DDiak-03-05','Proses Penyelenggaraan Workshop','Membuat undangan workshop ','Departemen Diakonia','weg','2018-07-08 16:52:35',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
