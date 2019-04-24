-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2019 at 09:31 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `allfood_tbl`
--

CREATE TABLE `allfood_tbl` (
  `id` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `cost` float NOT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allfood_tbl`
--

INSERT INTO `allfood_tbl` (`id`, `item`, `description`, `cost`, `image`) VALUES
(1000, 'Italian Style Macaroni', 'meal', 8.99, 'macaroni.jpg'),
(1001, 'Roasted Boneless Ham', 'meal', 19.99, 'roastedHam.jpg'),
(1002, 'Gourmet Style Chicken', 'meal', 11.99, 'chickenResize.jpg'),
(1003, 'Roasted Cauliflower Lasagna', 'meal', 30.5, 'roastedCauliflower.jpg'),
(1004, 'Gourmet dip with roasted wedges', 'meal', 11.25, 'dipAndChips.jpg'),
(1005, 'Grilled Skewers', 'meal', 7.5, 'skewers.jpg'),
(1006, 'Vegetable Roll', 'meal', 9.7, 'veggieRoll.jpg'),
(1007, 'Corn and Potatoe Chowder', 'meal', 25.89, 'cornAndPotatoChowder.jpg'),
(1008, 'Gourmet Style Pizza', 'meal', 11.99, 'pizza.jpg'),
(1009, 'Bourbon Whiskey', 'drink', 5.5, 'bourbon.jpg'),
(1010, 'Old Aztec Whiskey', 'drink', 5.45, 'oldAztec.jpg'),
(1011, 'Old Wisconsin Whiskey', 'drink', 6.25, 'oldWisconsin.jpg'),
(1012, 'Fluffy pancakes smothered in honey', 'dessert', 4.9, 'pancakes.jpg'),
(1013, 'Death by Chocolate Cake', 'dessert', 6.99, 'chocolateExplosion.jpg'),
(1014, 'Cheese Cake with Salty Prezzles', 'dessert', 7.99, 'cakePrezzle.jpg'),
(1015, 'Seasoned Oven Baked Turkey', 'meal', 35.66, 'turkey.jpg'),
(1016, 'Sea Bass with Artichoke', 'meal', 9.99, 'seaBass.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `authorized_users_tbl`
--

CREATE TABLE `authorized_users_tbl` (
  `id` int(10) NOT NULL,
  `username` text NOT NULL,
  `role` text NOT NULL,
  `secret_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorized_users_tbl`
--

INSERT INTO `authorized_users_tbl` (`id`, `username`, `role`, `secret_key`) VALUES
(1, 'admin', 'administrator', 'secret123admin789key');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Name` varchar(8) NOT NULL,
  `State` varchar(10) DEFAULT NULL,
  `Lifetime` varchar(23) DEFAULT NULL,
  `Response` varchar(8) DEFAULT NULL,
  `Coverage` varchar(8) DEFAULT NULL,
  `Education` varchar(20) DEFAULT NULL,
  `EffectiveDate` varchar(17) DEFAULT NULL,
  `Employment` varchar(16) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Income` varchar(6) DEFAULT NULL,
  `Location` varchar(13) DEFAULT NULL,
  `MaritalStatus` varchar(14) DEFAULT NULL,
  `MonthlyPremium` varchar(20) DEFAULT NULL,
  `LastClaim` varchar(23) DEFAULT NULL,
  `PolicyType` varchar(14) DEFAULT NULL,
  `SalesChannel` varchar(13) DEFAULT NULL,
  `TotalClaim` varchar(18) DEFAULT NULL,
  `VehicleClass` varchar(13) DEFAULT NULL,
  `VehicleSize` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Name`, `State`, `Lifetime`, `Response`, `Coverage`, `Education`, `EffectiveDate`, `Employment`, `Gender`, `Income`, `Location`, `MaritalStatus`, `MonthlyPremium`, `LastClaim`, `PolicyType`, `SalesChannel`, `TotalClaim`, `VehicleClass`, `VehicleSize`) VALUES
('AI49188', 'Nevada', '12887.43165', 'No', 'Premium', 'Bachelor', '2/19/11', 'Employed', 'F', '48767', 'Suburban', 'Married', '108', '18', 'Personal Auto', 'Agent', '566.472247', 'Two-Door Car', 'Medsize'),
('BQ94931', 'Oregon', '7388.178085', 'No', 'Extended', 'College', '2/17/11', 'Employed', 'F', '28812', 'Urban', 'Married', '93', '17', 'Special Auto', 'Branch', '425.527834', 'Four-Door Car', 'Medsize'),
('BU79786', 'Washington', '2763.519279', 'No', 'Basic', 'Bachelor', '2/24/11', 'Employed', 'F', '56274', 'Suburban', 'Married', '69', '32', 'Corporate Auto', 'Agent', '384.811147', 'Two-Door Car', 'Medsize'),
('BW63560', 'Oregon', '7463.139377', 'No', 'Basic', 'Bachelor', '1/17/11', 'Employed', 'F', '24599', 'Rural', 'Married', '64', '12', 'Corporate Auto', 'Branch', '42.920271', 'Four-Door Car', 'Medsize'),
('CF85061', 'Arizona', '7216.100311', 'No', 'Premium', 'Master', '1/18/11', 'Unemployed', 'M', '0', 'Urban', 'Single', '101', '0', 'Corporate Auto', 'Agent', '363.02968', 'Four-Door Car', 'Medsize'),
('DP39365', 'California', '8798.797003', 'No', 'Premium', 'Master', '02/06/2011', 'Employed', 'M', '77026', 'Urban', 'Married', '110', '9', 'Corporate Auto', 'Agent', '472.029737', 'Four-Door Car', 'Medsize'),
('DY87989', 'Oregon', '24127.50402', 'Yes', 'Basic', 'Bachelor', '1/26/11', 'Medical Leave', 'M', '14072', 'Suburban', 'Divorced', '71', '13', 'Corporate Auto', 'Agent', '511.2', 'Four-Door Car', 'Medsize'),
('FV94802', 'Nevada', '2566.867823', 'No', 'Basic', 'High School or Below', '02/06/2011', 'Medical Leave', 'M', '25049', 'Suburban', 'Married', '67', '14', 'Personal Auto', 'Call Center', '454.245098', 'Two-Door Car', 'Medsize'),
('HB64268', 'Washington', '2813.692575', 'No', 'Basic', 'Bachelor', '02/03/2011', 'Employed', 'M', '43836', 'Rural', 'Single', '73', '12', 'Personal Auto', 'Agent', '138.130879', 'Four-Door Car', 'Medsize'),
('IL66569', 'California', '5384.431665', 'No', 'Basic', 'College', '1/18/11', 'Employed', 'M', '83689', 'Urban', 'Single', '70', '21', 'Corporate Auto', 'Call Center', '307.139132', 'Four-Door Car', 'Medsize'),
('OC83172', 'Oregon', '8256.2978', 'Yes', 'Basic', 'Bachelor', '1/25/11', 'Employed', 'F', '62902', 'Rural', 'Married', '69', '14', 'Personal Auto', 'Web', '159.383042', 'Two-Door Car', 'Medsize'),
('OE15005', 'California', '3945.241604', 'No', 'Basic', 'College', '01/05/2011', 'Medical Leave', 'M', '28855', 'Suburban', 'Married', '101', '12', 'Personal Auto', 'Call Center', '647.442031', 'SUV', 'Medsize'),
('QZ44356', 'Arizona', '6979.535903', 'No', 'Extended', 'Bachelor', '1/31/11', 'Unemployed', 'F', '0', 'Suburban', 'Single', '94', '13', 'Personal Auto', 'Agent', '1131.464935', 'Four-Door Car', 'Medsize'),
('SJ95423', 'Arizona', '8819.018934', 'Yes', 'Basic', 'High School or Below', '01/10/2011', 'Employed', 'M', '99845', 'Suburban', 'Married', '110', '23', 'Corporate Auto', 'Branch', '528', 'SUV', 'Medsize'),
('SX51350', 'California', '4738.992022', 'No', 'Basic', 'College', '2/21/11', 'Unemployed', 'M', '0', 'Suburban', 'Single', '67', '23', 'Personal Auto', 'Agent', '482.4', 'Four-Door Car', 'Small'),
('WC83389', 'Oregon', '5710.333115', 'No', 'Basic', 'College', '2/27/11', 'Employed', 'M', '51148', 'Urban', 'Married', '72', '9', 'Personal Auto', 'Branch', '308.981664', 'Four-Door Car', 'Medsize'),
('WW63253', 'California', '7645.861827', 'No', 'Basic', 'Bachelor', '1/20/11', 'Unemployed', 'M', '0', 'Suburban', 'Married', '106', '18', 'Corporate Auto', 'Call Center', '529.881344', 'SUV', 'Medsize'),
('XZ87318', 'Oregon', '5380.898636', 'Yes', 'Basic', 'College', '2/24/11', 'Employed', 'F', '55350', 'Suburban', 'Married', '67', '0', 'Corporate Auto', 'Agent', '321.6', 'Four-Door Car', 'Medsize');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses_tbl`
--

CREATE TABLE `delivery_addresses_tbl` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `tel_no` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_addresses_tbl`
--

INSERT INTO `delivery_addresses_tbl` (`id`, `username`, `address`, `state`, `tel_no`) VALUES
(1, 'spidey', 'WestMinsteer, 3400=100', 'East London', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `food_orders_tbl`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `messages_tbl`
--

CREATE TABLE `messages_tbl` (
  `message_id` int(20) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(20) NOT NULL,
  `red_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages_tbl`
--

INSERT INTO `messages_tbl` (`message_id`, `name`, `email`, `message`, `type`, `red_date`) VALUES
(3, 'jojo', 'jojo@gmail.com', 'was a singer. retired', 'initial_comment', '2018-09-26 10:06:43'),
(5, 'rockefeller', 'rockerfella@gmail.com', 'one of the men who build america during a period when economic growth boomed and infrastracture beca', 'initial_comment', '2018-09-26 10:06:43'),
(6, 'perry', 'parks@gmail.com', 'hdhfabm', 'initial_comment', '2018-09-26 11:20:33'),
(7, 'parker', 'richman@gmail.com', 'might work', 'initial_comment', '2018-09-27 09:03:49'),
(8, 'pepe', 'mmm@gmail.com', 'Empowering the youth, electronic typesetting, remaining essentially unchanged. It was popularised in                     the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,', 'initial_comment', '2018-09-27 09:14:10'),
(9, 'lulu', 'raymond@gmail.com', 'This thing works fine. don\'t know why i\'ve been using php', 'initial_comment', '2018-09-28 10:48:36'),
(10, 'ken', 'mark@facebook.com', 'many words matter here', 'initial_comment', '2018-09-28 11:09:30'),
(11, 'carlos santia', 'santia@gmail.com', 'Peligrosso! Ques qe se? San Carlo buenos dias amigos. los noches pendeho. mariba arue la marale. Chao!', 'initial_comment', '2018-10-01 10:58:45'),
(13, 'pepe', 'pepe@gmail.com', 'rented a limo. hope thats good enough for prom', 'initial_comment', '2018-10-04 11:40:25'),
(14, 'pepe', 'pepe@gmail.com', 'jake might not be showing up. limon will take his place.', 'initial_comment', '2018-10-04 11:40:54'),
(15, 'pepe', 'pepe@gmail.com', 'stranger things happen', 'initial_comment', '2018-10-04 11:41:09'),
(16, 'luluken', 'skiptomylu@gmail.com', 'wokddn nc\r\nnnndnd', 'initial_comment', '2018-10-08 10:45:46'),
(18, 'ken', 'mark@facebook.com', 'Food newsletters, recipes, TV cooking competition recaps, new burgers and pizzas to devour, and old favorites to celebrate. Gordon Ramsay has not one, but two shows on primetime, and Food Network recently launched a brand new channel. Technorati lists 12,489 food blogs — there\'s perhaps more food writing now than ever. It\'s part of the reason some are speculating that food is the next bubble.', 'initial_comment', '2018-10-24 12:22:58'),
(19, 'lulu', 'reymond@gmail.com', 'Amidst all this online eating, shutter clicking, and typing, there are some clear winners, bloggers whose sites everyone else compulsively measures their stats against. Who are the leaders in the field, from a quantitative standpoint? SMOKE HOUSE!!!!', 'initial_comment', '2018-10-24 12:28:14'),
(20, 'perry', 'parks@gmail.com', 'Heavy on original and easy-to-make recipes that showcase this blogger\'s love for cooking, this blog is also about sharing thoughts on new cooking equipment, kitchen tools, and gadgets, as well as food and drink.', 'initial_comment', '2018-10-24 12:36:16'),
(21, 'carlito', 'carlito@gmail.com', 'If there\'s one food my whole family really love, it\'s Hummus.  Hummus is a tasty savory spread/dip made from chickpeas (a.k.a garbanzo beans), tahini, lemon juice, cumin, and, depending on your taste, garlic.  I\'ve been experimenting with making hummus from scratch. My first recipe was Mark Bittman\'s, which appealed because you simply put all the ingredients into a food processor and puree until smooth. I really liked this version, although mine came out rather thick. I added coriander and sumac', 'initial_comment', '2018-10-24 12:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `cost` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `tel_no` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `user_id` int(50) NOT NULL,
  `accNo` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order` varchar(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `unit price` int(50) NOT NULL,
  `Address` text NOT NULL,
  `State` varchar(50) NOT NULL,
  `ext price` int(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`user_id`, `accNo`, `name`, `order`, `quantity`, `unit price`, `Address`, `State`, `ext price`, `date`) VALUES
(2, '296809', 'Carroll PLC', 'Beef stroganoff', 13, 44, 'AI49188', 'Nevada', 578, '27/09/2014 07:13'),
(3, '98022', 'Heidenreich-Bosco', 'pizza', 19, 54, 'BQ94931', 'Oregon', 1019, '29/07/2014 02:10'),
(4, '563905', 'Kerluke, Reilly and Bechtelar', 'burger', 12, 24, 'BU79786', 'Washington', 290, '01/03/2014 10:51'),
(5, '93356', 'Waters-Walker', 'beef stroganoff', 5, 83, 'BW63560', 'Oregon', 413, '17/11/2013 20:41'),
(6, '659366', 'Waelchi-Fahey', 'lasagna', 18, 100, 'CF85061', 'Arizona', 1794, '03/01/2014 08:14'),
(7, '563905', 'Kerluke, Reilly and Bechtelar', 'lasagna', 17, 53, 'DP39365', 'California', 898, '04/12/2013 02:07'),
(8, '995267', 'Cole-Eichmann', 'chowder', 18, 15, 'DY87989', 'Oregon', 275, '09/04/2014 16:15'),
(9, '524021', 'Hegmann and Sons', 'skewers', 7, 79, 'FV94802', 'Nevada', 551, '18/06/2014 19:25'),
(10, '929400', 'Senger, Upton and Breitenberg', 'skewers', 17, 38, 'HB64268', 'Washington', 649, '10/02/2014 05:55'),
(11, '563905', 'Kerluke, Reilly and Bechtelar', 'old wisconsin', 12, 27, 'IL66569', 'California', 324, '20/05/2014 00:21'),
(12, '995267', 'Cole-Eichmann', 'old aztec', 19, 60, 'OC83172', 'Oregon', 1144, '10/03/2014 06:23'),
(13, '524021', 'Hegmann and Sons', 'Belt', 6, 13, 'OE15005', 'California', 79, '03/11/2013 18:38'),
(14, '758133', 'Kihn, McClure and Denesik', 'Shoes', 4, 60, 'QZ44356', 'Arizona', 239, '11/01/2014 21:48'),
(15, '555594', 'Ernser, Cruickshank and Lind', 'chiken', 12, 97, 'SJ95423', 'Arizona', 1167, '19/09/2014 13:20'),
(16, '201259', 'Koelpin PLC', 'pancakes', 9, 81, 'SX51350', 'California', 733, '12/08/2014 08:05'),
(17, '93356', 'Waters-Walker', 'chicken', 18, 53, 'XZ87318', 'Oregon', 960, '15/07/2014 23:21'),
(18, '563905', 'Kerluke, Reilly and Bechtelar', 'bourbon', 4, 36, 'WC83389', 'Oregon', 142, '05/10/2014 23:38'),
(19, '201259', 'Koelpin PLC', 'roasted ham', 17, 98, 'WW63253', 'California', 1670, '26/01/2014 01:52'),
(20, '758133', 'Kihn, McClure and Denesik', 'bourbon', 15, 70, 'DY87989', 'Oregon', 1043, '13/11/2013 21:38'),
(21, '296809', 'Carroll PLC', 'macaroni', 12, 80, 'FV94802', 'Nevada', 961, '24/05/2014 16:03'),
(22, '750461', 'Volkman, Goyette and Lemke', 'roasted cauliflower', 13, 81, 'HB64268', 'Washington', 1055, '08/01/2014 02:45'),
(23, '929400', 'Senger, Upton and Breitenberg', 'chocolate cake', 2, 48, 'IL66569', 'California', 96, '28/04/2014 07:01'),
(24, '563905', 'Kerluke, Reilly and Bechtelar', 'dip and chips', 1, 55, 'SX51350', 'Arizona', 55, '09/08/2014 11:22'),
(25, '734922', 'Berge LLC', 'cheese cake', 4, 58, 'OC83172', 'Oregon', 231, '04/11/2013 09:48'),
(26, '296809', 'Carroll PLC', 'veggie roll', 14, 48, 'BU79786', 'Washington', 668, '12/01/2014 00:28'),
(27, '304860', 'Huel-Haag', 'cheese cake', 2, 41, 'BW63560', 'Oregon', 83, '23/09/2014 02:36');

-- --------------------------------------------------------

--
-- Table structure for table `register_tbl`
--

CREATE TABLE `register_tbl` (
  `id` int(20) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` text NOT NULL,
  `registration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register_tbl`
--

INSERT INTO `register_tbl` (`id`, `firstname`, `lastname`, `username`, `password`, `status`, `registration_time`) VALUES
(1, 'peter', 'parker', 'spidey', 'spiderman', 'user', '2018-09-27 10:24:48'),
(2, 'curt', 'leane', 'curtis', 'warp', 'user', '2018-09-28 10:10:29'),
(3, 'lulu', 'moana', 'lumoana', 'moanasucks', 'user', '2018-09-28 10:49:40'),
(4, 'lulu', 'kennedy', 'luluken', 'skiptomylu', 'user', '2018-10-08 10:44:32'),
(5, 'chris', 'ronaldo', 'cr7', 'fifachampion', 'user', '2018-10-09 19:15:07'),
(6, 'admin', 'admin', 'admin', 'adminpass', 'admin', '2018-10-13 15:52:03'),
(7, 'Mike', 'Dodge', 'getOutOfDodge', 'getOutOfDodge', 'user', '2018-10-25 09:08:01'),
(8, 'alehandro', 'penya', 'sicario', 'escabor\'sSicario', 'user', '2018-10-25 09:12:02'),
(9, 'john', 'wick', 'babayega', 'mobFoundation', 'user', '2018-10-25 09:19:35'),
(10, 'ryan', 'wick', 'sonOfWick', 'mobFoundation', 'user', '2018-10-25 09:31:03'),
(11, 'Leanne', 'Conner', 'O\'connor', 'retiredAndDangerous', 'user', '2018-10-25 09:32:48'),
(12, 'john', 'al', 'alfonso', 'retired', 'user', '2018-10-25 09:34:01'),
(13, 'curt', 'wilson', 'bigWillHunting', 'bigWillHunting123', 'user', '2018-10-25 09:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart_tbl`
--

CREATE TABLE `shopping_cart_tbl` (
  `#` int(10) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `item_id` int(20) NOT NULL,
  `item` varchar(50) NOT NULL,
  `cost` float NOT NULL,
  `image` varchar(50) NOT NULL,
  `quantity` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopping_cart_tbl`
--

INSERT INTO `shopping_cart_tbl` (`#`, `customer_name`, `item_id`, `item`, `cost`, `image`, `quantity`) VALUES
(3, 'spidey', 1004, 'Gourmet dip with roasted wedges', 11.25, 'dipAndChips.jpg', 1),
(5, 'spidey', 1001, 'Roasted Boneless Ham', 19.99, 'roastedHam.jpg', 1),
(6, 'curtis', 1001, 'Roasted Boneless Ham', 19.99, 'roastedHam.jpg', 1),
(8, 'spidey', 1008, 'Gourmet Style Pizza', 11.99, 'pizza.jpg', 1),
(9, 'spidey', 1015, 'Seasoned Oven Baked Turkey', 35.66, 'turkey.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allfood_tbl`
--
ALTER TABLE `allfood_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorized_users_tbl`
--
ALTER TABLE `authorized_users_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `delivery_addresses_tbl`
--
ALTER TABLE `delivery_addresses_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_tbl`
--
ALTER TABLE `messages_tbl`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `register_tbl`
--
ALTER TABLE `register_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `shopping_cart_tbl`
--
ALTER TABLE `shopping_cart_tbl`
  ADD PRIMARY KEY (`#`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allfood_tbl`
--
ALTER TABLE `allfood_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `authorized_users_tbl`
--
ALTER TABLE `authorized_users_tbl`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_addresses_tbl`
--
ALTER TABLE `delivery_addresses_tbl`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages_tbl`
--
ALTER TABLE `messages_tbl`
  MODIFY `message_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `register_tbl`
--
ALTER TABLE `register_tbl`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shopping_cart_tbl`
--
ALTER TABLE `shopping_cart_tbl`
  MODIFY `#` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
