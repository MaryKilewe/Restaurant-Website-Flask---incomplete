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

-- --------------------------------------------------------

--
-- Table structure for table `meals_tbl`
--
CREATE TABLE `delivery_addresses_tbl` (
  `id` int(10) NOT NULL,
  `cudtomer_id` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `tel no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

 @app.route('/cart/add/<item_id>', methods=['POST', 'GET'])
 def sadd_to_cart(item_id):
    # do a cross join of the three tables maybe to retrieve the necessarinformation
    if 'userkey' in session:
        con = pymysql.connect("localhost", "root", "", "sampledb")
        cursor_full_join = con.cursor()
        sql="INSERT INTO shopping_cart_tbl VALUES (username, address, item, cost) \
            SELECT user.username, addr.address, food.item_, food.cost \
            FROM register_tbl AS user FULL JOIN delivery_addresses_tbl AS addr FULL JOIN allfood_tbl AS food \
            ON user.username = addr.username AND food.id=%s"


        cursor_full_join.execute(sql, item_id)

        return render_template('homepage.html')

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')
