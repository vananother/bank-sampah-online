-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2014 at 08:35 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `banksampahonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE IF NOT EXISTS `akun` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role` enum('admin','pengguna') NOT NULL DEFAULT 'pengguna',
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `alamat` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `uangvirtual` double unsigned NOT NULL DEFAULT '0',
  `totalpoint` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `role`, `username`, `password`, `firstname`, `lastname`, `email`, `alamat`, `phone`, `uangvirtual`, `totalpoint`) VALUES
(1, 'admin', 'admin1', '25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7', 'Admin', 'Satu', 'admin@banksampahonline.com', 'Universitas Indonesia, Depok', '0', 0, 0),
(2, 'admin', 'admin2', '1c142b2d01aa34e9a36bde480645a57fd69e14155dacfab5a3f9257b77fdc8d8', 'Admin', 'Dua', 'admin2@banksampahonline.com', 'Kukusan, Depok', '08989226954', 0, 0),
(3, 'admin', 'admin3', '4fc2b5673a201ad9b1fc03dcb346e1baad44351daa0503d5534b4dfdcc4332e0', 'Admin', 'Tiga', 'admin2@banksampahonline.com', 'Universitas Indonesia, Depok', '210000001', 0, 0),
(4, 'pengguna', 'evan', '0ac9744286fca60457e514314227e0026a5bd8badc3793f08becbfb68b7facb8', 'Evan', 'Ariansyah', 'evan.ariansyah@gmail.com', 'asdashas', '8888', 6004, 6004),
(5, 'pengguna', 'betatester', '0ac9744286fca60457e514314227e0026a5bd8badc3793f08becbfb68b7facb8', 'beta', 'tester', 'beta.tester@yahoo.com', 'beta tester 0', '08989226954', 0, 0),
(6, 'pengguna', 'akun1', '65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5', 'Akun', 'Satu', 'akun.satu@yahoo.com', 'Jalan Sebelah', '0218910221231', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_sampah` varchar(32) NOT NULL,
  PRIMARY KEY (`id_kategori`),
  UNIQUE KEY `kategori_sampah` (`kategori_sampah`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori_sampah`) VALUES
(3, 'Alat Elektronik'),
(4, 'Baju Bekas'),
(6, 'Besi Bekas'),
(1, 'Botol/Gelas Plastik'),
(2, 'Furnitur Bekas'),
(5, 'Mainan');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE IF NOT EXISTS `pesan` (
  `id_pesan` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pengirim` varchar(32) NOT NULL,
  `id_penerima` varchar(32) NOT NULL,
  `subjek` text NOT NULL,
  `isi` varchar(64) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pesan`),
  KEY `id_pengirim` (`id_pengirim`),
  KEY `id_penerima` (`id_penerima`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pengirim`, `id_penerima`, `subjek`, `isi`, `tanggal`, `jam`, `seen`) VALUES
(1, 'evan', 'admin1', 'test', 'test', '2014-05-20', '22:35:33', 1),
(2, 'evan', 'admin1', 'test', 'test', '2014-05-20', '23:00:00', 1),
(3, 'admin1', 'evan', 'test2', 'test2', '2014-05-20', '23:01:00', 1),
(4, 'admin1', 'evan', 'test2', 'eeeeee', '2014-05-21', '22:49:00', 1),
(5, 'admin1', 'betatester', 'test kirim message', 'test kirim message', '2014-05-21', '22:50:57', 0),
(6, 'admin1', 'evan', 'test counter', 'read this', '2014-05-21', '23:33:44', 1),
(7, 'evan', 'admin1', 'bayarannya nih', 'kok bayarannya cuma 4 sih?', '2014-05-22', '04:29:17', 1),
(8, 'admin1', 'evan', '123', 'tes tes', '2014-05-22', '11:33:01', 1),
(9, 'evan', 'admin3', 'test message', 'test message 2', '2014-05-22', '12:06:33', 0),
(10, 'evan', 'admin1', 's', 's', '2014-05-22', '12:23:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sampah`
--

CREATE TABLE IF NOT EXISTS `sampah` (
  `id_sampah` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pengirim` varchar(32) NOT NULL,
  `kategori` varchar(32) NOT NULL,
  `jumlah` double NOT NULL,
  `status` enum('Belum Dijemput','Sudah Diterima','Sudah Dibayar') NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `keterangan` text,
  `bayaran` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sampah`),
  UNIQUE KEY `id_sampah` (`id_sampah`),
  KEY `kategori` (`kategori`),
  KEY `pengirim` (`pengirim`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `sampah`
--

INSERT INTO `sampah` (`id_sampah`, `pengirim`, `kategori`, `jumlah`, `status`, `tanggal`, `jam`, `keterangan`, `bayaran`) VALUES
(1, 'admin1', 'Botol/Gelas Plastik', 12, 'Sudah Dibayar', '2014-05-12', '20:27:33', 'Test Saja', 21),
(2, 'admin1', 'Baju Bekas', 22, 'Sudah Diterima', '2014-06-21', '20:20:00', 'jemput pakai mobil', 0),
(3, 'evan', 'Furnitur Bekas', 23, 'Sudah Dibayar', '2014-05-20', '20:20:00', 'on time', 10000),
(4, 'evan', 'Alat Elektronik', 5, 'Sudah Dibayar', '2014-05-20', '20:20:00', '', 1),
(10, 'evan', 'Mainan', 2, 'Sudah Dibayar', '2014-05-26', '20:20:00', '', 1000),
(11, 'evan', 'Alat Elektronik', 3, 'Sudah Dibayar', '2014-05-26', '20:20:00', '', 5000),
(12, 'admin2', 'Alat Elektronik', 3, 'Sudah Diterima', '2014-05-26', '20:20:00', '', 0),
(13, 'admin2', 'Mainan', 2, 'Sudah Diterima', '2014-05-26', '20:00:00', '', 0),
(14, 'admin2', 'Alat Elektronik', 2, 'Sudah Diterima', '2014-05-26', '20:20:00', '', 0),
(15, 'admin2', 'Alat Elektronik', 3, 'Sudah Diterima', '2014-06-01', '20:00:00', '', 0),
(16, 'admin2', 'Baju Bekas', 3, 'Sudah Diterima', '2014-07-01', '00:00:00', '', 0),
(17, 'evan', 'Alat Elektronik', 4, 'Sudah Dibayar', '2014-07-01', '20:20:00', 'kipas angin bekas', 4),
(18, 'akun1', 'Baju Bekas', 3, 'Belum Dijemput', '2014-06-18', '20:20:00', 'setumpukan baju usang', 0),
(19, 'evan', 'Botol/Gelas Plastik', 2, 'Belum Dijemput', '2014-05-30', '20:20:00', '', 0),
(20, 'evan', 'Botol/Gelas Plastik', 2, 'Belum Dijemput', '2014-05-30', '20:20:00', '', 0),
(21, 'evan', 'Botol/Gelas Plastik', 2, 'Belum Dijemput', '2014-07-01', '20:00:00', '', 0),
(22, 'evan', 'Botol/Gelas Plastik', 3, 'Belum Dijemput', '2014-07-01', '20:20:00', '', 0),
(23, 'evan', 'Botol/Gelas Plastik', 2, 'Belum Dijemput', '2014-07-01', '08:01:00', '', 0),
(24, 'evan', 'Botol/Gelas Plastik', 2, 'Belum Dijemput', '2014-07-01', '08:00:00', '', 0),
(25, 'evan', 'Botol/Gelas Plastik', 2, 'Belum Dijemput', '2014-07-01', '22:00:00', '', 0),
(26, 'evan', 'Furnitur Bekas', 3, 'Belum Dijemput', '2014-07-01', '07:01:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `k1` int(11) NOT NULL,
  `k2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`k1`, `k2`) VALUES
(11, 12),
(21, 22);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `penerima` FOREIGN KEY (`id_penerima`) REFERENCES `akun` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengirim` FOREIGN KEY (`id_pengirim`) REFERENCES `akun` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sampah`
--
ALTER TABLE `sampah`
  ADD CONSTRAINT `jenis_kategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`kategori_sampah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengirim_sampah` FOREIGN KEY (`pengirim`) REFERENCES `akun` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
