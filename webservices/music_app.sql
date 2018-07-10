-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2018 at 06:47 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_app`
--
CREATE DATABASE IF NOT EXISTS `music_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `music_app`;

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `idMusic` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `likes` int(11) NOT NULL,
  `escuchados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`idMusic`, `nombre`, `likes`, `escuchados`) VALUES
(1, 'Clasicas-Espanol_Completamente-Enamorado.mp3', 0, 1),
(2, 'Rock-Espanol_Doble-Opuesto.mp3', 0, 1),
(3, 'Rock-Espanol_Luna.mp3', 0, 0),
(4, 'Afuera.mp3', 0, 0),
(5, 'Rock-Espanol_No-Te-Amo.mp3', 1, 3),
(6, 'Rock-Espanol_La-Chispa-Adecuada.mp3', 0, 3),
(7, 'Rock-Espanol_Mil-Demonios.mp3', 0, 1),
(8, 'Rock-Espanol_Mismo-Hotel.mp3', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`idMusic`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `music`
--
ALTER TABLE `music`
  MODIFY `idMusic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
