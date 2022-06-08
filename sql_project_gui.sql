-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2020 at 04:52 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `name` varchar(255) NOT NULL,
  `id` int(255) NOT NULL,
  `parent` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`name`, `id`, `parent`) VALUES
('Aromatic flowers', 1, 14),
('Birthday flower', 2, 11),
('bunch of flowers', 3, 18),
('By price', 4, 6),
('Classification of plants', 5, 12),
('Events', 6, NULL),
('Flower box', 7, 18),
('flowers', 8, 8),
('Low light resistant', 9, 16),
('Luxury flowers and plants', 10, 4),
('occasion', 11, 6),
('plant', 12, NULL),
('potted plant', 13, 5),
('Property', 14, 8),
('Sick visit flower', 15, 11),
('Suitable for', 16, 12),
('Terrarium', 17, 5),
('Type of design', 18, 8);

-- --------------------------------------------------------

--
-- Table structure for table `preservative`
--

CREATE TABLE `preservative` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product` int(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preservative`
--

INSERT INTO `preservative` (`id`, `name`, `product`, `price`) VALUES
(1, 'Plant food', 1, '14000.00'),
(2, 'Gift doll', 1, '75000.00'),
(3, 'Bear doll with pink skirt', 1, '143000.00'),
(6, 'post card', 2, NULL),
(7, 'Plant food', 2, '14000.00'),
(8, 'Gift doll', 2, '75000.00'),
(9, 'Bear doll with pink skirt', 2, '143000.00'),
(10, 'post card', 3, NULL),
(11, 'Plant food', 3, '14000.00'),
(12, 'Gift doll', 3, '75000.00'),
(13, 'Bear doll with pink skirt', 3, '143000.00'),
(14, 'post card', 4, NULL),
(15, 'Gift doll', 4, '75000.00'),
(16, 'Bear doll with pink skirt', 4, '143000.00'),
(17, 'post card', 5, NULL),
(18, 'Gift doll', 5, '75000.00'),
(19, 'flower pot', 5, '24000.00'),
(20, 'post card', 7, NULL),
(21, 'post card', 10, NULL),
(22, 'Bear doll with pink skirt', 10, '143000.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `image` varbinary(8000) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `number` int(255) NOT NULL,
  `category_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `image`, `price`, `color`, `number`, `category_id`) VALUES
(1, 'Large compact Drasna', NULL, '99000.00', NULL, 12, 0),
(2, 'Zamophilia 5 to 7 folds', NULL, '349000.00', NULL, 4, 0),
(3, 'Zamophilia 3 folds', NULL, '215000.00', NULL, 6, 0),
(4, 'Super Square Terrarium with light stand', NULL, '397000.00', NULL, 0, 0),
(5, 'Miniature pink cream rose', NULL, '110000.00', NULL, 5, 0),
(7, 'Dutch red rose cup 20 branches', NULL, '389000.00', NULL, 5, 0),
(8, 'Eternal Rose Four Flowers', NULL, '420000.00', NULL, 5, 0),
(9, 'White anthurium wooden box', NULL, '176000.00', NULL, 5, 0),
(10, 'Pedilanthus with pots of organic matter', NULL, '119000.00', NULL, 0, 0),
(11, 'Yellow white orchid with concrete vase', NULL, '295000.00', NULL, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `receipt_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `preservative_id` int(255) NOT NULL,
  `product_number` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`receipt_id`, `product_id`, `preservative_id`, `product_number`) VALUES
(1, 1, 5, 2),
(1, 5, 2, 1),
(1, 10, 21, 1),
(2, 3, 7, 2),
(2, 9, 5, 1),
(3, 1, 3, 1),
(3, 11, 5, 1),
(4, 8, 20, 1),
(5, 4, 15, 1),
(6, 2, 6, 1),
(6, 7, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id` int(255) NOT NULL,
  `delivery_time` datetime NOT NULL,
  `shipping_fee` int(255) DEFAULT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`id`, `delivery_time`, `shipping_fee`, `user_id`) VALUES
(1, '2020-05-11 16:00:00', 3000, 1),
(2, '2020-04-22 18:00:00', NULL, 2),
(3, '2019-12-10 18:00:00', 12000, 3),
(4, '2020-02-20 16:00:00', 5000, 3),
(5, '2020-03-14 16:00:00', 10000, 4),
(6, '2020-06-15 16:00:00', 4000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` decimal(50,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `email`, `mobile_number`) VALUES
(1, '123', 'x@gmail.com', NULL),
(2, '456', 'y@gmail.com', NULL),
(3, '789', 'z@gmail.com', '989445671134'),
(4, 'yas34', 'a@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preservative`
--
ALTER TABLE `preservative`
  ADD PRIMARY KEY (`id`,`product`),
  ADD KEY `foreign` (`product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`receipt_id`,`product_id`,`preservative_id`),
  ADD KEY `purchase_ibfk_1` (`product_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_foreign_key` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `preservative`
--
ALTER TABLE `preservative`
  ADD CONSTRAINT `foreign` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_foreign_key` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
