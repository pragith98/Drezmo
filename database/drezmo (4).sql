-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 20, 2021 at 10:04 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drezmo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_user_id` int NOT NULL,
  `cart_product_id` varchar(20) NOT NULL,
  `cart_product_size` varchar(15) NOT NULL,
  `cart_quentity` int NOT NULL,
  `cart_total_price` double NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_user_id` (`cart_user_id`),
  KEY `cart_product_id` (`cart_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_product_id` varchar(20) NOT NULL,
  `feedback_user_id` int NOT NULL,
  `feedback_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feedback_comment` varchar(200) NOT NULL,
  `feedback_ratings` int NOT NULL,
  PRIMARY KEY (`feedback_product_id`,`feedback_user_id`),
  KEY `feedback_ibfk_2` (`feedback_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_product_id`, `feedback_user_id`, `feedback_date`, `feedback_comment`, `feedback_ratings`) VALUES
('01', 104, '2021-07-06 15:28:56', 'meka hodai', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notifi_id` int NOT NULL AUTO_INCREMENT,
  `notifi_cust_id` int NOT NULL,
  `notifi_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notifi_notice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'You Have New Order',
  `notifi_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'new',
  PRIMARY KEY (`notifi_id`),
  KEY `notification_ibfk_1` (`notifi_cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notifi_id`, `notifi_cust_id`, `notifi_date`, `notifi_notice`, `notifi_status`) VALUES
(35, 104, '2021-07-02 09:57:10', 'You Have New Order', 'new'),
(36, 104, '2021-07-02 10:06:15', 'You Have New Order', 'new'),
(37, 104, '2021-07-02 11:15:40', 'You Have New Order', 'new'),
(38, 104, '2021-07-02 11:44:19', 'You Have New Order', 'new'),
(39, 104, '2021-07-07 07:52:55', 'You Have New Order', 'new'),
(40, 104, '2021-07-08 03:18:40', 'You Have New Order', 'new'),
(41, 104, '2021-07-08 03:18:42', 'You Have New Order', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_user_id` int NOT NULL,
  `order_shipping_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_shipping_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_shipping_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_product_id` varchar(20) NOT NULL,
  `order_product_size` varchar(10) NOT NULL,
  `order_quentity` int NOT NULL,
  `order_total_price` double NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  KEY `order_user_id` (`order_user_id`),
  KEY `order_product_id` (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_user_id`, `order_shipping_name`, `order_shipping_address`, `order_shipping_contact`, `order_product_id`, `order_product_size`, `order_quentity`, `order_total_price`, `order_date`, `order_status`) VALUES
(59, 104, 'pragith lakshan', '342, main road, kaluthara, , ', 'afdasfas@afsdf.com, 1242323253', '01', 'small', 24, 4800, '2021-07-02 09:57:09', 'shipped'),
(60, 104, 'pragith lakshan', '342, main road, kaluthara, , ', 'afdasfas@afsdf.com, 1242323253', '01', 'medium', 5, 1000, '2021-07-02 10:06:15', 'received'),
(61, 104, 'pragith lakshn', '342, main road, kaluthara, , ', 'afdasfas@afsdf.com, 1242323253', '01', 'extralarge', 3, 600, '2021-07-02 11:15:40', 'pending'),
(62, 104, 'dasdsad dasdasda', 'sfsdfsdf, main road, kaluthara, sdfdsf, asdad', 'afdasfasdsfsdf, 12dfd', '01', 'small', 3, 600, '2021-07-02 11:44:19', 'canceled'),
(63, 104, 'pragith lakshn', '342, main road, kurunagala, , ', 'afdasfas@afsdf.com, 1242323253', '01', 'small', 2, 400, '2021-07-07 07:52:55', 'canceled'),
(64, 104, 'pragith lakshn', '342, main road, kurunagala, , ', 'afdasfas@afsdf.com, 1242323253', '01', 'small', 3, 600, '2021-07-08 03:18:40', 'pending'),
(65, 104, 'pragith lakshn', '342, main road, kurunagala, , ', 'afdasfas@afsdf.com, 1242323253', '01', 'small', 1, 200, '2021-07-08 03:18:42', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` varchar(20) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_brand` varchar(50) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_color` varchar(10) NOT NULL,
  `product_regular_price` double NOT NULL,
  `product_sale_price` double NOT NULL,
  `product_description` varchar(800) NOT NULL,
  `product_introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_image` varchar(500) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_brand`, `product_category`, `product_color`, `product_regular_price`, `product_sale_price`, `product_description`, `product_introduction`, `product_image`) VALUES
('01', 'Cloth Jacket - Universal Thread', 'jezza', 'ladies', 'white', 400, 200, 'Universal Thread cloth jacket makes a cute and comfy layer for transitional seasons', 'For a lovely layer on chilly mornings or evenings, this Cloth Jacket from Universal Thread™ enhances your outfit while providing a lightweight and soft layer of added warmth. Made from 100% cotton with a cotton poplin lining, this cute cloth jacket features a snap-front closure for a stylish shape whether you wear it open or closed, and boasts gathered, smocked detail at the cuffs and hem to create a subtle amount of billowy shape. With front pockets to stash small essentials and a stylish collar, it\'s a great item to layer over T-shirts and jeans or even casual shift dresses.\r\nIf the item details above aren’t accurate or complete, we want to know about it. Report incorrect product info.', 'product-6.jpg'),
('22', 'Smocked Dress - A New Day', 'avirate', 'ladies', 'purple', 3200, 200, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', 'product-2.jpg'),
('24', 'Women\'s Ruffle Dress', 'buddhibatiks', 'teenagers', 'green', 2400, 700, 'Tailored in breathable fabric to flow around your figure', 'An elevated take on playful prairie looks, our Short-Sleeve Ruffle Detailed Maxi - Who What Wear™ uses ruffles in asymmetrical ways to redefine the trend. A one-sided ruffle accent trims the front-button placket, so you can button it up to bloom around your jawline, or unbutton it in a sculptural accent; ruffle-trimmed sleeves and a deep hemline echo the feminine-yet-urban vibe.', 'product-3.jpg'),
('38', 'G Dress', 'aditi', 'teenagers', 'blue', 3200, 200, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', 'product-2.jpg'),
('40', 'white shoes', 'buddhibatiks', 'teenagers', 'yellow', 2400, 700, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', 'product-3.jpg'),
('50', 'Smocked Dress ', 'kellyfelder', 'kids', 'red', 800, 500, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', '5.jpg'),
('60', 'Cloth Jacket - Universal Thread', 'jezza', 'ladies', 'white', 400, 200, 'Universal Thread cloth jacket makes a cute and comfy layer for transitional seasons', 'For a lovely layer on chilly mornings or evenings, this Cloth Jacket from Universal Thread™ enhances your outfit while providing a lightweight and soft layer of added warmth. Made from 100% cotton with a cotton poplin lining, this cute cloth jacket features a snap-front closure for a stylish shape whether you wear it open or closed, and boasts gathered, smocked detail at the cuffs and hem to create a subtle amount of billowy shape. With front pockets to stash small essentials and a stylish collar, it\'s a great item to layer over T-shirts and jeans or even casual shift dresses.\r\nIf the item details above aren’t accurate or complete, we want to know about it. Report incorrect product info.', 'product-6.jpg'),
('61', 'Smocked Dress - A New Day', 'avirate', 'ladies', 'purple', 3200, 200, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', 'product-2.jpg'),
('62', 'Women\'s Ruffle Dress', 'buddhibatiks', 'teenagers', 'green', 2400, 700, 'Tailored in breathable fabric to flow around your figure', 'An elevated take on playful prairie looks, our Short-Sleeve Ruffle Detailed Maxi - Who What Wear™ uses ruffles in asymmetrical ways to redefine the trend. A one-sided ruffle accent trims the front-button placket, so you can button it up to bloom around your jawline, or unbutton it in a sculptural accent; ruffle-trimmed sleeves and a deep hemline echo the feminine-yet-urban vibe.', 'product-3.jpg'),
('63', 'G Dress', 'aditi', 'teenagers', 'blue', 3200, 200, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', 'product-2.jpg'),
('64', 'white shoes', 'buddhibatiks', 'teenagers', 'yellow', 2400, 700, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', 'product-3.jpg'),
('65', 'Smocked Dress ', 'kellyfelder', 'kids', 'red', 800, 500, 'Lightweight fabric keeps you in breathable comfort', 'This Floral Print Sleeveless Smocked Dress from A New Day™ makes a stylish addition to your closet. This sleeveless dress falls to a midi length and showcases a vibrant floral print, making it easy to dress up or down for a range of styling options . It features a smocked upper with ruffle cap sleeves to add some volume and flared dimension to your warm-weather looks, while a back tie closure makes for easy wear. Simply pair this midi dress with sandals and a sling purse to go about your day in polished yet carefree style.', '5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `stock_product_id` varchar(20) NOT NULL,
  `stock_product_qty_small` int NOT NULL DEFAULT '0',
  `stock_product_qty_medium` int NOT NULL DEFAULT '0',
  `stock_product_qty_large` int NOT NULL DEFAULT '0',
  `stock_product_qty_extralarge` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_product_id`, `stock_product_qty_small`, `stock_product_qty_medium`, `stock_product_qty_large`, `stock_product_qty_extralarge`) VALUES
('01', 52, 50, 100, 97),
('22', 32, 50, 100, 97),
('24', 32, 50, 100, 97),
('38', 32, 50, 100, 97),
('40', 32, 50, 100, 97),
('50', 32, 50, 100, 97),
('60', 32, 50, 100, 97),
('61', 32, 50, 100, 97),
('62', 32, 50, 100, 97),
('63', 32, 50, 100, 97),
('64', 32, 50, 100, 97),
('65', 32, 50, 100, 97);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_first_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_nic` char(10) NOT NULL,
  `user_country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_address_no` varchar(5) NOT NULL,
  `user_address_street` varchar(30) NOT NULL,
  `user_address_town` varchar(30) NOT NULL,
  `user_tp` char(10) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_verification_link` varchar(300) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_nic` (`user_nic`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_type`, `user_first_name`, `user_last_name`, `user_name`, `user_password`, `user_nic`, `user_country`, `user_address_no`, `user_address_street`, `user_address_town`, `user_tp`, `user_email`, `user_verification_link`) VALUES
(71, 'admin', 'rohitha', 'lakashan', 'admin', '$2y$10$r0NLf0hDo9wnK//kJtO4V.pPSz.nIRsL23wfDD4NvjzOqJTB9dMIq', '343423343', 'sri lanka', 'p333,', 'Nalanda watta', 'aluviharwwww', '0715408875', 'la3xp@hotmail.com', ''),
(103, 'staff', 'pragith', 'lakashan', 'staff', '$2y$10$5L1uN.i1WMcZ2Bw2by4oD.aMwBmds9pFINxXBYQAoaLAT8/0B9nuO', '3434233d', 'sri lanka', 'p333,', 'Nalanda watta', 'Matale', '00000000', 'la3xp@hotdl.com', ''),
(104, 'customer', 'pragith', 'lakshn', 'pragith', '$2y$10$4htAE1s44ZQg1PmnR4qK2u0OIdNGw2gF3GXRdIFdVjdwr80jRd11y', '1234', '', '342', 'main road', 'kurunagala', '1242323253', 'afdasfas@afsdf.com', ''),
(107, 'customer', 'kasun', 'kalhara', 'kasun', '$2y$10$KFwGrrx4wEXqwWO04N5cOeVYdu6bi1aGT9nKFhlZ5cEzwqRFV/Iqm', '34342333', 'Sri Lanka', 'p333,', 'Nalanda', 'Matale', '07133871', 'adfsfsf', ''),
(109, 'staff', 'kamal', 'addara archchi', 'kamal', '$2y$10$6JMoj2ns5wZ52uGbhiWcZu6URfQBTATURTUarKU5IbTHCumFj9Z/G', '3434233333', '', 'p333,', 'Nalanda', 'Matale', '071540333', 'adfsdfsdfsdfdf', ''),
(111, 'admin', 'asfsdf', 'sfdsf', 'dsfd', '$2y$10$SduMMbG158m/KJ6wMGEirOtntSI0D4ZzdLvUfv1ff/d/3GlGUTaeG', 'err343', 'sdfsdf', 'dfsdf', 'sdfdsf', 'sdfsd', '3434', 'dsfdsf', ''),
(123, 'customer', 'Pragith', 'Thilakarathna', 'user', '$2y$10$URr8Rb0ZQuYSynLgPNiAsOAFEx4Gild4uOpGVA8Ha8Zt3Zz4rq7wy', '1212121212', 'Sri Lanka', 'p333,', 'Nalanda', 'Matale', '0715408871', 'lakshanxp@hotmail.com', ''),
(124, 'customer', 'adfsdfsdf', 'adfsadfsdf', 'adfsdfsf', '$2y$10$mgEwMlfINim6120iLEUp5uzjzTmEQPb7TVsJlqku9zXC/b8ITi3t6', '2222222222', 'adfssdaf', 'fsadf', 'adfsdf', 'adfsdf', '3333333333', 'lasfdfxp@hotmail.com', ''),
(125, 'customer', 'dfssaf', 'hjgh', 'fghf', '$2y$10$aUmQzfC4RxIYQavnPHIBnOR9qUqvPpiiV0l3r5cvTrjR763A4nAEu', '6666666666', 'fghgf', 'fhfgh', 'fghfgh', 'fghfgh', '6666666666', 'lakreanxp@hoertil.com', ''),
(126, 'customer', 'Pragith', 'Thilakarathna', 'amal', '$2y$10$VzuTIIzgqJdPWMmqgvT9XOfTyrEQRZswid7t.DPh5gni6kBYmDcaW', '4444444444', 'Sri Lanka', 'p333,', 'Nalanda', 'Matale', '0715408871', 'adfdsfsdf@d.com', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`feedback_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`feedback_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`notifi_cust_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`stock_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
