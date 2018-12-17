-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2018 at 10:24 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sampledb`
--

-- ------------------
SELECT user.customer_name, addr.address, food.item_name, food.item_id, food.item_price
    FROM register_tbl AS user FULL JOIN delivery_addresses_tbl AS add FULL JOIN allfood_tbl AS food
    ON user.id = addr.id ORDER BY emp_name--------------------------------------

--
-- Table structure for table `meals_tbl`
--
CREATE TABLE `shopping_cart_tbl` (
  `id` int(10) NOT NULL,
  `cudtomer_id` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_id` int(10) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(2) NOT NULL,
  `total` float NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `food_orders_tbl` (
  `id` int(10) NOT NULL,
  `cudtomer_id` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_id` int(10) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(2) NOT NULL,
  `total` float NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
