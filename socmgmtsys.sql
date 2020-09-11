-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 01, 2018 at 09:02 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socmgmtsys`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

DROP TABLE IF EXISTS `admin_details`;
CREATE TABLE IF NOT EXISTS `admin_details` (
  `admin_code` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) DEFAULT NULL,
  `admin_email` varchar(30) DEFAULT NULL,
  `admin_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_code`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Admin User', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `maintain_details`
--

DROP TABLE IF EXISTS `maintain_details`;
CREATE TABLE IF NOT EXISTS `maintain_details` (
  `md_code` int(11) NOT NULL AUTO_INCREMENT,
  `md_name` varchar(40) DEFAULT NULL,
  `md_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`md_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintain_details`
--

INSERT INTO `maintain_details` (`md_code`, `md_name`, `md_cost`) VALUES
(1, 'Society Maintenance', '3000.00'),
(2, 'Two Wheeler Parking', '30.00'),
(3, 'Four Wheeler Parking', '60.00');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_collection`
--

DROP TABLE IF EXISTS `monthly_collection`;
CREATE TABLE IF NOT EXISTS `monthly_collection` (
  `mc_code` int(11) NOT NULL AUTO_INCREMENT,
  `sm_code` int(11) DEFAULT NULL,
  `collect_date` date DEFAULT NULL,
  `sm_month` varchar(10) DEFAULT NULL,
  `sm_year` varchar(4) DEFAULT NULL,
  `mc_total` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`mc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monthly_collection`
--

INSERT INTO `monthly_collection` (`mc_code`, `sm_code`, `collect_date`, `sm_month`, `sm_year`, `mc_total`) VALUES
(5, 10, '2018-04-01', 'April', '2018', '3150.00');

-- --------------------------------------------------------

--
-- Table structure for table `other_collection`
--

DROP TABLE IF EXISTS `other_collection`;
CREATE TABLE IF NOT EXISTS `other_collection` (
  `oc_code` int(11) NOT NULL AUTO_INCREMENT,
  `oct_code` int(11) DEFAULT NULL,
  `sm_code` int(11) DEFAULT NULL,
  `oc_date` varchar(10) DEFAULT NULL,
  `oc_month` varchar(10) DEFAULT NULL,
  `oc_year` varchar(4) DEFAULT NULL,
  `oc_amount` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`oc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other_collection`
--

INSERT INTO `other_collection` (`oc_code`, `oct_code`, `sm_code`, `oc_date`, `oc_month`, `oc_year`, `oc_amount`) VALUES
(1, 1, 8, '2015-01-12', 'January', '2016', '1500.00'),
(2, 1, 5, '2018-05-12', 'June', '2014', '5000.00'),
(3, 2, 3, '2018-02-10', 'May', '2018', '3000.00'),
(4, 1, 10, '2010-10-10', 'November', '2010', '5001.00'),
(5, 1, 4, '2010-02-10', 'December', '2010', '5001.00');

-- --------------------------------------------------------

--
-- Table structure for table `other_collect_type`
--

DROP TABLE IF EXISTS `other_collect_type`;
CREATE TABLE IF NOT EXISTS `other_collect_type` (
  `oct_code` int(11) NOT NULL AUTO_INCREMENT,
  `oct_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`oct_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other_collect_type`
--

INSERT INTO `other_collect_type` (`oct_code`, `oct_name`) VALUES
(1, 'Ganesh Chaturthi'),
(2, 'Navratri');

-- --------------------------------------------------------

--
-- Table structure for table `soc_committee`
--

DROP TABLE IF EXISTS `soc_committee`;
CREATE TABLE IF NOT EXISTS `soc_committee` (
  `sc_code` int(11) NOT NULL AUTO_INCREMENT,
  `sc_dof` date DEFAULT NULL,
  `soc_chairman` int(11) DEFAULT NULL,
  `soc_secretary` int(11) DEFAULT NULL,
  `soc_treasurer` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_committee`
--

INSERT INTO `soc_committee` (`sc_code`, `sc_dof`, `soc_chairman`, `soc_secretary`, `soc_treasurer`) VALUES
(1, '2018-03-27', 2, 6, 7),
(2, '2017-03-31', 10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `soc_details`
--

DROP TABLE IF EXISTS `soc_details`;
CREATE TABLE IF NOT EXISTS `soc_details` (
  `soc_code` int(11) NOT NULL AUTO_INCREMENT,
  `soc_name` varchar(40) DEFAULT NULL,
  `soc_address` varchar(200) DEFAULT NULL,
  `soc_email` varchar(40) DEFAULT NULL,
  `soc_contact` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`soc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_details`
--

INSERT INTO `soc_details` (`soc_code`, `soc_name`, `soc_address`, `soc_email`, `soc_contact`) VALUES
(1, 'Green Avenue Society', 'Green Avenue Co-Op Housing Society,\r\nSM Road, Mazgaon, Mumbai-400010', 'greenavenue@gmail.com', '3423456765');

-- --------------------------------------------------------

--
-- Table structure for table `soc_members`
--

DROP TABLE IF EXISTS `soc_members`;
CREATE TABLE IF NOT EXISTS `soc_members` (
  `sm_code` int(11) NOT NULL AUTO_INCREMENT,
  `sm_name` varchar(40) DEFAULT NULL,
  `room_no` varchar(10) DEFAULT NULL,
  `family_members` varchar(5) DEFAULT NULL,
  `sm_contact` varchar(10) DEFAULT NULL,
  `sm_email` varchar(30) DEFAULT NULL,
  `four_wheelers` varchar(5) DEFAULT NULL,
  `two_wheelers` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`sm_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_members`
--

INSERT INTO `soc_members` (`sm_code`, `sm_name`, `room_no`, `family_members`, `sm_contact`, `sm_email`, `four_wheelers`, `two_wheelers`) VALUES
(1, 'Ajay Makan', '101', '5', '6545454545', 'ajay@gmail.com', '1', '1'),
(2, 'Amit Saxena', '101', '4', '3454545454', 'amit@gmail.com', '0', '1'),
(3, 'Arum Govil', '103', '6', '6767676767', 'arun@gmail.com', '0', '0'),
(4, 'Biresh', '201', '4', '4545454545', 'biresh@gmail.com', '1', '0'),
(5, 'Babita', '202', '3', '6756453423', 'babita@gmail.com', '1', '2'),
(6, 'Minakshi ', '203', '5', '7867564534', 'minakshi@gmail.com', '1', '1'),
(7, 'Chetan', '301', '6', '8978675645', 'chetan@gmail.com', '0', '1'),
(8, 'Dinesh', '302', '3', '3423432342', 'chetan@gmail.com', '1', '0'),
(9, 'Dileep', '303', '4', '3456453423', 'dileep@gmail.com', '1', '2'),
(10, 'Siddhant Fulzele', '2/10', '4', '9967589229', 'siddfulzele@gmail.com', '1', '3');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
