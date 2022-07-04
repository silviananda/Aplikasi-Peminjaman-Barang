-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2019 at 06:41 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangkita`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stock_barang` int(100) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `barang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stock_barang`, `id_user`, `barang`) VALUES
('1', 'kain', 3, '1', 'kain.png'),
('2', 'lem', 7, '1', 'lem.png'),
('3', 'klip', 2, '1', 'klip.png'),
('4', 'klip', 2, '2', 'klip.png');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` varchar(50) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `jumlah` int(3) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token`, `id_user`) VALUES
(19, 'd1d64d27171821dd03eb6d9190e29f0aa45594aaea05ec1bdc9efc5e27a84026', 1),
(20, '955f2374328686d166ecedb8a8ab173cd0c11124ef7b630a0381a76155ce0302', 10),
(21, 'ce37929b81e95da390e9183eddf4ca91a96a1aaa3ed833b2b9b8ae728b26197a', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `logo`) VALUES
('1', 'hmif', '1C6F4CE7D5C6B91F0FB09E506841C45CDBDC82F37C2E5E7CC0551A9E61E97690', 'hmif.PNG'),
('10', 'ldf', '9785F0ED3783DF1225B23B5E98C75EF0893E6C90DF0EA42F717CC7B6752044E8', 'ldf.png'),
('2', 'himafis', '1C6F4CE7D5C6B91F0FB09E506841C45CDBDC82F37C2E5E7CC0551A9E61E97690', 'himafis.PNG'),
('3', 'himatika', '1C6F4CE7D5C6B91F0FB09E506841C45CDBDC82F37C2E5E7CC0551A9E61E97690', 'himatika.PNG'),
('4', 'himafar', 'F804A2BEF27A35474701E295B6CD8F5DC20BF7EEE2051ACB27503A5BA2DCA8F4', 'himafar.png'),
('5', 'himasta', '37361720CF3A0F8A9CDD1776FD318D1DB40EAAB5649523EC474EF07DD26D576B', 'himasta.png'),
('6', 'hmb', '5AABFF924E21BC199FD0370CF91140DC3A930F99B9CEF7E9E76A48E49A42407F', 'hmb.png'),
('7', 'hmmi', 'F77811031CC8F602D6A3C5D2D3F9EA46291152773D28448585E0AC0C97716A10', 'hmmi.png'),
('8', 'baracuda', 'F86EC1655576F0678C43951392FD24BA78BB8F405C70997A78AB159E2C21C2E3', 'baracuda.png'),
('9', 'seuramoe', '9B3AB9F79DC1FAD73C7B18CF28E0C1B959B0E9B9E49021D0B8981B690D5E9AD5', 'seuramoe.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
