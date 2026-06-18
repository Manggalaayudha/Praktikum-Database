-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2026 at 05:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `bidang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `bidang`) VALUES
('1980010001', 'Dr. Ahmad Fauzi', 'Basis Data'),
('1980010002', 'Dr. Siti Rahma', 'Pemrograman'),
('1980010003', 'Dr. Bambang Wijaya', 'Jaringan Komputer'),
('1980010004', 'Dr. Rina Kartika', 'Kecerdasan Buatan'),
('1980010005', 'Dr. Dedi Kurniawan', 'Sistem Informasi'),
('1980010006', 'Dr. Maya Sari', 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`) VALUES
('1234567890', 'Andi', 'Informatika'),
('2301000001', 'Andi Pratama', 'Informatika'),
('2301000002', 'Budi Santoso', 'Sistem Informasi'),
('2301000003', 'Citra Lestari', 'Informatika'),
('2301000004', 'Dewi Anggraini', 'Teknik Komputer'),
('2301000005', 'Eko Saputra', 'Sistem Informasi'),
('2301000006', 'Fitri Handayani', 'Informatika'),
('2301000007', 'Galih Nugroho', 'Teknik Komputer'),
('2301000008', 'Hani Putri', 'Sistem Informasi'),
('2301000009', 'Indra Wijaya', 'Informatika'),
('2301000010', 'Joko Susilo', 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`) VALUES
('IF1001', 'Algoritma dan Pemrograman', 3),
('IF1002', 'Struktur Data', 3),
('IF1003', 'Basis Data', 3),
('IF1004', 'Pemrograman Web', 3),
('IF1005', 'Jaringan Komputer', 3),
('IF1006', 'Sistem Operasi', 3),
('IF1007', 'Kecerdasan Buatan', 3),
('IF1008', 'Analisis dan Desain Sistem', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `nim` char(10) DEFAULT NULL,
  `nama_mahasiswa` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `jumlah_tagihan` int(11) DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nim`, `nama_mahasiswa`, `semester`, `jumlah_tagihan`, `status_pembayaran`) VALUES
(1, '2301000001', 'Andi Pratama', 2, 3500000, 'Lunas'),
(2, '2301000002', 'Budi Santoso', 2, 3500000, 'Lunas'),
(3, '2301000003', 'Citra Lestari', 4, 3750000, 'Lunas'),
(4, '2301000004', 'Dewi Anggraini', 4, 3750000, 'Belum Lunas'),
(5, '2301000005', 'Eko Saputra', 6, 4000000, 'Lunas'),
(6, '2301000006', 'Fitri Handayani', 6, 4000000, 'Belum Lunas'),
(7, '2301000007', 'Galih Nugroho', 2, 3500000, 'Lunas'),
(8, '2301000008', 'Hani Putri', 4, 3750000, 'Belum Lunas'),
(9, '2301000009', 'Indra Wijaya', 6, 4000000, 'Lunas'),
(10, '2301000010', 'Joko Susilo', 2, 3500000, 'Belum Lunas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
