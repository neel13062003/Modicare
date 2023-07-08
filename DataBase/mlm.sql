-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2023 at 05:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlm`
--

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upline` varchar(255) DEFAULT NULL,
  `amount` float NOT NULL,
  `fd` int(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `date1` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `upline`, `amount`, `fd`, `date`, `date1`) VALUES
(34, 'dimplesoni', 'kjs', 200000, 100000, '2023-03-01 21:25:32', '2023-04-14 12:09:56'),
(35, 'nishasoni', 'dimplesoni', 1225000, 0, '2023-03-01 21:25:51', NULL),
(36, 'kjs', '', 70000, 0, '2023-03-01 21:26:07', NULL),
(37, 'tirth', 'dimplesoni', 10000, 0, '2023-03-01 21:30:55', NULL),
(38, 'anitasoni', 'dimplesoni', 10000, 0, '2023-03-01 21:31:38', NULL),
(39, 'kkthakor', 'dimplesoni', 25000, 0, '2023-03-01 21:31:58', NULL),
(40, 'arvinda', 'kjs', 30000, 0, '2023-03-01 21:32:26', NULL),
(41, 'bipindarji', 'kjs', 20000, 0, '2023-03-01 21:32:41', NULL),
(42, 'niketan', 'nishasoni ', 25000, 0, '2023-03-01 21:33:01', NULL),
(43, 'sarika', 'nishasoni', 30000, 0, '2023-03-01 21:33:22', NULL),
(44, 'ansuya', 'nishasoni', 320000, 0, '2023-03-01 21:33:42', NULL),
(46, 'vipulgohil', 'nishasoni', 20000, 0, '2023-03-05 10:42:44', NULL),
(59, 'alpita', 'nishasoni', 17000, 0, '2023-04-08 12:34:24', NULL),
(60, 'pinkybhatt', 'nishasoni', 20000, 0, '2023-04-13 18:50:39', NULL),
(64, 'gayatri', 'dimplesoni', 50000, 0, '2023-04-15 14:02:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `phone`, `password`, `joinDate`) VALUES
(15, 'dimplesoni', 'Dimple', 'Soni', 9427080543, '123456', '2023-02-18 19:42:02'),
(16, 'nikunjsoni', 'Nikunj', 'Soni', 9427080543, '123456', '2023-04-03 14:20:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
