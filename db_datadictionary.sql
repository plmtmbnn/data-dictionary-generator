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
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=latin1;

/*Data for the table `attribute` */

insert  into `attribute`(`idAttribute`,`attributeName`,`dataType`,`length`,`description`,`alias`,`createdAt`,`updatedAt`) values 
(191,'sample',NULL,NULL,NULL,NULL,NULL,NULL),
(192,'judul laporan','String','255','Judul laporan/dokumen/proposal yang dicetak','judul','2018-07-10 09:00:14','2018-07-15 14:23:00'),
(193,'latar belakang laporan','String','255','latar belakang laporan yang dicetak','latar belakang','2018-07-10 09:00:15','2018-07-15 14:23:00'),
(194,'tujuan laporan','String','255','Tujuan laporan yang dicetak','-','2018-07-10 09:00:15','2018-07-10 09:23:43'),
(195,'kepengurusan cum','String','50','Daftar nama-nama kepengurusan CUM pada laporan yang dicetak','-','2018-07-10 09:00:15',NULL),
(196,'isi laporan','String','255','Isi laporan yang dicetak','isi','2018-07-10 09:00:15','2018-07-15 14:23:00'),
(197,'judul diskusi','String','255','Judul topik yang dibicarakan dalam diskusi','judul','2018-07-10 09:14:49','2018-07-10 09:25:15'),
(198,'waktu diskusi','Date','10','Waktu dilakukannya diskusi','-','2018-07-10 09:14:49',NULL),
(199,'peserta diskusi','String','50','Nama peserta yang ikut dalam diskusi','-','2018-07-10 09:14:49',NULL),
(200,'materi diskusi','String','255','Materi yang dibicarakan dalam diskusi','-','2018-07-10 09:14:49',NULL),
(201,'pembahasan diskusi','String','255','Perihal yang dibahas dalam diskusi','-','2018-07-10 09:14:49',NULL),
(202,'keputusan diskusi','String','255','Keputusan yang disepakai dalam diskusi','-','2018-07-10 09:14:49',NULL),
(203,'tempat diskusi','String','35','Tempat/kota dilakukan diskusi','-','2018-07-10 09:14:49',NULL),
(204,'judul dokumen','String','255','Judul dari dokumen pengurusan CUM','judul','2018-07-10 09:21:00',NULL),
(205,'daftar nama pengurus cum','String','100','Berisi nama anggota pengurus CUM','-','2018-07-10 09:21:00','2018-07-10 09:28:11'),
(206,'judul proposal','String','255','Judul proposal yang dicetak','-','2018-07-10 09:44:55','2018-07-15 15:08:41'),
(207,'latar belakang proposal','String','255','Latar belakang proposal yang dicetak','-','2018-07-10 09:44:55','2018-07-15 15:08:41'),
(208,'teknis pelaksanaan','String','255','Teknis pelaksanaan kegiatan yang diusulkan','-','2018-07-12 21:14:53','2018-07-15 15:08:41'),
(209,'tujuan program kerja','String','255','Tujuan masing-masing program kerja yang diusulkan','-','2018-07-10 09:44:55','2018-07-15 15:08:41'),
(210,'rencana pelaksanaan program kerja','Date','10','Jadwal rencana pelakasaan program kerja','-','2018-07-10 09:44:55','2018-07-15 15:08:41'),
(211,'anggaran biaya program kerja','Currency','8','Besar anggaran yang diprediksi digunakan pada program kerja','-','2018-07-10 09:44:55','2018-07-15 15:08:42'),
(212,'diterima oleh','String','255','Pihak yang menerima ','-','2018-07-12 21:14:53','2018-07-15 15:08:42'),
(213,'nama penerima memo','String','100','Nama orang sebagai penerima memo','-','2018-07-10 09:50:05',NULL),
(214,'isi memo','String','500','Isi memo yang disampaikan','-','2018-07-10 09:50:05',NULL),
(215,'latar belakang laporan','String','255','Latar belakang laporan/dokumen/proposal yang dicetak','latar belakang','2018-07-10 10:12:54',NULL),
(216,'nama kegiatan','String','255','Nama kegiatan','-','2018-07-10 10:12:54','2018-07-11 16:01:10'),
(217,'maksud dan tujuan kegiatan','String','255','Maksud dan kegiatan yang telah diselenggarakan','-','2018-07-10 10:12:54',NULL),
(218,'sasaran kegiatan','String','255','Sasaran dari kegiatan yang diselenggarakan','-','2018-07-10 10:12:55',NULL),
(219,'susunan kepanitiaan','String','100','Struktur kepengurusan kepanitian dalam kegiatan','-','2018-07-10 10:12:55',NULL),
(220,'waktu kegiatan','Date','10','Jadwal dilaksanakan kegiatan','-','2018-07-10 10:12:55',NULL),
(221,'tempat kegiatan','String','100','Lokasi/kota dilakukannya kegiatan','-','2018-07-10 10:12:55',NULL),
(222,'rencana mekanisme kegiatan','String','255','Mekanisme atau teknis pelaksanaan kegiatan','-','2018-07-10 10:12:55',NULL),
(223,'rencana anggaran biaya','Currency','8','Rencana biaya yang digunakan dalam kegiatan','-','2018-07-10 10:12:55',NULL),
(224,'mekanisme realisasi kegiatan','String','255','Mekanisme atau teknis realisasi setelah kegiatan berjalan','-','2018-07-10 10:12:55',NULL),
(225,'realisasi anggaran biaya','Currency','8','Total biaya yang digunakan setelah kegiatan','-','2018-07-10 10:12:55',NULL),
(226,'evaluasi pelaksanaan','String','500','Hasil evaluasi kegiatan','-','2018-07-10 10:12:55',NULL),
(227,'hasil pelaksanaan','String','255','Hasil pelaksaan kegiatan','-','2018-07-10 10:12:55',NULL),
(228,'judul rapat','String','255','Topik yang dibicarakan dalam rapat','-','2018-07-10 10:18:23','2018-07-15 15:42:56'),
(229,'waktu rapat','Date','10','Waktu pelaksaaan rapat','-','2018-07-10 10:18:23','2018-07-15 15:42:56'),
(230,'tempat rapat','String','100','Tempat/lokasi pelaksaan rapat','-','2018-07-10 10:18:23','2018-07-15 15:42:56'),
(231,'peserta rapat','String','100','Nama anggota peserta rapat','-','2018-07-10 10:18:23','2018-07-15 15:42:56'),
(232,'materi rapat','String','255','Materi yang bahas dalam rapat','-','2018-07-10 10:18:23','2018-07-15 15:42:56'),
(233,'pembahasan rapat','String','255','Hal-hal yang dibahas dalam rapat','-','2018-07-10 10:18:24','2018-07-15 15:42:56'),
(234,'keputusan rapat','String','255','Putusan hasil kesepakatan dalam rapat','-','2018-07-10 10:18:24','2018-07-15 15:42:56'),
(235,'nama peserta','String','100','Nama masyarakat yang ikut serta','nama','2018-07-10 10:36:47','2018-07-10 11:22:06'),
(236,'umur peserta','Integer','2','Umur masyarakat yang ikut serta','umur','2018-07-10 10:36:47','2018-07-10 11:22:06'),
(237,'alamat peserta','String','255','Alamat masyarakat yang ikut serta','alamat','2018-07-10 10:36:48','2018-07-10 11:22:06'),
(238,'materi rapat','String','255','Materi rapat yang dibahas','-','2018-07-10 10:18:23','2018-07-15 15:42:56'),
(239,'nama jemaat','String','100','Nama jemaat yang ikut serta','-','2018-07-10 10:59:14','2018-07-10 11:23:46'),
(240,'umur jemaat','Integer','3','Umur jemaat yang ikut serta','-','2018-07-10 10:59:14','2018-07-10 11:23:47'),
(241,'alamat','String','255','Alamat jemaat yang ikut serta','alamat','2018-07-10 10:59:14','2018-07-10 11:23:47'),
(242,'tujuan laporan','String','255','Tujuan laporan/dokumen/proposal yang dicetak','tujuan','2018-07-10 12:28:09','2018-07-10 09:23:43'),
(243,'disetujui oleh','String','100','Tanda bukti bahwa dokumen/laporan/proposal telah disetujui atau diketahui seseorang. Berisi nama dan tanda tangan.','diketahui oleh','2018-07-10 12:28:09',NULL),
(244,'disetujui oleh','String','100','Persetujuan atau diketahui oleh pembuat keputusan biasanya berupa tanda tangan dan nama.','-','2018-07-10 12:28:09','2018-07-15 15:42:56'),
(245,'tanda tangan pemimpin diskusi','String','100','Bukti persetujuan atau diketahui oleh pembuat keputusan berupa tanda tangan dan nama','tanda tangan','2018-07-10 14:32:12',NULL),
(246,'latar belakang dokumen','String','255','pembuka laporan/dokumen/proposal yang dicetak','pembuka','2018-07-10 14:45:33',NULL),
(247,'isi dokumen','String','255','Pembuka laporan/dokumen/proposal yang dicetak','penutup','2018-07-10 14:45:33',NULL),
(248,'tanda tangan yang mengetahui','String','100','Bukti persetujuan atau diketahui oleh pembuat keputusan berupa tanda tangan dan nama','tanda tangan','2018-07-10 14:45:33','2018-07-11 15:26:59'),
(249,'tanda tangan pemberi memo','String','100','Bukti persetujuan atau diketahui oleh pembuat keputusan berupa tanda tangan dan nama','tanda tangan','2018-07-10 14:52:34',NULL),
(250,'data panitia','String','65535','Data nama panitia yang dipilih','-','2018-07-10 20:50:21',NULL),
(251,'kop surat','String','255','Kop surat berfungsi untuk pemberian informasi mengenai nama, alamat, kegiatan dari lembaga tersebut.','-','2018-07-10 21:10:27','2018-07-11 13:42:02'),
(252,'judul surat','String','65535','Judul surat penugasan','-','2018-07-10 21:10:27','2018-07-11 13:42:02'),
(253,'nomor surat','String','50','Nomor surat biasanya meliputi nomor urut penulisan surat, kode surat, tanggal, bulan dan tahun penulisan surat.','-','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(254,'nama pemberi tugas','String','100','Nama yang memberi tugas','-','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(255,'nama penerima tugas','String','100','Nama yang menerima tugas','-','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(256,'isi surat','String','255','Isi surat','-','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(257,'waktu pemberian tugas','Date','10','Waktu pemberian tugas','-','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(258,'tempat pemberian tugas','String','100','Tempat/Lokasi pemberian tugas','-','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(259,'tanda tangan pemberi tugas','String','100','Bukti disetujuinya penyerahan tugas. Ditandai dengan adanya tanda tangan dan nama.','tanda tangan','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(260,'tanda tangan penerima tugas','String','100','Bukti diterimanya penyerahan tugas. Ditandai dengan adanya tanda tangan dan nama.','tanda tangan','2018-07-10 21:10:27','2018-07-11 13:42:03'),
(261,'tanggal surat','Date','10','Tanggal pembuatan surat','tanggal','2018-07-10 21:22:26',NULL),
(262,'hal surat','String','255','Petunjuk pokok dari surat','-','2018-07-10 21:22:26',NULL),
(263,'alamat tujuan surat','String','100','Alamat tujuan surat','-','2018-07-10 21:22:27',NULL),
(264,'pembuka surat','String','255','Pembuka surat','-','2018-07-10 21:22:27',NULL),
(265,'waktu dan tempat pelantikan','String','255','Waktu dan tempat dilakukannya pelantikan','-','2018-07-10 21:22:27',NULL),
(266,'penutup surat','String','255','Penutup surat','-','2018-07-10 21:22:27',NULL),
(267,'tanda tangan pengundang','String','100','Bukti surat telah dikirim orang uang sesuai, berisi tanda tangan dan nama pengirim.','tanda tangan','2018-07-10 21:22:27',NULL),
(268,'nama sekolah','String','255','Nama sekolah yang diobservasi','-','2018-07-11 14:32:24',NULL),
(269,'jumlah kelas','Integer','2','Jumlah sekolah yang diobservasi','-','2018-07-11 14:32:24',NULL),
(270,'keterangan kerusakan','String','255','Detail keterangan sekolah yang rusak.','-','2018-07-11 14:32:24',NULL),
(271,'tempat dan tanggal laporan','String','150','Tempat dan tanggal laporan dicetak','-','2018-07-11 14:32:24',NULL),
(272,'judul MoU','String','150','Judul MoU','-','2018-07-11 14:41:56',NULL),
(273,'latar belakang MoU','String','255','pembuka MoU','-','2018-07-11 14:41:56',NULL),
(274,'pihak pelaksana MoU','String','255','Informasi data diri pihak yang menjali kesepakatan dalam MoU','-','2018-07-11 14:41:57',NULL),
(275,'maksud dan tujuan MoU','String','255','Maksud atau tujuan mencerminkan kehendak para pihak untuk melakukan kegiatan yang saling menguntungkan.','-','2018-07-11 14:41:57',NULL),
(276,'ruang lingkup MoU','String','255','Gambaran umum tentang kegiatan yang akan dilaksanakan','-','2018-07-11 14:41:57',NULL),
(277,'realisasi mou','String','255','Pelaksanaan dan rincian kegiatan dari Nota Kesepahaman','-','2018-07-11 14:41:57',NULL),
(278,'jangka waktu','Date','10','Masa berlakunya Nota Kesepahaman dan jangka waktu dapat diperpanjang atas kesepakatan para pihak','-','2018-07-11 14:41:57',NULL),
(279,'biaya penyelenggaraan','Currency','8',' Beban yang dikeluarkan sebagai akibat pelaksanaan kegiatan','-','2018-07-11 14:41:57',NULL),
(280,'aturan peralihan','String','255','Memuat perubahan yang mungkin terjadi, yang hanya dapat dilakukan atas persetujuan kedua belah pihak','-','2018-07-11 14:41:57',NULL),
(281,'penutup mou','String','255','Bagian akhir dari Nota Kesepahaman dan dirumuskan dengan kalimat yang sederhana','-','2018-07-11 14:41:57',NULL),
(282,'tandatangan pihak mou','String','100','Bukti telah disutujuinya dan diketahuinya MoU, berupa tanda tangan dan nama.','-','2018-07-11 14:41:57',NULL),
(283,'bahan produksi','String','100','Bahan yang digunakan dalam produksi','-','2018-07-11 14:47:41',NULL),
(284,'biaya pembelian bahan','Currency','8','Biaya untuk pembelian barang untuk produksi','-','2018-07-11 14:47:41',NULL),
(285,'nama barang produksi','String','100','Nama barang produksi','-','2018-07-11 14:47:41',NULL),
(286,'tipe barang produksi','String','50','Tipe barang produksi','-','2018-07-11 14:47:41',NULL),
(287,'jumlah barang produksi','Integer','4','Jumlah barang produksi','-','2018-07-11 14:47:41',NULL),
(288,'tanda tangan pemimpin produksi','String','100','Bukti telah disetujui atau diketahui isi laporan, berupa tanda tangan dan nama pemimpin produkis .','-','2018-07-11 14:47:41',NULL),
(289,'nama barang tersedia','String','100','Nama barang tersedia','-','2018-07-11 14:50:42',NULL),
(290,'jumlah barang tersedia','Integer','4','Jumlah barang tersedia','-','2018-07-11 14:50:42',NULL),
(291,'nama barang terjual','String','100','Nama barang terjual','-','2018-07-11 14:50:42',NULL),
(292,'biaya pemasukan barang terjual','Currency','8','Biaya pemasukan terjual untuk masing-masing barang','-','2018-07-11 14:50:42',NULL),
(293,'total penjualan','Integer','8','Total penjualan keseluruhan produk dalam periode tertentu.','-','2018-07-11 14:50:42',NULL),
(294,'nama alat','String','100','Nama alat keperluan pelatihan','-','2018-07-11 14:54:07',NULL),
(295,'jumlah alat','Integer','4','Jumlah alat keperluan pelatihan','-','2018-07-11 14:54:07',NULL),
(296,'nama barang','String','100','Nama barang keperluan pelatihan','-','2018-07-11 14:54:07',NULL),
(297,'jumlah barang','Integer','4','Jumlah barang keperluan pelatihan','-','2018-07-11 14:54:07',NULL),
(298,'biaya','Currency','8','Harga pembelian alat dan bahang','-','2018-07-11 14:54:08',NULL),
(299,'jumlah uang tersimpan','Currency','8','Jumlah uang yang tersimpan','-','2018-07-11 15:07:32',NULL),
(300,'jumlah uang masukan','Currency','8','Jumlah uang masuk','-','2018-07-11 15:07:32',NULL),
(301,'daftar pengeluaran','String','150','Daftar pengeluaran','-','2018-07-11 15:07:32',NULL),
(302,'biaya pengeluaran','Currency','8','Biaya pengeluaran','-','2018-07-11 15:07:32',NULL),
(303,'isi laporan','String','255','Menjelaskan kekurangan yang didapatkan','-','2018-07-11 15:11:09',NULL),
(304,'pembuka proposal','String','255','Pembuka proposal/dokumen/laporan yang dicetak','pembuka','2018-07-11 15:17:12',NULL),
(305,'waktu dan tempat kegiatan','String','150','Waktu dan tempat dibuatnya proposal','-','2018-07-11 15:17:12',NULL),
(306,'peserta kegiatan','String','100','Nama peserta yang ikut kegiatan','-','2018-07-11 15:17:12',NULL),
(307,'daftar keperluan dana','String','100','Daftar keperluan dan dana yang digunakan','-','2018-07-11 15:17:12',NULL),
(308,'kepanitiaan','String','100','Nama panitia yang terlibat dalam kegiatan','-','2018-07-11 15:17:12',NULL),
(309,'tandatangan panitia','','','','','2018-07-11 15:17:12',NULL),
(310,'nama anak','String','100','Nama anak yang mengikuti program','nama','2018-07-11 15:19:49',NULL),
(311,'umur anak','Integer','2','Umur anak yang mengikuti program','umur','2018-07-11 15:19:49',NULL),
(312,'alamat anak','String','255','Alamat anak yang mengikuti program','-','2018-07-11 15:19:49',NULL),
(313,'waktu dan tempat kejadian bencana','String','150','Waktu dan tempat terjadinya bencana alam','-','2018-07-11 15:52:26',NULL),
(314,'bencana yang terjadi','String','150','Nama bencana yang terjadi','-','2018-07-11 15:52:26',NULL),
(315,'tingkat kerusakan','String','255','Detail kerusakan yang disebabkan bencana alam','-','2018-07-11 15:52:26',NULL),
(316,'daftar kebutuhan bantuan','String','100','Daftar kebutuhan bantuan','-','2018-07-11 15:52:26',NULL),
(317,'jumlah korban bencana','Integer','7','Jumlah korban bencana','-','2018-07-11 15:52:27',NULL),
(318,'aspek','String','50','Aspek yang ditinjau dari suatu kegiatan','-','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(319,'target kegiatan','String','255','Target kegiatan yang diharapkan dalam melakukan kegiatan','-','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(320,'kendala','String','255','Kendala saat melakukan kegiatan','-','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(321,'ketercapaian','String','255','Realisasi kegiatan yang telah dilakukan','-','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(322,'kesimpulan','String','255','Kesimpulan kegiatan yang telah dilakukan','-','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(323,'tindak lanjut','String','255','Tindak lanjut atau perbaikan untuk kegiatan berikutnya','-','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(324,'nama anggota keluarga','String','100','Nama anggota keluarga','-','2018-07-11 16:00:54',NULL),
(325,'umur anggota keluarga','Integer','2','Usia anggota keluarga','usia','2018-07-11 16:00:54',NULL),
(326,'jenis kelamin','String','10','Jenis kelamin terdiri dari Laki-laki atau Perempuan','-','2018-07-11 16:00:54',NULL),
(327,'pekerjaan','String','50','Pekerjaan anggota keluarga','-','2018-07-11 16:00:54',NULL),
(328,'nama orang tua','String','100','Nama orang tua anak yang mengikuti program','nama','2018-07-11 16:07:21',NULL),
(329,'keadaan orangtua','String','100','Keadaan ekonomi dan kondisi orang tua anak','-','2018-07-11 16:07:21',NULL),
(330,'nama anggota','String','100','Nama anggota','nama','2018-07-11 16:12:16',NULL),
(331,'tempat lahir','String','50','Tempat lahir anggota','-','2018-07-11 16:12:16',NULL),
(332,'tanggal lahir','Date','10','Tanggal lahir','-','2018-07-11 16:12:16',NULL),
(333,'nomor KTP','String','16','Nomor KTP anggota','-','2018-07-11 16:12:16',NULL),
(334,'perihal','String','255','Pokok penting yang dibahas dalam surat','-','2018-07-11 16:17:51',NULL),
(335,'tempat dan tanggal surat','String','100','Tempat dan tanggal surat diterbitkan','-','2018-07-11 16:17:51',NULL),
(336,'nama pemohon','String','100','Nama pemohon surat ','-','2018-07-11 16:17:51',NULL),
(337,'umur pemohon','Integer','2','Usia pemohon surat ','-','2018-07-11 16:17:51',NULL),
(338,'alamat pemohon','String','255','Alamat pemohon','-','2018-07-11 16:17:51',NULL),
(339,'tanda tangan pendeta','String','100','Bukti diketahui atau disetujui surat berupa tanda tangan dan nama','-','2018-07-11 16:17:51',NULL),
(340,'umur orang tua','Integer','2','Umur orang tua pemohon','umur','2018-07-11 16:20:48',NULL),
(341,'pekerjaan orang tua','String','100','Pekerjaan orang tua pemohon','-','2018-07-11 16:20:48',NULL),
(342,'alamat orang tua','String','255','Alamat orang tua pemohon','alamat','2018-07-11 16:20:48',NULL),
(343,'tanda tangan orangtua','String','100','Bukti disetujui dan diketahui oleh orang tua pemohon berupa nama dan tanda tangan','-','2018-07-11 16:20:48',NULL),
(344,'berat badan','Integer','3','Berat badan','-','2018-07-11 16:22:39',NULL),
(345,'tinggi badan','Integer','3','Tinggi badan','-','2018-07-11 16:22:39',NULL),
(346,'tanda tangan dokter','String','100','Bukti diketahuinya atau disetujuinya surat berupa nama dan tanda tangan','tanda tangan','2018-07-11 16:22:39',NULL),
(347,'tempat dan tanggal lahir','String','100','Tempat dan tanggal lahir anggota','-','2018-07-11 16:29:25',NULL),
(348,'status','String','20','Status tentang pernikahan anggota','-','2018-07-11 16:29:25',NULL),
(349,'teknis pelaksanaan','String','255','Teknis pelaksaan kegiatan yang diajukan','-','2018-07-12 21:14:53','2018-07-11 15:25:13'),
(350,'diterima oleh','String','100','Pihak yang menerima proposal','-','2018-07-12 21:14:53',NULL),
(363,'qwd','Integer','11','qwd','qwd','2018-07-15 15:20:44','2018-07-15 15:42:56'),
(364,'ad','Integer','11','-','-','2018-07-15 15:42:56',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=latin1;

/*Data for the table `datadictionary_attribute` */

insert  into `datadictionary_attribute`(`idDataDictionaryAttribute`,`dataDictionaryId`,`attributeId`,`createdAt`,`updatedAt`) values 
(122,18,192,'2018-07-10 14:26:32',NULL),
(123,18,193,'2018-07-10 14:26:32',NULL),
(124,18,194,'2018-07-10 14:26:33',NULL),
(125,18,195,'2018-07-10 14:26:33',NULL),
(126,18,196,'2018-07-10 14:26:33',NULL),
(127,18,244,'2018-07-10 14:26:33',NULL),
(128,19,197,'2018-07-10 14:32:12',NULL),
(129,19,198,'2018-07-10 14:32:12',NULL),
(130,19,203,'2018-07-10 14:32:12',NULL),
(131,19,199,'2018-07-10 14:32:12',NULL),
(132,19,200,'2018-07-10 14:32:12',NULL),
(133,19,201,'2018-07-10 14:32:12',NULL),
(134,19,202,'2018-07-10 14:32:12',NULL),
(135,19,244,'2018-07-10 14:32:13',NULL),
(136,20,204,'2018-07-10 14:45:33',NULL),
(137,20,246,'2018-07-10 14:45:33',NULL),
(138,20,205,'2018-07-10 14:45:33',NULL),
(139,20,247,'2018-07-10 14:45:33',NULL),
(140,20,244,'2018-07-10 14:45:33',NULL),
(141,21,213,'2018-07-10 14:52:34',NULL),
(142,21,214,'2018-07-10 14:52:34',NULL),
(143,21,244,'2018-07-10 14:52:34',NULL),
(144,22,206,'2018-07-10 14:55:33',NULL),
(145,22,207,'2018-07-10 14:55:33',NULL),
(146,22,208,'2018-07-10 14:55:33',NULL),
(147,22,209,'2018-07-10 14:55:34',NULL),
(148,22,210,'2018-07-10 14:55:34',NULL),
(149,22,211,'2018-07-10 14:55:34',NULL),
(150,22,212,'2018-07-10 14:55:34',NULL),
(151,22,244,'2018-07-10 14:55:34',NULL),
(152,23,206,'2018-07-10 14:56:55',NULL),
(153,23,207,'2018-07-10 14:56:55',NULL),
(154,23,208,'2018-07-10 14:56:55',NULL),
(155,23,209,'2018-07-10 14:56:55',NULL),
(156,23,210,'2018-07-10 14:56:55',NULL),
(157,23,211,'2018-07-10 14:56:55',NULL),
(158,23,212,'2018-07-10 14:56:55',NULL),
(159,23,244,'2018-07-10 14:56:55',NULL),
(160,24,192,'2018-07-10 15:12:24',NULL),
(161,24,215,'2018-07-10 15:12:24',NULL),
(162,24,216,'2018-07-10 15:12:24',NULL),
(163,24,217,'2018-07-10 15:12:24',NULL),
(164,24,218,'2018-07-10 15:12:24',NULL),
(165,24,219,'2018-07-10 15:12:24',NULL),
(166,24,220,'2018-07-10 15:12:24',NULL),
(167,24,221,'2018-07-10 15:12:24',NULL),
(168,24,222,'2018-07-10 15:12:24',NULL),
(169,24,223,'2018-07-10 15:12:24',NULL),
(170,24,224,'2018-07-10 15:12:25',NULL),
(171,24,225,'2018-07-10 15:12:25',NULL),
(172,24,226,'2018-07-10 15:12:25',NULL),
(173,24,227,'2018-07-10 15:12:25',NULL),
(174,24,196,'2018-07-10 15:12:25',NULL),
(175,24,244,'2018-07-10 15:12:25',NULL),
(176,25,228,'2018-07-10 15:13:43',NULL),
(177,25,229,'2018-07-10 15:13:43',NULL),
(178,25,230,'2018-07-10 15:13:43',NULL),
(179,25,231,'2018-07-10 15:13:43',NULL),
(180,25,232,'2018-07-10 15:13:43',NULL),
(181,25,233,'2018-07-10 15:13:43',NULL),
(182,25,234,'2018-07-10 15:13:43',NULL),
(183,25,244,'2018-07-10 15:13:43',NULL),
(184,26,192,'2018-07-10 15:16:28',NULL),
(185,26,215,'2018-07-10 15:16:28',NULL),
(186,26,216,'2018-07-10 15:16:28',NULL),
(187,26,217,'2018-07-10 15:16:28',NULL),
(188,26,218,'2018-07-10 15:16:28',NULL),
(189,26,219,'2018-07-10 15:16:28',NULL),
(190,26,220,'2018-07-10 15:16:28',NULL),
(191,26,221,'2018-07-10 15:16:28',NULL),
(192,26,222,'2018-07-10 15:16:28',NULL),
(193,26,223,'2018-07-10 15:16:28',NULL),
(194,26,224,'2018-07-10 15:16:29',NULL),
(195,26,225,'2018-07-10 15:16:29',NULL),
(196,26,226,'2018-07-10 15:16:29',NULL),
(197,26,227,'2018-07-10 15:16:29',NULL),
(198,26,196,'2018-07-10 15:16:29',NULL),
(199,26,244,'2018-07-10 15:16:29',NULL),
(207,28,228,'2018-07-10 15:23:41',NULL),
(208,28,229,'2018-07-10 15:23:41',NULL),
(209,28,230,'2018-07-10 15:23:41',NULL),
(210,28,231,'2018-07-10 15:23:42',NULL),
(211,28,232,'2018-07-10 15:23:42',NULL),
(212,28,233,'2018-07-10 15:23:42',NULL),
(213,28,234,'2018-07-10 15:23:42',NULL),
(214,28,244,'2018-07-10 15:23:42',NULL),
(215,29,204,'2018-07-10 15:31:39',NULL),
(216,29,246,'2018-07-10 15:31:39',NULL),
(217,29,235,'2018-07-10 15:31:39',NULL),
(218,29,236,'2018-07-10 15:31:39',NULL),
(219,29,237,'2018-07-10 15:31:39',NULL),
(220,29,247,'2018-07-10 15:31:39',NULL),
(221,29,244,'2018-07-10 15:31:39',NULL),
(222,30,204,'2018-07-10 15:46:44',NULL),
(223,30,246,'2018-07-10 15:46:44',NULL),
(224,30,235,'2018-07-10 15:46:44',NULL),
(225,30,236,'2018-07-10 15:46:44',NULL),
(226,30,237,'2018-07-10 15:46:44',NULL),
(227,30,247,'2018-07-10 15:46:44',NULL),
(228,30,244,'2018-07-10 15:46:44',NULL),
(229,31,192,'2018-07-10 15:49:17',NULL),
(230,31,215,'2018-07-10 15:49:17',NULL),
(231,31,216,'2018-07-10 15:49:17',NULL),
(232,31,217,'2018-07-10 15:49:17',NULL),
(233,31,218,'2018-07-10 15:49:17',NULL),
(234,31,219,'2018-07-10 15:49:17',NULL),
(235,31,220,'2018-07-10 15:49:17',NULL),
(236,31,221,'2018-07-10 15:49:17',NULL),
(237,31,222,'2018-07-10 15:49:17',NULL),
(238,31,223,'2018-07-10 15:49:17',NULL),
(239,31,224,'2018-07-10 15:49:17',NULL),
(240,31,225,'2018-07-10 15:49:17',NULL),
(241,31,226,'2018-07-10 15:49:18',NULL),
(242,31,227,'2018-07-10 15:49:18',NULL),
(243,31,196,'2018-07-10 15:49:18',NULL),
(244,31,244,'2018-07-10 15:49:18',NULL),
(245,32,192,'2018-07-10 15:51:06',NULL),
(246,32,229,'2018-07-10 15:51:06',NULL),
(247,32,230,'2018-07-10 15:51:06',NULL),
(248,32,231,'2018-07-10 15:51:06',NULL),
(249,32,193,'2018-07-10 15:51:06',NULL),
(250,32,238,'2018-07-10 15:51:07',NULL),
(251,32,234,'2018-07-10 15:51:07',NULL),
(252,32,196,'2018-07-10 15:51:07',NULL),
(253,32,244,'2018-07-10 15:51:07',NULL),
(254,33,206,'2018-07-10 16:46:41',NULL),
(255,33,207,'2018-07-10 16:46:41',NULL),
(256,33,208,'2018-07-10 16:46:41',NULL),
(257,33,209,'2018-07-10 16:46:41',NULL),
(258,33,210,'2018-07-10 16:46:41',NULL),
(259,33,211,'2018-07-10 16:46:41',NULL),
(260,33,212,'2018-07-10 16:46:41',NULL),
(261,33,244,'2018-07-10 16:46:41',NULL),
(262,34,206,'2018-07-10 16:47:17',NULL),
(263,34,207,'2018-07-10 16:47:17',NULL),
(264,34,208,'2018-07-10 16:47:17',NULL),
(265,34,209,'2018-07-10 16:47:17',NULL),
(266,34,210,'2018-07-10 16:47:17',NULL),
(267,34,211,'2018-07-10 16:47:17',NULL),
(268,34,212,'2018-07-10 16:47:17',NULL),
(269,34,244,'2018-07-10 16:47:17',NULL),
(270,35,228,'2018-07-10 16:49:45',NULL),
(271,35,229,'2018-07-10 16:49:45',NULL),
(272,35,230,'2018-07-10 16:49:45',NULL),
(273,35,231,'2018-07-10 16:49:45',NULL),
(274,35,232,'2018-07-10 16:49:45',NULL),
(275,35,238,'2018-07-10 16:49:46',NULL),
(276,35,233,'2018-07-10 16:49:46',NULL),
(277,35,234,'2018-07-10 16:49:46',NULL),
(278,35,244,'2018-07-10 16:49:46',NULL),
(279,36,192,'2018-07-10 16:51:25',NULL),
(280,36,193,'2018-07-10 16:51:26',NULL),
(281,36,208,'2018-07-10 16:51:26',NULL),
(282,36,209,'2018-07-10 16:51:26',NULL),
(283,36,210,'2018-07-10 16:51:26',NULL),
(284,36,211,'2018-07-10 16:51:26',NULL),
(285,36,196,'2018-07-10 16:51:26',NULL),
(286,36,244,'2018-07-10 16:51:26',NULL),
(287,37,228,'2018-07-10 20:50:21',NULL),
(288,37,229,'2018-07-10 20:50:21',NULL),
(289,37,230,'2018-07-10 20:50:21',NULL),
(290,37,231,'2018-07-10 20:50:21',NULL),
(291,37,193,'2018-07-10 20:50:21',NULL),
(292,37,232,'2018-07-10 20:50:21',NULL),
(293,37,238,'2018-07-10 20:50:21',NULL),
(294,37,234,'2018-07-10 20:50:21',NULL),
(295,37,250,'2018-07-10 20:50:21',NULL),
(296,37,196,'2018-07-10 20:50:21',NULL),
(297,37,244,'2018-07-10 20:50:21',NULL),
(298,38,251,'2018-07-10 21:10:27',NULL),
(299,38,252,'2018-07-10 21:10:27',NULL),
(300,38,253,'2018-07-10 21:10:27',NULL),
(301,38,254,'2018-07-10 21:10:27',NULL),
(302,38,255,'2018-07-10 21:10:27',NULL),
(303,38,256,'2018-07-10 21:10:27',NULL),
(304,38,257,'2018-07-10 21:10:27',NULL),
(305,38,258,'2018-07-10 21:10:27',NULL),
(306,38,244,'2018-07-10 21:10:27',NULL),
(307,38,244,'2018-07-10 21:10:28',NULL),
(308,39,251,'2018-07-10 21:22:27',NULL),
(309,39,261,'2018-07-10 21:22:27',NULL),
(310,39,253,'2018-07-10 21:22:27',NULL),
(311,39,262,'2018-07-10 21:22:27',NULL),
(312,39,263,'2018-07-10 21:22:27',NULL),
(313,39,264,'2018-07-10 21:22:27',NULL),
(314,39,256,'2018-07-10 21:22:27',NULL),
(315,39,265,'2018-07-10 21:22:27',NULL),
(316,39,266,'2018-07-10 21:22:27',NULL),
(317,39,244,'2018-07-10 21:22:27',NULL),
(318,40,192,'2018-07-10 21:30:56',NULL),
(319,40,229,'2018-07-10 21:30:56',NULL),
(320,40,230,'2018-07-10 21:30:56',NULL),
(321,40,231,'2018-07-10 21:30:56',NULL),
(322,40,193,'2018-07-10 21:30:56',NULL),
(323,40,232,'2018-07-10 21:30:56',NULL),
(324,40,238,'2018-07-10 21:30:56',NULL),
(325,40,234,'2018-07-10 21:30:56',NULL),
(326,40,196,'2018-07-10 21:30:56',NULL),
(327,40,244,'2018-07-10 21:30:56',NULL),
(328,41,192,'2018-07-10 21:31:57',NULL),
(329,41,215,'2018-07-10 21:31:57',NULL),
(330,41,216,'2018-07-10 21:31:57',NULL),
(331,41,217,'2018-07-10 21:31:57',NULL),
(332,41,218,'2018-07-10 21:31:57',NULL),
(333,41,219,'2018-07-10 21:31:57',NULL),
(334,41,220,'2018-07-10 21:31:57',NULL),
(335,41,221,'2018-07-10 21:31:57',NULL),
(336,41,222,'2018-07-10 21:31:57',NULL),
(337,41,223,'2018-07-10 21:31:57',NULL),
(338,41,224,'2018-07-10 21:31:57',NULL),
(339,41,225,'2018-07-10 21:31:57',NULL),
(340,41,226,'2018-07-10 21:31:57',NULL),
(341,41,227,'2018-07-10 21:31:57',NULL),
(342,41,196,'2018-07-10 21:31:57',NULL),
(343,41,244,'2018-07-10 21:31:57',NULL),
(344,42,251,'2018-07-10 21:33:29',NULL),
(345,42,253,'2018-07-10 21:33:29',NULL),
(346,42,262,'2018-07-10 21:33:29',NULL),
(347,42,263,'2018-07-10 21:33:29',NULL),
(348,42,264,'2018-07-10 21:33:29',NULL),
(349,42,265,'2018-07-10 21:33:29',NULL),
(350,42,266,'2018-07-10 21:33:29',NULL),
(351,42,244,'2018-07-10 21:33:29',NULL),
(352,43,213,'2018-07-10 21:34:27',NULL),
(353,43,214,'2018-07-10 21:34:27',NULL),
(354,43,244,'2018-07-10 21:34:27',NULL),
(355,44,192,'2018-07-10 21:39:24',NULL),
(356,44,229,'2018-07-10 21:39:24',NULL),
(357,44,230,'2018-07-10 21:39:24',NULL),
(358,44,231,'2018-07-10 21:39:24',NULL),
(359,44,193,'2018-07-10 21:39:24',NULL),
(360,44,232,'2018-07-10 21:39:24',NULL),
(361,44,238,'2018-07-10 21:39:24',NULL),
(362,44,234,'2018-07-10 21:39:24',NULL),
(363,44,196,'2018-07-10 21:39:24',NULL),
(364,44,244,'2018-07-10 21:39:24',NULL),
(365,45,192,'2018-07-10 21:40:24',NULL),
(366,45,215,'2018-07-10 21:40:24',NULL),
(367,45,216,'2018-07-10 21:40:25',NULL),
(368,45,217,'2018-07-10 21:40:25',NULL),
(369,45,218,'2018-07-10 21:40:25',NULL),
(370,45,219,'2018-07-10 21:40:25',NULL),
(371,45,220,'2018-07-10 21:40:25',NULL),
(372,45,221,'2018-07-10 21:40:25',NULL),
(373,45,222,'2018-07-10 21:40:25',NULL),
(374,45,223,'2018-07-10 21:40:25',NULL),
(375,45,224,'2018-07-10 21:40:25',NULL),
(376,45,225,'2018-07-10 21:40:25',NULL),
(377,45,226,'2018-07-10 21:40:25',NULL),
(378,45,227,'2018-07-10 21:40:25',NULL),
(379,45,196,'2018-07-10 21:40:25',NULL),
(380,45,244,'2018-07-10 21:40:25',NULL),
(381,46,251,'2018-07-10 21:41:29',NULL),
(382,46,253,'2018-07-10 21:41:29',NULL),
(383,46,262,'2018-07-10 21:41:29',NULL),
(384,46,263,'2018-07-10 21:41:29',NULL),
(385,46,264,'2018-07-10 21:41:29',NULL),
(386,46,265,'2018-07-10 21:41:29',NULL),
(387,46,266,'2018-07-10 21:41:29',NULL),
(388,46,244,'2018-07-10 21:41:29',NULL),
(389,47,213,'2018-07-10 21:42:27',NULL),
(390,47,214,'2018-07-10 21:42:27',NULL),
(391,47,244,'2018-07-10 21:42:28',NULL),
(392,48,204,'2018-07-10 21:43:34',NULL),
(393,48,246,'2018-07-10 21:43:34',NULL),
(394,48,235,'2018-07-10 21:43:34',NULL),
(395,48,236,'2018-07-10 21:43:34',NULL),
(396,48,237,'2018-07-10 21:43:34',NULL),
(397,48,247,'2018-07-10 21:43:34',NULL),
(398,48,244,'2018-07-10 21:43:34',NULL),
(399,49,192,'2018-07-11 14:15:39',NULL),
(400,49,229,'2018-07-11 14:15:40',NULL),
(401,49,230,'2018-07-11 14:15:40',NULL),
(402,49,231,'2018-07-11 14:15:40',NULL),
(403,49,193,'2018-07-11 14:15:40',NULL),
(404,49,232,'2018-07-11 14:15:40',NULL),
(405,49,238,'2018-07-11 14:15:40',NULL),
(406,49,234,'2018-07-11 14:15:40',NULL),
(407,49,196,'2018-07-11 14:15:40',NULL),
(408,49,244,'2018-07-11 14:15:40',NULL),
(409,50,192,'2018-07-11 14:16:08',NULL),
(410,50,215,'2018-07-11 14:16:08',NULL),
(411,50,216,'2018-07-11 14:16:08',NULL),
(412,50,217,'2018-07-11 14:16:08',NULL),
(413,50,218,'2018-07-11 14:16:08',NULL),
(414,50,219,'2018-07-11 14:16:08',NULL),
(415,50,220,'2018-07-11 14:16:08',NULL),
(416,50,221,'2018-07-11 14:16:08',NULL),
(417,50,222,'2018-07-11 14:16:08',NULL),
(418,50,223,'2018-07-11 14:16:08',NULL),
(419,50,224,'2018-07-11 14:16:08',NULL),
(420,50,225,'2018-07-11 14:16:08',NULL),
(421,50,226,'2018-07-11 14:16:09',NULL),
(422,50,227,'2018-07-11 14:16:09',NULL),
(423,50,196,'2018-07-11 14:16:09',NULL),
(424,50,244,'2018-07-11 14:16:09',NULL),
(425,51,251,'2018-07-11 14:16:44',NULL),
(426,51,253,'2018-07-11 14:16:44',NULL),
(427,51,262,'2018-07-11 14:16:44',NULL),
(428,51,263,'2018-07-11 14:16:44',NULL),
(429,51,264,'2018-07-11 14:16:44',NULL),
(430,51,265,'2018-07-11 14:16:44',NULL),
(431,51,266,'2018-07-11 14:16:44',NULL),
(432,51,244,'2018-07-11 14:16:44',NULL),
(433,52,213,'2018-07-11 14:17:18',NULL),
(434,52,214,'2018-07-11 14:17:18',NULL),
(435,52,244,'2018-07-11 14:17:18',NULL),
(436,53,213,'2018-07-11 14:18:47',NULL),
(437,53,214,'2018-07-11 14:18:47',NULL),
(438,53,244,'2018-07-11 14:18:48',NULL),
(439,54,206,'2018-07-11 14:21:01',NULL),
(440,54,207,'2018-07-11 14:21:01',NULL),
(441,54,208,'2018-07-11 14:21:01',NULL),
(442,54,209,'2018-07-11 14:21:01',NULL),
(443,54,210,'2018-07-11 14:21:01',NULL),
(444,54,211,'2018-07-11 14:21:01',NULL),
(445,54,212,'2018-07-11 14:21:01',NULL),
(446,54,244,'2018-07-11 14:21:01',NULL),
(447,55,228,'2018-07-11 14:23:06',NULL),
(448,55,229,'2018-07-11 14:23:06',NULL),
(449,55,230,'2018-07-11 14:23:06',NULL),
(450,55,231,'2018-07-11 14:23:06',NULL),
(451,55,232,'2018-07-11 14:23:06',NULL),
(452,55,238,'2018-07-11 14:23:06',NULL),
(453,55,233,'2018-07-11 14:23:06',NULL),
(454,55,234,'2018-07-11 14:23:06',NULL),
(455,55,244,'2018-07-11 14:23:07',NULL),
(456,56,192,'2018-07-11 14:24:03',NULL),
(457,56,193,'2018-07-11 14:24:03',NULL),
(458,56,208,'2018-07-11 14:24:03',NULL),
(459,56,209,'2018-07-11 14:24:03',NULL),
(460,56,210,'2018-07-11 14:24:03',NULL),
(461,56,211,'2018-07-11 14:24:03',NULL),
(462,56,196,'2018-07-11 14:24:04',NULL),
(463,56,244,'2018-07-11 14:24:04',NULL),
(464,57,206,'2018-07-11 14:24:38',NULL),
(465,57,207,'2018-07-11 14:24:38',NULL),
(466,57,208,'2018-07-11 14:24:38',NULL),
(467,57,209,'2018-07-11 14:24:38',NULL),
(468,57,210,'2018-07-11 14:24:38',NULL),
(469,57,211,'2018-07-11 14:24:38',NULL),
(470,57,212,'2018-07-11 14:24:38',NULL),
(471,57,244,'2018-07-11 14:24:38',NULL),
(472,58,192,'2018-07-11 14:25:37',NULL),
(473,58,215,'2018-07-11 14:25:37',NULL),
(474,58,216,'2018-07-11 14:25:37',NULL),
(475,58,217,'2018-07-11 14:25:37',NULL),
(476,58,218,'2018-07-11 14:25:37',NULL),
(477,58,219,'2018-07-11 14:25:37',NULL),
(478,58,220,'2018-07-11 14:25:37',NULL),
(479,58,221,'2018-07-11 14:25:38',NULL),
(480,58,222,'2018-07-11 14:25:38',NULL),
(481,58,223,'2018-07-11 14:25:38',NULL),
(482,58,224,'2018-07-11 14:25:38',NULL),
(483,58,225,'2018-07-11 14:25:38',NULL),
(484,58,226,'2018-07-11 14:25:38',NULL),
(485,58,227,'2018-07-11 14:25:38',NULL),
(486,58,196,'2018-07-11 14:25:38',NULL),
(487,58,244,'2018-07-11 14:25:38',NULL),
(488,59,192,'2018-07-11 14:32:24',NULL),
(489,59,268,'2018-07-11 14:32:24',NULL),
(490,59,269,'2018-07-11 14:32:24',NULL),
(491,59,270,'2018-07-11 14:32:24',NULL),
(492,59,271,'2018-07-11 14:32:24',NULL),
(493,59,244,'2018-07-11 14:32:25',NULL),
(494,60,272,'2018-07-11 14:41:57',NULL),
(495,60,273,'2018-07-11 14:41:57',NULL),
(496,60,274,'2018-07-11 14:41:57',NULL),
(497,60,275,'2018-07-11 14:41:57',NULL),
(498,60,276,'2018-07-11 14:41:57',NULL),
(499,60,277,'2018-07-11 14:41:57',NULL),
(500,60,278,'2018-07-11 14:41:57',NULL),
(501,60,279,'2018-07-11 14:41:57',NULL),
(502,60,280,'2018-07-11 14:41:57',NULL),
(503,60,281,'2018-07-11 14:41:58',NULL),
(504,60,244,'2018-07-11 14:41:58',NULL),
(505,61,192,'2018-07-11 14:47:41',NULL),
(506,61,283,'2018-07-11 14:47:41',NULL),
(507,61,284,'2018-07-11 14:47:41',NULL),
(508,61,285,'2018-07-11 14:47:41',NULL),
(509,61,286,'2018-07-11 14:47:41',NULL),
(510,61,287,'2018-07-11 14:47:41',NULL),
(511,61,244,'2018-07-11 14:47:41',NULL),
(512,62,192,'2018-07-11 14:50:42',NULL),
(513,62,289,'2018-07-11 14:50:43',NULL),
(514,62,290,'2018-07-11 14:50:43',NULL),
(515,62,291,'2018-07-11 14:50:43',NULL),
(516,62,292,'2018-07-11 14:50:43',NULL),
(517,62,293,'2018-07-11 14:50:43',NULL),
(518,62,244,'2018-07-11 14:50:43',NULL),
(519,63,294,'2018-07-11 14:54:08',NULL),
(520,63,295,'2018-07-11 14:54:08',NULL),
(521,63,296,'2018-07-11 14:54:08',NULL),
(522,63,297,'2018-07-11 14:54:08',NULL),
(523,63,298,'2018-07-11 14:54:08',NULL),
(524,63,244,'2018-07-11 14:54:08',NULL),
(525,64,192,'2018-07-11 14:54:29',NULL),
(526,64,215,'2018-07-11 14:54:29',NULL),
(527,64,216,'2018-07-11 14:54:29',NULL),
(528,64,217,'2018-07-11 14:54:29',NULL),
(529,64,218,'2018-07-11 14:54:29',NULL),
(530,64,219,'2018-07-11 14:54:29',NULL),
(531,64,220,'2018-07-11 14:54:29',NULL),
(532,64,221,'2018-07-11 14:54:29',NULL),
(533,64,222,'2018-07-11 14:54:29',NULL),
(534,64,223,'2018-07-11 14:54:29',NULL),
(535,64,224,'2018-07-11 14:54:29',NULL),
(536,64,225,'2018-07-11 14:54:29',NULL),
(537,64,226,'2018-07-11 14:54:29',NULL),
(538,64,227,'2018-07-11 14:54:29',NULL),
(539,64,196,'2018-07-11 14:54:29',NULL),
(540,64,244,'2018-07-11 14:54:29',NULL),
(541,65,192,'2018-07-11 15:07:32',NULL),
(542,65,299,'2018-07-11 15:07:32',NULL),
(543,65,300,'2018-07-11 15:07:32',NULL),
(544,65,301,'2018-07-11 15:07:32',NULL),
(545,65,302,'2018-07-11 15:07:32',NULL),
(546,65,244,'2018-07-11 15:07:32',NULL),
(547,66,192,'2018-07-11 15:11:09',NULL),
(548,66,215,'2018-07-11 15:11:09',NULL),
(549,66,216,'2018-07-11 15:11:09',NULL),
(550,66,217,'2018-07-11 15:11:09',NULL),
(551,66,303,'2018-07-11 15:11:09',NULL),
(552,66,196,'2018-07-11 15:11:09',NULL),
(553,66,244,'2018-07-11 15:11:09',NULL),
(554,67,192,'2018-07-11 15:11:33',NULL),
(555,67,215,'2018-07-11 15:11:33',NULL),
(556,67,216,'2018-07-11 15:11:33',NULL),
(557,67,217,'2018-07-11 15:11:33',NULL),
(558,67,218,'2018-07-11 15:11:33',NULL),
(559,67,219,'2018-07-11 15:11:33',NULL),
(560,67,220,'2018-07-11 15:11:33',NULL),
(561,67,221,'2018-07-11 15:11:33',NULL),
(562,67,222,'2018-07-11 15:11:33',NULL),
(563,67,223,'2018-07-11 15:11:33',NULL),
(564,67,224,'2018-07-11 15:11:33',NULL),
(565,67,225,'2018-07-11 15:11:34',NULL),
(566,67,226,'2018-07-11 15:11:34',NULL),
(567,67,227,'2018-07-11 15:11:34',NULL),
(568,67,196,'2018-07-11 15:11:34',NULL),
(569,67,244,'2018-07-11 15:11:34',NULL),
(570,68,192,'2018-07-11 15:12:06',NULL),
(571,68,215,'2018-07-11 15:12:06',NULL),
(572,68,216,'2018-07-11 15:12:06',NULL),
(573,68,217,'2018-07-11 15:12:06',NULL),
(574,68,218,'2018-07-11 15:12:06',NULL),
(575,68,219,'2018-07-11 15:12:06',NULL),
(576,68,220,'2018-07-11 15:12:06',NULL),
(577,68,221,'2018-07-11 15:12:06',NULL),
(578,68,222,'2018-07-11 15:12:06',NULL),
(579,68,223,'2018-07-11 15:12:06',NULL),
(580,68,224,'2018-07-11 15:12:06',NULL),
(581,68,225,'2018-07-11 15:12:06',NULL),
(582,68,226,'2018-07-11 15:12:06',NULL),
(583,68,227,'2018-07-11 15:12:06',NULL),
(584,68,196,'2018-07-11 15:12:06',NULL),
(585,68,244,'2018-07-11 15:12:06',NULL),
(586,69,206,'2018-07-11 15:17:12',NULL),
(587,69,304,'2018-07-11 15:17:12',NULL),
(588,69,305,'2018-07-11 15:17:12',NULL),
(589,69,306,'2018-07-11 15:17:12',NULL),
(590,69,307,'2018-07-11 15:17:12',NULL),
(591,69,308,'2018-07-11 15:17:13',NULL),
(592,69,212,'2018-07-11 15:17:13',NULL),
(593,69,244,'2018-07-11 15:17:13',NULL),
(594,70,310,'2018-07-11 15:19:49',NULL),
(595,70,311,'2018-07-11 15:19:49',NULL),
(596,70,312,'2018-07-11 15:19:49',NULL),
(597,71,206,'2018-07-11 15:23:23',NULL),
(598,71,207,'2018-07-11 15:23:24',NULL),
(599,71,208,'2018-07-11 15:23:24',NULL),
(600,71,209,'2018-07-11 15:23:24',NULL),
(601,71,210,'2018-07-11 15:23:24',NULL),
(602,71,211,'2018-07-11 15:23:24',NULL),
(603,71,212,'2018-07-11 15:23:24',NULL),
(604,71,244,'2018-07-11 15:23:24',NULL),
(605,72,206,'2018-07-11 15:25:47',NULL),
(606,72,207,'2018-07-11 15:25:47',NULL),
(607,72,208,'2018-07-11 15:25:47',NULL),
(608,72,209,'2018-07-11 15:25:47',NULL),
(609,72,210,'2018-07-11 15:25:48',NULL),
(610,72,211,'2018-07-11 15:25:48',NULL),
(611,72,212,'2018-07-11 15:25:48',NULL),
(612,72,244,'2018-07-11 15:25:48',NULL),
(613,73,228,'2018-07-11 15:26:26',NULL),
(614,73,229,'2018-07-11 15:26:26',NULL),
(615,73,230,'2018-07-11 15:26:26',NULL),
(616,73,231,'2018-07-11 15:26:26',NULL),
(617,73,232,'2018-07-11 15:26:26',NULL),
(618,73,238,'2018-07-11 15:26:26',NULL),
(619,73,233,'2018-07-11 15:26:26',NULL),
(620,73,234,'2018-07-11 15:26:26',NULL),
(621,73,244,'2018-07-11 15:26:26',NULL),
(622,74,206,'2018-07-11 15:26:54',NULL),
(623,74,207,'2018-07-11 15:26:54',NULL),
(624,74,208,'2018-07-11 15:26:54',NULL),
(625,74,209,'2018-07-11 15:26:54',NULL),
(626,74,210,'2018-07-11 15:26:54',NULL),
(627,74,211,'2018-07-11 15:26:54',NULL),
(628,74,212,'2018-07-11 15:26:54',NULL),
(629,74,244,'2018-07-11 15:26:54',NULL),
(630,75,192,'2018-07-11 15:27:28',NULL),
(631,75,193,'2018-07-11 15:27:28',NULL),
(632,75,208,'2018-07-11 15:27:28',NULL),
(633,75,209,'2018-07-11 15:27:28',NULL),
(634,75,210,'2018-07-11 15:27:28',NULL),
(635,75,211,'2018-07-11 15:27:28',NULL),
(636,75,196,'2018-07-11 15:27:28',NULL),
(637,75,244,'2018-07-11 15:27:28',NULL),
(638,76,206,'2018-07-11 15:48:38',NULL),
(639,76,207,'2018-07-11 15:48:38',NULL),
(640,76,208,'2018-07-11 15:48:38',NULL),
(641,76,209,'2018-07-11 15:48:38',NULL),
(642,76,210,'2018-07-11 15:48:38',NULL),
(643,76,211,'2018-07-11 15:48:39',NULL),
(644,76,212,'2018-07-11 15:48:39',NULL),
(645,76,244,'2018-07-11 15:48:39',NULL),
(646,77,213,'2018-07-11 15:49:15',NULL),
(647,77,214,'2018-07-11 15:49:15',NULL),
(648,77,244,'2018-07-11 15:49:15',NULL),
(649,78,192,'2018-07-11 15:52:27',NULL),
(650,78,313,'2018-07-11 15:52:27',NULL),
(651,78,314,'2018-07-11 15:52:27',NULL),
(652,78,315,'2018-07-11 15:52:27',NULL),
(653,78,316,'2018-07-11 15:52:27',NULL),
(654,78,317,'2018-07-11 15:52:27',NULL),
(655,79,318,'2018-07-11 15:56:28',NULL),
(656,79,216,'2018-07-11 15:56:28',NULL),
(657,79,319,'2018-07-11 15:56:28',NULL),
(658,79,320,'2018-07-11 15:56:28',NULL),
(659,79,321,'2018-07-11 15:56:29',NULL),
(660,79,322,'2018-07-11 15:56:29',NULL),
(661,79,323,'2018-07-11 15:56:29',NULL),
(662,80,318,'2018-07-11 15:57:37',NULL),
(663,80,216,'2018-07-11 15:57:37',NULL),
(664,80,319,'2018-07-11 15:57:38',NULL),
(665,80,320,'2018-07-11 15:57:38',NULL),
(666,80,321,'2018-07-11 15:57:38',NULL),
(667,80,322,'2018-07-11 15:57:38',NULL),
(668,80,323,'2018-07-11 15:57:38',NULL),
(669,81,324,'2018-07-11 16:00:54',NULL),
(670,81,241,'2018-07-11 16:00:54',NULL),
(671,81,325,'2018-07-11 16:00:54',NULL),
(672,81,326,'2018-07-11 16:00:54',NULL),
(673,81,327,'2018-07-11 16:00:54',NULL),
(674,82,310,'2018-07-11 16:07:21',NULL),
(675,82,241,'2018-07-11 16:07:22',NULL),
(676,82,311,'2018-07-11 16:07:22',NULL),
(677,82,328,'2018-07-11 16:07:22',NULL),
(678,82,329,'2018-07-11 16:07:22',NULL),
(679,83,318,'2018-07-11 16:08:08',NULL),
(680,83,216,'2018-07-11 16:08:08',NULL),
(681,83,319,'2018-07-11 16:08:08',NULL),
(682,83,320,'2018-07-11 16:08:08',NULL),
(683,83,321,'2018-07-11 16:08:08',NULL),
(684,83,322,'2018-07-11 16:08:08',NULL),
(685,83,323,'2018-07-11 16:08:08',NULL),
(686,84,318,'2018-07-11 16:09:05',NULL),
(687,84,216,'2018-07-11 16:09:05',NULL),
(688,84,319,'2018-07-11 16:09:05',NULL),
(689,84,320,'2018-07-11 16:09:05',NULL),
(690,84,321,'2018-07-11 16:09:06',NULL),
(691,84,322,'2018-07-11 16:09:06',NULL),
(692,84,323,'2018-07-11 16:09:06',NULL),
(693,85,330,'2018-07-11 16:12:16',NULL),
(694,85,331,'2018-07-11 16:12:16',NULL),
(695,85,332,'2018-07-11 16:12:16',NULL),
(696,85,333,'2018-07-11 16:12:16',NULL),
(697,85,241,'2018-07-11 16:12:16',NULL),
(698,86,251,'2018-07-11 16:17:51',NULL),
(699,86,253,'2018-07-11 16:17:51',NULL),
(700,86,334,'2018-07-11 16:17:51',NULL),
(701,86,335,'2018-07-11 16:17:51',NULL),
(702,86,264,'2018-07-11 16:17:51',NULL),
(703,86,336,'2018-07-11 16:17:51',NULL),
(704,86,337,'2018-07-11 16:17:51',NULL),
(705,86,338,'2018-07-11 16:17:52',NULL),
(706,86,256,'2018-07-11 16:17:52',NULL),
(707,86,266,'2018-07-11 16:17:52',NULL),
(708,86,244,'2018-07-11 16:17:52',NULL),
(709,87,252,'2018-07-11 16:20:48',NULL),
(710,87,335,'2018-07-11 16:20:48',NULL),
(711,87,264,'2018-07-11 16:20:48',NULL),
(712,87,336,'2018-07-11 16:20:48',NULL),
(713,87,337,'2018-07-11 16:20:48',NULL),
(714,87,338,'2018-07-11 16:20:48',NULL),
(715,87,328,'2018-07-11 16:20:48',NULL),
(716,87,340,'2018-07-11 16:20:48',NULL),
(717,87,341,'2018-07-11 16:20:49',NULL),
(718,87,342,'2018-07-11 16:20:49',NULL),
(719,87,256,'2018-07-11 16:20:49',NULL),
(720,87,266,'2018-07-11 16:20:49',NULL),
(721,87,244,'2018-07-11 16:20:49',NULL),
(722,88,251,'2018-07-11 16:22:39',NULL),
(723,88,253,'2018-07-11 16:22:39',NULL),
(724,88,335,'2018-07-11 16:22:39',NULL),
(725,88,264,'2018-07-11 16:22:39',NULL),
(726,88,336,'2018-07-11 16:22:39',NULL),
(727,88,337,'2018-07-11 16:22:39',NULL),
(728,88,338,'2018-07-11 16:22:39',NULL),
(729,88,256,'2018-07-11 16:22:39',NULL),
(730,88,344,'2018-07-11 16:22:39',NULL),
(731,88,345,'2018-07-11 16:22:39',NULL),
(732,88,266,'2018-07-11 16:22:39',NULL),
(733,88,244,'2018-07-11 16:22:39',NULL),
(734,89,318,'2018-07-11 16:23:33',NULL),
(735,89,216,'2018-07-11 16:23:33',NULL),
(736,89,319,'2018-07-11 16:23:33',NULL),
(737,89,320,'2018-07-11 16:23:33',NULL),
(738,89,321,'2018-07-11 16:23:33',NULL),
(739,89,322,'2018-07-11 16:23:33',NULL),
(740,89,323,'2018-07-11 16:23:33',NULL),
(741,90,310,'2018-07-11 16:24:25',NULL),
(742,90,311,'2018-07-11 16:24:25',NULL),
(743,90,312,'2018-07-11 16:24:25',NULL),
(744,91,318,'2018-07-11 16:25:07',NULL),
(745,91,216,'2018-07-11 16:25:07',NULL),
(746,91,319,'2018-07-11 16:25:07',NULL),
(747,91,320,'2018-07-11 16:25:07',NULL),
(748,91,321,'2018-07-11 16:25:07',NULL),
(749,91,322,'2018-07-11 16:25:07',NULL),
(750,91,323,'2018-07-11 16:25:07',NULL),
(751,92,318,'2018-07-11 16:25:24',NULL),
(752,92,216,'2018-07-11 16:25:24',NULL),
(753,92,319,'2018-07-11 16:25:24',NULL),
(754,92,320,'2018-07-11 16:25:24',NULL),
(755,92,321,'2018-07-11 16:25:24',NULL),
(756,92,322,'2018-07-11 16:25:24',NULL),
(757,92,323,'2018-07-11 16:25:24',NULL),
(758,93,330,'2018-07-11 16:29:25',NULL),
(759,93,347,'2018-07-11 16:29:25',NULL),
(760,93,241,'2018-07-11 16:29:25',NULL),
(761,93,348,'2018-07-11 16:29:25',NULL),
(762,93,327,'2018-07-11 16:29:25',NULL),
(763,94,192,'2018-07-11 16:30:00',NULL),
(764,94,215,'2018-07-11 16:30:00',NULL),
(765,94,216,'2018-07-11 16:30:00',NULL),
(766,94,217,'2018-07-11 16:30:00',NULL),
(767,94,218,'2018-07-11 16:30:00',NULL),
(768,94,219,'2018-07-11 16:30:00',NULL),
(769,94,220,'2018-07-11 16:30:00',NULL),
(770,94,221,'2018-07-11 16:30:00',NULL),
(771,94,222,'2018-07-11 16:30:00',NULL),
(772,94,223,'2018-07-11 16:30:00',NULL),
(773,94,224,'2018-07-11 16:30:00',NULL),
(774,94,225,'2018-07-11 16:30:00',NULL),
(775,94,226,'2018-07-11 16:30:00',NULL),
(776,94,227,'2018-07-11 16:30:00',NULL),
(777,94,196,'2018-07-11 16:30:00',NULL),
(778,94,244,'2018-07-11 16:30:00',NULL),
(779,95,192,'2018-07-11 16:50:59',NULL),
(780,95,229,'2018-07-11 16:50:59',NULL),
(781,95,230,'2018-07-11 16:50:59',NULL),
(782,95,231,'2018-07-11 16:50:59',NULL),
(783,95,193,'2018-07-11 16:50:59',NULL),
(784,95,232,'2018-07-11 16:50:59',NULL),
(785,95,238,'2018-07-11 16:50:59',NULL),
(786,95,234,'2018-07-11 16:50:59',NULL),
(787,95,196,'2018-07-11 16:51:00',NULL),
(788,95,244,'2018-07-11 16:51:00',NULL),
(789,96,192,'2018-07-11 16:51:21',NULL),
(790,96,215,'2018-07-11 16:51:21',NULL),
(791,96,216,'2018-07-11 16:51:21',NULL),
(792,96,217,'2018-07-11 16:51:21',NULL),
(793,96,218,'2018-07-11 16:51:21',NULL),
(794,96,219,'2018-07-11 16:51:21',NULL),
(795,96,220,'2018-07-11 16:51:22',NULL),
(796,96,221,'2018-07-11 16:51:22',NULL),
(797,96,222,'2018-07-11 16:51:22',NULL),
(798,96,223,'2018-07-11 16:51:22',NULL),
(799,96,224,'2018-07-11 16:51:22',NULL),
(800,96,225,'2018-07-11 16:51:22',NULL),
(801,96,226,'2018-07-11 16:51:22',NULL),
(802,96,227,'2018-07-11 16:51:22',NULL),
(803,96,196,'2018-07-11 16:51:22',NULL),
(804,96,244,'2018-07-11 16:51:22',NULL),
(805,71,206,'2018-07-15 15:02:42',NULL),
(806,71,207,'2018-07-15 15:02:42',NULL),
(807,71,208,'2018-07-15 15:02:42',NULL),
(808,71,209,'2018-07-15 15:02:42',NULL),
(809,71,210,'2018-07-15 15:02:42',NULL),
(810,71,211,'2018-07-15 15:02:42',NULL),
(811,71,212,'2018-07-15 15:02:42',NULL),
(812,71,244,'2018-07-15 15:02:42',NULL),
(813,72,206,'2018-07-15 15:08:42',NULL),
(814,72,207,'2018-07-15 15:08:42',NULL),
(815,72,208,'2018-07-15 15:08:42',NULL),
(816,72,209,'2018-07-15 15:08:42',NULL),
(817,72,210,'2018-07-15 15:08:42',NULL),
(818,72,211,'2018-07-15 15:08:42',NULL),
(819,72,212,'2018-07-15 15:08:42',NULL),
(820,72,244,'2018-07-15 15:08:42',NULL),
(821,73,363,'2018-07-15 15:20:45',NULL),
(822,73,364,'2018-07-15 15:42:56',NULL);

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
  `relation` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idDataDictionary`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

/*Data for the table `datadictonary` */

insert  into `datadictonary`(`idDataDictionary`,`dataDictionaryCode`,`documentName`,`dataForm`,`processCode`,`processName`,`activity`,`actor`,`relation`,`description`,`createdAt`,`updatedAt`) values 
(18,'DD-DDiak-05-01-001','Laporan Pembentukan CUM disertai kepengurusan CUM','Laporan tercetak','BP-DDiak-05-01','Proses Pembentukan CUM (Credo Union Modifikasi)','Membuat Laporan Pembentukan CUM disertai kepengurusan CUM',' Anggota Badan Koordinasi Ekonomi Kerakyatan','DD-DDiak-05-01-002','Laporan ini memuat detail tentang pembentukan CUM lengkap dengan struktur kepengurusan pada organisasi CUM tersebut.','2018-07-10 14:26:32',NULL),
(19,'DD-DDiak-05-01-002','Laporan Diskusi  Pembentukan CUM','Laporan tercetak','BP-DDiak-05-01','Proses Pembentukan CUM (Credo Union Modifikasi)','Membuat laporan hasil  diskusi','Jemaat HKBP','DD-DDiak-05-01-001','Laporan ini berisi detail tentang hasil diskusi pembentukan CUM.','2018-07-10 14:32:12',NULL),
(20,'DD-DDiak-05-02-001','Daftar Nama Pengurus CUM','Dokumen tercetak','BP-DDiak-05-02','Proses Penyelenggaraan Pelatihan Pengurus CUM','Membuat daftar pengurus CUM','Anggota Badan Koordinasi Ekonomi Kerakyatan','','Dokumen ini berisi detail tentang suatu struktur pengurusan dalam sebuah CUM','2018-07-10 14:45:33',NULL),
(21,'DD-DDiak-04-01-002','memo pencairan dana','Dokumen tercetak','BP-DDiak-04-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat memo pencairan dana','Anggota Sekretariat Jenderal','DD-DDiak-04-01-004','Proposal ini berisi tentang detail usulkan program kerja dari biro/departemen.','2018-07-10 14:52:34',NULL),
(22,'DD-DDiak-04-01-004','Proposal Program Kerja','Dokumen tercetak','BP-DDiak-04-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Proposal  Program Kerja','Anggota Biro Pengembangan Masyarakat','DD-DDiak-04-01-002','Proposal ini berisi tentang detail usulkan program kerja dari biro/departemen,','2018-07-10 14:55:33',NULL),
(23,'DD-DDiak-04-01-005','Proposal Program Kerja Hasil Kompilasi','Dokumen tercetak','BP-DDiak-04-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Proposal Program Kerja Hasil Kompilasi','Anggota Sekretariat Jenderal','DD-DDiak-04-01-004','Proposal ini merupakan perbaikan dari semua proposal program kerja yang diusulkan.','2018-07-10 14:56:55',NULL),
(24,'DD-DDiak-04-02-001','Laporan Pertanggungjawaban','Laporan tercetak','BP-DDiak-04-02','Proses Pengorganisasian','Membuat laporan pertanggungjawaban','Anggota Biro Pengembangan Masyarakat','DD-DDiak-04-02-002','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-10 15:12:24',NULL),
(25,'DD-DDiak-04-02-002','Laporan Rapat Pembahasan Isu','Laporan tercetak','BP-DDiak-04-02','Proses Pengorganisasian','Membuat laporan  rapat','Jemaat HKBP','DD-DDiak-04-02-001','Laporan ini berisi tentang hasil kegiatan rapat yang diselengarakan jemaat untuk membahas isu tertentu.','2018-07-10 15:13:43',NULL),
(26,'DD-DDiak-04-03-001','Laporan Pertanggungjawaban','Laporan tercetak','BP-DDiak-04-03','Proses Pengembangan Ekonomi Rakyat','Membuat laporan  pertanggungjawaban','Anggota Biro Pengembangan Masyarakat','DD-DDiak-04-03-002','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-10 15:16:28',NULL),
(28,'DD-DDiak-04-03-002','Laporan Rapat Pembahasan Isu','Laporan tercetak','BP-DDiak-04-03','Proses Pengembangan Ekonomi Rakyat','Membuat laporan rapat pembahasan isu','Komunitas Masyarakat','DD-DDiak-04-03-001','Laporan ini berisi tentang hasil kegiatan rapat yang diselengarakan konumitas masyarakat untuk membahas isu tertentu.','2018-07-10 15:23:41',NULL),
(29,'DD-DDiak-04-03-003','Daftar Peserta pelatihan','Laporan tercetak','BP-DDiak-04-03','Proses Pengembangan Ekonomi Rakyat','Membuat daftar nama masyarakat yang mengikuti pelatihan','Komunitas Masyarakat','DD-DDiak-04-03-001','Laporan ini berisi tentang daftar masyrakat yang dikut serta dalam pelatihan yang diselenggarakan.','2018-07-10 15:31:39',NULL),
(30,'DD-DDiak-04-04-001','Daftar Jemaat Peserta','Dokumen tercetak','BP-DDiak-04-04','Proses Pengembangan Kapasitas','Membuat daftar jemaat yang ikut serta dalam pelatihan','Pendeta Distrik','DD-DDiak-04-04-003','Dokumen ini berisi daftar dan identitas singkat jemaat yang ikut serta dalam kegiatan.','2018-07-10 15:46:44',NULL),
(31,'DD-DDiak-04-04-002','Laporan Pertanggungjawaban','Laporan tercetak','BP-DDiak-04-04','Proses Pengembangan Kapasitas','Membuat laporan pertanggungjawaban','Anggota Biro Pengembangan Masyarakat','DD-DDiak-04-04-003','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-10 15:49:17',NULL),
(32,'DD-DDiak-04-04-003','Laporan Konsep Kegiatan','Laporan tercetak','BP-DDiak-04-04','Proses Pengembangan Kapasitas','Membuat Laporan Konsep Kegiatan','Anggota Biro Pengembangan Masyarakat','DD-DDiak-04-04-001','Laporan ini berisi detail konsep kegiatan yang dirancang.','2018-07-10 15:51:06',NULL),
(33,'DD-DDiak-03-01-001','Proposal  Program Kerja','Dokumen tercetak','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Proposal Program Kerja','Anggota Biro Transformasi Sosial','DD-DDiak-03-01-004','Proposal ini berisi tentang detail usulkan program kerja dari biro/departemen.','2018-07-10 16:46:40',NULL),
(34,'DD-DDiak-03-01-004','Proposal Program Kerja Hasil Kompilasi','Dokumen tercetak','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat proposal program kerja hasil kompilasi','Anggota Sekretariat Jenderal','DD-DDiak-03-01-001','Proposal ini merupakan perbaikan dari semua proposal program kerja yang diusulkan.','2018-07-10 16:47:17',NULL),
(35,'DD-DDiak-03-01-002','Laporan Rapat','Laporan tercetak','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat laporan rapat','Anggota Departemen Diakonia','DD-DDiak-03-01-001','Laporan ini berisi tentang hasil kegiatan rapat yang diselengarakan jemaat untuk membahas usulan program kerja.','2018-07-10 16:49:45','2018-07-11 13:46:28'),
(36,'DD-DDiak-03-01-003','Laporan Anggaran Program Kerja','Laporan tercetak','BP-DDiak-03-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Laporan Anggaran Program Kerja','Komisi  Keuangan','DD-DDiak-03-01-002','Laporan ini berisi tentang alokasi dana yang diberikan pada setiap program kerja yang diusulkan.','2018-07-10 16:51:25','2018-07-11 13:46:37'),
(37,'DD-DDiak-03-02-001','Laporan rapat pemilihan panitia','Laporan tercetak','BP-DDiak-03-02','Proses Pembentukan Panitia Program Kerja','Membuat laporan hasil rapat pemilihan panitia','Anggota Biro Transformasi Sosial','DD-DDiak-03-02-002','Laporan ini berisi hasil keputusan rapat pemilihan panitia suatu kegiatan program kerja.','2018-07-10 20:50:20',NULL),
(38,'DD-DDiak-03-02-002','Surat Penugasan','Dokumen tercetak','BP-DDiak-03-02','Proses Pembentukan Panitia Program Kerja','Mengeluarkan Surat Penugasan','AnggotaDepartemen Diakonia','DD-DDiak-03-02-001','Surat ini berisi informasi penyerahan tugas.','2018-07-10 21:10:26','2018-07-11 13:42:02'),
(39,'DD-DDiak-03-02-003','Undangan Pelantikan Panitia','Dokumen tercetak','BP-DDiak-03-02','Proses Pembentukan Panitia Program Kerja','Membuat undangan pelantikan','Anggota Biro Transformasi Sosial','DD-DDiak-03-02-002','Surat yang berisi undangan pelantikan panitia yang telah terbentuk.','2018-07-10 21:22:26',NULL),
(40,'DD-DDiak-03-03-001','Laporan konsep kegiatan','Laporan tercetak','BP-DDiak-03-03','Proses Penyelenggaraan Pelatihan HAM','Membuat laporan  konsep kegiatan','Anggota Biro Transformasi Sosial','DD-DDiak-03-03-002','Laporan ini berisi detail konsep kegiatan yang dirancang.','2018-07-10 21:30:56',NULL),
(41,'DD-DDiak-03-03-002','Laporan pertanggungjawaban','Laporan tercetak','BP-DDiak-03-03','Proses Penyelenggaraan Pelatihan HAM','Membuat laporan pertanggungjawaban','Anggota Biro Transformasi Sosial','DD-DDiak-03-03-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-10 21:31:57',NULL),
(42,'DD-DDiak-03-03-003','Undangan  pelatihan','Dokumen tercetak','BP-DDiak-03-03','Proses Penyelenggaraan Pelatihan HAM','Membuat undangan  pelatihan HAM','Anggota Departemen Diakonia','DD-DDiak-03-03-001','Surat yang berisi undangan mengikuti pelatihan yang diselenggarakan.','2018-07-10 21:33:29',NULL),
(43,'DD-DDiak-03-03-004','Memo pencairan panjar dana','Dokumen tercetak','BP-DDiak-03-03','Proses Penyelenggaraan Pelatihan HAM','Membuat memo pencairan  panjar dana','Sekretaris Jenderal','DD-DDiak-03-03-001','Laporan ini berisi tentang alokasi dana yang diberikan pada setiap program kerja yang diusulkan.','2018-07-10 21:34:27',NULL),
(44,'DD-DDiak-03-04-001','Laporan konsep kegiatan','Laporan tercetak','BP-DDiak-03-04','Proses Penyelenggaraan Pelatihan Tenaga Pengajar','Membuat laporan konsep kegiatan','Anggota Biro Transformasi Sosial','DD-DDiak-03-04-002','Laporan ini berisi detail konsep kegiatan yang dirancang.','2018-07-10 21:39:24',NULL),
(45,'DD-DDiak-03-04-002','laporan pertanggungjawaban','Laporan tercetak','BP-DDiak-03-04','Proses Penyelenggaraan Pelatihan Tenaga Pengajar','Membuat laporan pertanggungjawaban','Anggota Biro Transformasi Sosial','DD-DDiak-03-04-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-10 21:40:24',NULL),
(46,'DD-DDiak-03-04-003','Undangan pelatihan','Dokumen tercetak','BP-DDiak-03-04','Proses Penyelenggaraan Pelatihan Tenaga Pengajar','Membuat undangan mengikuti pelatihan','Anggota Departemen Diakonia','DD-DDiak-03-04-001','Surat yang berisi undangan mengikuti pelatihan yang diselenggarakan.','2018-07-10 21:41:28',NULL),
(47,'DD-DDiak-03-04-004','Memo Pencairan Panjar Dana','Dokumen tercetak','BP-DDiak-03-04','Proses Penyelenggaraan Pelatihan Tenaga Pengajar','Membuat memo pencairan  panjar dana','Sekretaris Jenderal','DD-DDiak-03-04-001','Laporan ini berisi tentang alokasi dana yang diberikan pada setiap program kerja yang diusulkan.','2018-07-10 21:42:27',NULL),
(48,'DD-DDiak-03-04-005','Daftar guru yang mengikuti pelatihan','Dokumen tercetak','BP-DDiak-03-04','Proses Penyelenggaraan Pelatihan Tenaga Pengajar','Membuat daftar guru yang mengikuti pelatihan','Kepala Sekolah','DD-DDiak-03-04-001','Dokumen ini berisi daftar dan identitas singkat guru-guru yang ikut serta dalam kegiatan.','2018-07-10 21:43:34',NULL),
(49,'DD-DDiak-03-05-001','Proposal konsep kegiatan','Dokumen tercetak','BP-DDiak-03-05','Proses Penyelenggaraan Workshop','Membuat proposal konsep kegiatan','Anggota Biro Transformasi Sosial','DD-DDiak-03-05-002','Laporan ini berisi detail konsep kegiatan yang dirancang.','2018-07-11 14:15:39',NULL),
(50,'DD-DDiak-03-05-002','Laporan pertanggungjawaban','Dokumen tercetak','BP-DDiak-03-05','Proses Penyelenggaraan Workshop','Membuat laporan pertanggungjawaban','Anggota Biro Transformasi Sosial','DD-DDiak-03-05-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 14:16:08',NULL),
(51,'DD-DDiak-03-05-003','Undangan Workshop','Dokumen tercetak','BP-DDiak-03-05','Proses Penyelenggaraan Workshop','Membuat undangan workshop ','Anggota Departemen Diakonia','DD-DDiak-03-05-001','Surat yang berisi undangan mengikuti workshop yang diselenggarakan.','2018-07-11 14:16:44',NULL),
(52,'DD-DDiak-03-05-004','Memo pencairan panjar dana','Dokumen tercetak','BP-DDiak-03-05','Proses Penyelenggaraan Workshop','Membuat memo pencairan  panjar dana',' Sekretaris Jenderal','DD-DDiak-03-05-001','Proposal ini berisi tentang detail usulkan program kerja dari biro/departemen.','2018-07-11 14:17:18',NULL),
(53,'DD-DDiak-03-06-001','Memo Pencairan Panjar Dana','Dokumen tercetak','BP-DDiak-03-06','Proses Penyelenggaraan Lomba','Membuat memo pencairan  panjar dana','Sekretaris Jenderal','DD-DDiak-03-06-002','Laporan ini berisi tentang alokasi dana yang diberikan pada setiap program kerja yang diusulkan.','2018-07-11 14:18:47',NULL),
(54,'DD-DDiak-02-01-001','Proposal  Program Kerja','Dokumen tercetak','BP-DDiak-02-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Proposal Program Kerja','Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-01-004','Proposal ini berisi tentang detail usulkan program kerja dari biro/departemen.','2018-07-11 14:21:01',NULL),
(55,'DD-DDiak-02-01-002','Laporan Rapat','Laporan tercetak','BP-DDiak-02-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat laporan rapat','Anggota Departemen Diakonia','DD-DDiak-02-01-001','Laporan ini berisi tentang hasil kegiatan rapat yang diselengarakan biro diakonia sosial untuk membahas usulan program kerja.','2018-07-11 14:23:06','2018-07-11 14:26:02'),
(56,'DD-DDiak-02-01-003','Laporan Anggaran Program Kerja','Laporan tercetak','BP-DDiak-02-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat Laporan Anggaran Program Kerja','Komisi  Keuangan','DD-DDiak-02-01-001','Laporan ini berisi tentang alokasi dana yang diberikan pada setiap program kerja yang diusulkan.','2018-07-11 14:24:03','2018-07-11 14:25:56'),
(57,'DD-DDiak-02-01-004','Proposal Program Kerja Hasil Kompilasi','Dokumen tercetak','BP-DDiak-02-01','Proses Persetujuan Penyelenggaraan Program Kerja','Membuat proposal program kerja hasil kompilasi','Anggota Sekretariat Jenderal','DD-DDiak-02-01-001','Proposal ini merupakan perbaikan dari semua proposal program kerja yang diusulkan.','2018-07-11 14:24:38',NULL),
(58,'DD-DDiak-02-02-002','Laporan pertanggungjawaban','Laporan tercetak','BP-DDiak-02-02','Proses Perawatan Gedung Sekolah Permata Sosial','Membuat laporan pertanggungjawaban ',' Kepaka Sekolah Permata Sosial','DD-DDiak-02-02-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 14:25:37',NULL),
(59,'DD-DDiak-02-02-001','Laporan Kerusakan Gedung Sekolah','Laporan tercetak','BP-DDiak-02-02','Proses Perawatan Gedung Sekolah Permata Sosial','Mencatat laporan kerusakan gedung dan peralatan sekolah serta biaya perbaikan','Pegawai Permata Sosial','DD-DDiak-02-02-002','Laporan ini berisi detail data kerusakan gedung sekolah yang dibawah naungan HKBP.','2018-07-11 14:32:24',NULL),
(60,'DD-DDiak-02-03-001','Dokumen MoU dengan Mitra Dana','Dokumen tercetak','BP-DDiak-02-03','Proses Kerjasama dengan Mitra Dana','Membuat MoU',' Kepala Departemen Diakonia','','Dokumen ini berisi MoU dari suatu kesepakatan yang dijalin dengan Mitra sebagai sumber dana dan bantuan.','2018-07-11 14:41:56',NULL),
(61,'DD-DDiak-02-05-001','Laporan hasil produksi','Laporan tercetak','BP-DDiak-02-05','Proses Pendataan Hasil Kerja atau Produksi','Mencatat hasil kerja dan produksi sepatu','Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-05-002','Laporan ini berisi detail produksi sepatu yang dilakukan oleh anggota biro latihan kerja/pelayanan khusus dalam memproduksi sepatu. ','2018-07-11 14:47:41',NULL),
(62,'DD-DDiak-02-05-002','Laporan hasil penjualan','Laporan tercetak','BP-DDiak-02-05','Proses Pendataan Hasil Kerja atau Produksi','Membuat laporan penjualan','Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-05-001','Laporan ini berisi detail hasil penjualan sepatu oleh anggota biro latihan kerja/pelayanan khusus','2018-07-11 14:50:42',NULL),
(63,'DD-DDiak-02-06-001','Daftar alat dan bahan pelatihan','Dokumen tercetak','BP-DDiak-02-06','Proses Pengadaan Alat dan Bahan Pelatihan','Mencatat kekurangan alat dan bahan pelatihan',' Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-06-002','Dokumen ini berisi detail alat dan barang yang diperlukan dan tersedia untuk keperluan pelatihan','2018-07-11 14:54:07',NULL),
(64,'DD-DDiak-02-06-003','Laporan Pertanggungjawaban','Laporan tercetak','BP-DDiak-02-06','Proses Pengadaan Alat dan Bahan Pelatihan','Membuat laporan pertanggungjawaban',' Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-06-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 14:54:29',NULL),
(65,'DD-DDiak-02-06-002','Laporan keuangan','Laporan tercetak','BP-DDiak-02-06','Proses Pengadaan Alat dan Bahan Pelatihan','Membuat laporan keuangan ',' Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-06-001','Laporan ini berisi detail keuangan pada biro latihan kerja/pelayanan khusus.','2018-07-11 15:07:32',NULL),
(66,'DD-DDiak-02-07-001','Laporan kekurangan','Laporan tercetak','BP-DDiak-02-07','Proses Pengadaan Perlengkapan Terapi dan Pendidikan','Mencatat kekurangan alat terapi dan pendidikan serta biaya yang diperlukan','Staf Sekolah Permata Sosial','DD-DDiak-02-07-002','Laporan berisi laporan kekurangan alat terapi dan pendidikan serta biaya yang diperlukan oleh staf sekolah permata sosial','2018-07-11 15:11:09',NULL),
(67,'DD-DDiak-02-07-002','Laporan pertanggungjawaban','Laporan tercetak','BP-DDiak-02-07','Proses Pengadaan Perlengkapan Terapi dan Pendidikan','Membuat laporan pertanggungjawaban','Staf Sekolah Permata Sosial','DD-DDiak-02-07-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 15:11:33',NULL),
(68,'DD-DDiak-02-08-002','Laporan pertanggungjawaban','Laporan tercetak','BP-DDiak-02-08','Proses Melakukan Perayaan Natal dan Paskah Anak Jalanan','Membuat laporan pertanggungjawaban','Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-08-001','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 15:12:06',NULL),
(69,'DD-DDiak-02-08-001','Proposal Perayaan Natal dan Paskah  Anak Jalanan','Dokumen tercetak','BP-DDiak-02-08','Proses Melakukan Perayaan Natal dan Paskah Anak Jalanan','Melakukan rapat','Anggota Biro Latihan Kerja/Pelayanan Khusus','DD-DDiak-02-08-002','Proposal ini berisi dalam keperluan mengadakan perayaan Natal dan Paskah oleh Biro Latihan Kerja/Pelayanan Khusus','2018-07-11 15:17:12',NULL),
(70,'DD-DDiak-02-09-001','Daftar anak jalanan','Dokumen tercetak','BP-DDiak-02-09','Proses Mengumpulkan dan Merekrut Anak Jalanan','Membuat daftar anak jalanan yang direkrut','Anggota Biro Latihan Kerja/Pelayanan Khusus ','','Dokumen ini berisi data anak jalanan yang masuk dalam program pembiaan anak kreatif oleh biro Latihan Kerja/Pelayanan Khusus','2018-07-11 15:19:49',NULL),
(71,'DD-DDiak-01-01-001','Proposal  Program Kerja','Dokumen tercetak','BP-DDiak-01-01','Proses Pembuatan Program Kerja','Membuat Proposal Program Kerja','Anggota Biro Diakonia Sosial','DD-DDiak-01-01-004','Proposal ini berisi tentang detail usulkan program kerja dari unit kerja pada biro diakonia sosial yang telah diperbaiki.','2018-07-11 15:23:23','2018-07-15 13:44:23'),
(72,'DD-DDiak-01-01-002','Proposal Program Kerja','Dokumen tercetak','BP-DDiak-01-01','Proses Pembuatan Program Kerja','Membuat proposal  rencana atau ide program kerja hasil rapat ','Unit Kerja','DD-DDiak-01-01-004','Proposal ini berisi tentang detail usulkan program kerja dari unit kerja yang kirimin ke biro diakonia sosial .','2018-07-11 15:25:47',NULL),
(73,'DD-DDiak-01-01-003','Laporan Rapat','Laporan tercetak','BP-DDiak-01-01','Proses Pembuatan Program Kerja','Membuat Laporan rapat','Anggota Departemen Diakonia','DD-DDiak-01-01-001','Laporan ini berisi tentang hasil kegiatan rapat yang diselengarakan biro diakonia sosial untuk membahas usulan program kerja.','2018-07-11 15:26:25','2018-07-11 15:26:59'),
(74,'DD-DDiak-01-01-004','Proposal Program Kerja Hasil Kompilasi','Dokumen tercetak','BP-DDiak-01-01','Proses Pembuatan Program Kerja','Membuat proposal program kerja hasil kompilasi','Anggota Sekretariat Jenderal','DD-DDiak-01-01-001','Proposal ini merupakan perbaikan dari semua proposal program kerja yang diusulkan.','2018-07-11 15:26:53',NULL),
(75,'DD-DDiak-01-01-005','Laporan Anggaran Program Kerja','Laporan tercetak','BP-DDiak-01-01','Proses Pembuatan Program Kerja','Membuat Laporan Anggaran Program Kerja','Komisi Keuangan','DD-DDiak-01-01-004','Laporan ini berisi tentang alokasi dana yang diberikan pada setiap program kerja yang diusulkan.','2018-07-11 15:27:28',NULL),
(76,'DD-DDiak-01-02-001','Proposal  Program Kerja','Dokumen tercetak','BP-DDiak-01-02','Proses Mencairkan Dana Program Kerja','Menyediakan Proposal yang telah disetujui MPS','Anggota Biro Diakonia Sosial','DD-DDiak-01-02-002','Proposal ini berisi tentang detail usulkan program kerja biro diakonia sosial.','2018-07-11 15:48:38',NULL),
(77,'DD-DDiak-01-02-002','Memo Pencairan Dana','Dokumen tercetak','BP-DDiak-01-02','Proses Mencairkan Dana Program Kerja','Membuat memo pencairan dana','Sekretaris Jenderal','DD-DDiak-01-02-001','Proposal ini berisi tentang detail usulkan program kerja dari biro/departemen.','2018-07-11 15:49:15',NULL),
(78,'DD-DDiak-01-03-001','Data analisis bencana','Dokumen tercetak','BP-DDiak-01-03','Proses Pelayanan Bencana Alam','Membuat analisis bencana','Tim Pencari Info Bencana','DD-DDiak-01-03-002','Dokumen ini berisi analasisi bencana alam yang terjadi hasil pelaporan dari pendeta/jemaat/pemerintah sekitar lokasi terjadinya bencana alam.','2018-07-11 15:52:26',NULL),
(79,'DD-DDiak-01-03-002','Hasil Evaluasi','Laporan tercetak','BP-DDiak-01-03','Proses Pelayanan Bencana Alam','Membuat hasil evaluasi','Anggota Biro Diakonia Sosial','DD-DDiak-01-03-001','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 15:56:28','2018-07-11 16:01:10'),
(80,'DD-DDiak-01-04-002','Hasil Evaluasi','Laporan tercetak','BP-DDiak-01-04','Pemberdayaan Ekonomi Keluarga/Masyarakat','Membuat Hasil evaluasi','Sie. Pemberdaya  Ekonomi  Keluarga Masyarakat Pinggir Rel Kereta','DD-DDiak-01-04-001','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 15:57:37',NULL),
(81,'DD-DDiak-01-04-001','Data Keluarga','Dokumen tercetak','BP-DDiak-01-04','Pemberdayaan Ekonomi Keluarga/Masyarakat','Membuat data keluarga yang layak butuh bantuan','Sie. Pemberdaya  Ekonomi  Keluarga Masyarakat Pinggir Rel Kereta','DD-DDiak-01-04-002','Dokumen ini berisi data keluarga yang ikut dalam program perberdayaan ekonomi keluarga/masyarakat oleh Biro Diakonia Sosial','2018-07-11 16:00:54',NULL),
(82,'DD-DDiak-01-05-001','Data anak','Dokumen tercetak','BP-DDiak-01-05',' Pendampingan Belajar bagi Anak-Anak Pinggiran Rel Kereta api/Pemulung','Membuat anggota ke dalam  beberapa kelompok','Sie.  Pendampingan Belajar Anak PinggiranRel kereta api','DD-DDiak-01-05-002','Dokumen ini berisi data anak yang ikut bergabung dalam program pendampingan belajar bagi anak-anak pinggiran rel kereta api/pemulung.','2018-07-11 16:07:21',NULL),
(83,'DD-DDiak-01-05-002','Hasil Evaluasi','Dokumen tercetak','BP-DDiak-01-05',' Pendampingan Belajar bagi Anak-Anak Pinggiran Rel Kereta api/Pemulung','Membuat hasil evaluasi','Sie.  Pendampingan Belajar Anak PinggiranRel kereta api','DD-DDiak-01-05-001','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 16:08:08',NULL),
(84,'DD-DDiak-01-06-005','Hasil evaluasi','Dokumen tercetak','BP-DDiak-01-06','Pelatihan Kerja dan Pengembangan Usaha Kreatif  bagi Pemudi  yang Putus Sekolah ','Membuat hasil evaluasi','Biro Diakonia Sosial','DD-DDiak-01-06-004','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 16:09:05',NULL),
(85,'DD-DDiak-01-06-004','Data anggota','Dokumen tercetak','BP-DDiak-01-06','Pelatihan Kerja dan Pengembangan Usaha Kreatif  bagi Pemudi  yang Putus Sekolah ','Membuat berkas anggota','Biro Diakonia Sosial','DD-DDiak-01-06-005','Dokumen ini merupakan data anggota yang mendaftar pada program kerja dan pengembangan usuha kreatif','2018-07-11 16:12:16',NULL),
(86,'DD-DDiak-01-06-001','Surat rekomendasi gereja','Dokumen tercetak','BP-DDiak-01-06','Pelatihan Kerja dan Pengembangan Usaha Kreatif  bagi Pemudi  yang Putus Sekolah ','Menerima pendaftaran anggota','Biro Diakonia Sosial','DD-DDiak-01-06-004','Surat ini diberikan oleh gereja yang menyatakan bahwa pemohon surat merupakan anggota gereja tersebut','2018-07-11 16:17:51',NULL),
(87,'DD-DDiak-01-06-002','Surat pesetujuan orang tua','Dokumen tercetak','BP-DDiak-01-06','Pelatihan Kerja dan Pengembangan Usaha Kreatif  bagi Pemudi  yang Putus Sekolah ','Menerima pendaftaran anggota','Biro Diakonia Sosial','','Surat ini berisi persetujuan orang tua dari pemuda/pemudi untuk mengikuti program.','2018-07-11 16:20:48',NULL),
(88,'DD-DDiak-01-06-003','Surat kesehatan','Dokumen tercetak','BP-DDiak-01-06','Pelatihan Kerja dan Pengembangan Usaha Kreatif  bagi Pemudi  yang Putus Sekolah ','Menerima pendaftaran anggota','Biro Diakonia Sosial','DD-DDiak-01-06-004','Surat ini berisi bukti dinyatakan sehat oleh dokter.','2018-07-11 16:22:39',NULL),
(89,'DD-DDiak-01-07-002','Hasil Evaluasi','Laporan tercetak','BP-DDiak-01-07','Proses  Pendampingan bagi Anak-Anak Kreatif Mandiri','Membuat hasil evaluasi','Sie.  Pendampingan Anak Kreatif Mandiri','DD-DDiak-01-07-001','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 16:23:33',NULL),
(90,'DD-DDiak-01-07-001','Data diri anak','Dokumen tercetak','BP-DDiak-01-07','Proses  Pendampingan bagi Anak-Anak Kreatif Mandiri','Membuat daftar anak yang mendaftar','Sie.  Pendampingan Anak Kreatif Mandiri','','Dokumen ini berisi data diri anak yang mengikuti program pendampingan','2018-07-11 16:24:25',NULL),
(91,'DD-DDiak-01-08-001','Hasil evaluasi','Laporan tercetak','BP-DDiak-01-08','Pendampingan Pelayanan bagi Narapidana di Penjara','Membuat hasil evaluasi','Sie. Pelayanan Penjara','','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 16:25:07',NULL),
(92,'DD-DDiak-01-09-002','Hasil Evaluasi','Laporan tercetak','BP-DDiak-01-09','Perekrutan Perempuan Marginal','Membuat hasil evaluasi','Sie.  Pelayanan Pemberdayaan di Lokalisasi','DD-DDiak-01-09-001','Dokumen ini berisi hasil evaluasi kegiatan setiap kali menyelesaikan suatu kegiatan untuk mengetahui pencapaian, kendala dan perbaikan untuk kegiatan berikutnya.','2018-07-11 16:25:24',NULL),
(93,'DD-DDiak-01-09-001','Data Anggota','Dokumen tercetak','BP-DDiak-01-09','Perekrutan Perempuan Marginal','Membuat daftar anggota','Sie.  Pelayanan Pemberdayaan di Lokalisasi','DD-DDiak-01-09-002','Dokumen ini merupakan data para perempuan marginal yang mengikuti program pemberdayaan di lokalosasi.','2018-07-11 16:29:25',NULL),
(94,'DD-DDiak-01-10-001','Laporan Pertanggungjawaban','Laporan tercetak','BP-DDiak-01-10','Proses Pelaporan Hasil Kegiatan Program Kerja','Membuat laporan pertanggungjawaban','Unit Kerja','','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 16:30:00',NULL),
(95,'DD-DDiak-03-06-002','Laporan konsep kegiatan','Laporan tercetak','BP-DDiak-03-06','Proses Penyelenggaraan Lomba','Membuat laporan konsep kegiatan','Panitia Lomba','DD-DDiak-03-06-003','Laporan ini berisi detail konsep kegiatan yang dirancang.','2018-07-11 16:50:59',NULL),
(96,'DD-DDiak-03-06-003','Laporan pertanggungjawaban','Laporan tercetak','BP-DDiak-03-06','Proses Penyelenggaraan Lomba','Membuat laporan pertanggungjawaban','Panitia Lomba','DD-DDiak-03-06-002','Laporan ini berisi detail pertanggungjawaban kegiatan yang telah diselenggarakan dan keuangannya.','2018-07-11 16:51:21',NULL),
(98,'qwr','qwr','Dokumen tercetak','Diagram 1','Proses Pembuatan Program Kerja','qwr','qwr','qwr','qwr','2018-07-15 14:10:28',NULL),
(99,'q','q','Laporan tercetak','q','q','q','q','q','q','2018-07-15 14:44:10',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
