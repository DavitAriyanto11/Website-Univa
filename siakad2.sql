-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 09:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `kode_dosen` varchar(8) COLLATE latin1_general_ci NOT NULL,
  `nama_dosen` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `foto` varchar(250) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_dosen`
--

INSERT INTO `tb_dosen` (`kode_dosen`, `nama_dosen`, `telpon`, `email`, `alamat`, `foto`) VALUES
('D001', 'Davit Ariyanto, S.Kom., M.Kom', '081266289378', 'davidariyanto@gmail.com', 'Pasaman Barat', 'WhatsApp Image 2022-07-28 at 16.38.45.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id` int(9) NOT NULL,
  `kode_mk` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `kode_ruang` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `kode_dosen` varchar(8) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id`, `kode_mk`, `kode_ruang`, `tanggal`, `jam_mulai`, `jam_selesai`, `kode_dosen`) VALUES
(25, 'M001', 2, '2005-12-24', '09:45:00', '11:45:00', 'D001'),
(24, 'M009', 1, '2024-12-12', '08:30:00', '09:45:00', 'D001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id` int(11) NOT NULL,
  `kode_jurusan` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `nama_jurusan` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id`, `kode_jurusan`, `nama_jurusan`) VALUES
(5, 'TI', 'Informatika'),
(4, 'SI', 'Sistem Informasi'),
(6, 'MNJ', 'Manajemen Ritel'),
(7, 'KWU', 'Kewirausahaan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_khs`
--

CREATE TABLE `tb_khs` (
  `nim` varchar(8) COLLATE latin1_general_ci NOT NULL,
  `kode_mk` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `nilai` varchar(1) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_krs`
--

CREATE TABLE `tb_krs` (
  `kode` int(9) NOT NULL,
  `kode_mk` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `nim` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `kode_jurusan` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `status_nilai` varchar(2) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_krs`
--

INSERT INTO `tb_krs` (`kode`, `kode_mk`, `nim`, `kode_jurusan`, `status_nilai`) VALUES
(40, 'M009', '081266289378', 'SI', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nim` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `kode_jurusan` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `smester` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `foto` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status_krs` varchar(2) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nim`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `kode_jurusan`, `smester`, `jenis_kelamin`, `email`, `telpon`, `foto`, `status_krs`) VALUES
('123456789104', 'Ani', 'Bukittinggi', '2007-05-22', 'Bukittinggi', 'SI', '1', 'P', 'ani@gmail.com', '081266289377', 'logo.jpg', '1'),
('123456789103', 'sandra', 'Payahkumbuh', '2008-05-03', 'Payahkumbuh', 'KWU', '1', 'L', 'sandra@gmail.com', '081266289312', 'LOGO M. NATSIR.png', '1'),
('123456789102', 'beni', 'Padang', '2007-02-05', 'Kota Padang', 'MNJ', '1', 'L', 'beni@gmail.com', '081266289378', 'DC COMPUTER.jpg', '1'),
('123456789101', 'bunga', 'Sawahlunto', '2009-11-23', 'Sawahlunto', 'TI', '1', 'P', 'bunga@gmail.com', '081266289378', 'images.jpg', '1'),
('081266289378', 'abc', 'solok', '2008-08-21', 'Ulak Karang', 'SI', '2', 'L', 'abc@gmail.com', '081266289387', 'download.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_matkul`
--

CREATE TABLE `tb_matkul` (
  `kode_mk` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `nama_mk` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `sks` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `smester` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_matkul`
--

INSERT INTO `tb_matkul` (`kode_mk`, `nama_mk`, `sks`, `smester`) VALUES
('M001', 'Aljabar Linear', '2', '1'),
('M002', 'Pengantar Teknologi Informasi', '3', '1'),
('M003', 'Algoritma Dan Pemograman ', '4', '1'),
('M004', 'Pancasila', '2', '1'),
('M005', 'Kewarganegaraan', '2', '1'),
('M006', 'Konfigurasi Dan Penggunaan Sistem Operasi', '3', '1'),
('M007', 'English For Information Technology', '2', '1'),
('M008', 'Dasar Manajemen Rumah Sakit', '2', '1'),
('M009', 'Struktur Data', '3', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `kode_mk` varchar(4) COLLATE latin1_general_ci NOT NULL,
  `kode_dosen` varchar(8) COLLATE latin1_general_ci NOT NULL,
  `smester` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `grade` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `tugas` int(11) NOT NULL,
  `uts` int(11) NOT NULL,
  `uas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_nilai`
--

INSERT INTO `tb_nilai` (`id`, `nim`, `kode_mk`, `kode_dosen`, `smester`, `grade`, `tugas`, `uts`, `uas`) VALUES
(1, '1130028', 'M002', 'D003', '1', '', 90, 90, 90),
(2, '1130001', 'M002', 'D003', '1', '', 70, 90, 85),
(3, '1130028', 'M005', 'D003', '1', '', 80, 85, 80),
(4, '1130004', 'M005', 'D003', '1', '', 60, 50, 70),
(5, '1130001', 'M005', 'D003', '1', '', 80, 80, 80),
(6, '1130028', 'M009', 'D002', '2', '', 60, 60, 60),
(7, '1130001', 'M001', 'D007', '1', '', 60, 70, 88),
(8, '081266289378', 'M009', 'D001', '2', '', 50, 65, 78);

-- --------------------------------------------------------

--
-- Table structure for table `tb_ruang`
--

CREATE TABLE `tb_ruang` (
  `kode_ruang` int(5) NOT NULL,
  `nama_ruang` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_ruang`
--

INSERT INTO `tb_ruang` (`kode_ruang`, `nama_ruang`) VALUES
(1, 'Kelas A'),
(2, 'Kelas B');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(9) NOT NULL,
  `user_id` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `pass` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `foto` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `user_id`, `nama`, `pass`, `level`, `foto`) VALUES
(1, 'admin', 'Davit Ariyanto', '123456', 'admin', 'visimisi.jpg'),
(40, 'D007', 'thufail ahmad nafis', '123456', 'dosen', 'visimisi.jpg'),
(30, '1130003', 'Budi', '12345', 'mahasiswa', 'aku2.jpg'),
(31, '1130004', 'Dedi', '12345', 'mahasiswa', 'parman.jpg'),
(29, '1130002', 'Ayu Selvia ', '12345', 'mahasiswa', 'model inggris.jpg'),
(28, '1130001', 'agustinus', '12345', 'mahasiswa', 'parman.jpg'),
(26, '1130028', 'Parman', '12345', 'mahasiswa', 'parman1.jpg'),
(27, '1120025', 'Fitri Handayani', '12345', 'mahasiswa', 'merah.jpg'),
(39, 'D006', 'Ahmad Alfian Fadli', 'faldi2008', 'dosen', 'fotoku.jpg'),
(41, '081266289378', 'abc', '12345', 'mahasiswa', 'download.jpg'),
(42, 'D001', 'Davit Ariyanto, S.Kom., M.Kom', '123456', 'dosen', 'WhatsApp Image 2022-07-28 at 16.38.45.jpeg'),
(43, '123456789101', 'bunga', '12345', 'mahasiswa', 'images.jpg'),
(44, '123456789102', 'beni', '12345', 'mahasiswa', 'DC COMPUTER.jpg'),
(45, '123456789103', 'sandra', '12345', 'mahasiswa', 'LOGO M. NATSIR.png'),
(46, '123456789104', 'Ani', '12345', 'mahasiswa', 'logo.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indexes for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_krs`
--
ALTER TABLE `tb_krs`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tb_matkul`
--
ALTER TABLE `tb_matkul`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_krs`
--
ALTER TABLE `tb_krs`
  MODIFY `kode` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  MODIFY `kode_ruang` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
