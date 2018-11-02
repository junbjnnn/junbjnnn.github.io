-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2018 at 12:40 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FFSE1702A`
--

-- --------------------------------------------------------

--
-- Table structure for table `chuc_danh`
--

CREATE TABLE IF NOT EXISTS `chuc_danh` (
  `ma_chuc_danh` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_chuc_danh` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chuc_danh`
--

INSERT INTO `chuc_danh` (`ma_chuc_danh`, `ten_chuc_danh`) VALUES
('GD', 'Giám đốc'),
('NV', 'Nhân viên'),
('PGD', 'Phó Giám đốc'),
('PP', 'Phó phòng'),
('TP', 'Trưởng phòng');

-- --------------------------------------------------------

--
-- Table structure for table `co_so_du_lieu`
--

CREATE TABLE IF NOT EXISTS `co_so_du_lieu` (
  `ma_database` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_database` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `co_so_du_lieu`
--

INSERT INTO `co_so_du_lieu` (`ma_database`, `ten_database`, `is_delete`) VALUES
('1', 'Ordacle', 0),
('2', 'Mongo DB', 0),
('3', 'Mysql', 0),
('4', 'Sql', 0),
('DB06', 'Ordacl', 1);

-- --------------------------------------------------------

--
-- Table structure for table `database_du_an`
--

CREATE TABLE IF NOT EXISTS `database_du_an` (
  `ma_database` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ma_du_an` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `database_du_an`
--

INSERT INTO `database_du_an` (`ma_database`, `ma_du_an`) VALUES
('2', 1),
('2', 2),
('2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `doi_tac`
--

CREATE TABLE IF NOT EXISTS `doi_tac` (
  `ma_doi_tac` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_doi_tac` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dia_chi` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doi_tac`
--

INSERT INTO `doi_tac` (`ma_doi_tac`, `ten_doi_tac`, `dia_chi`, `phone_number`, `email`, `is_delete`) VALUES
('DT01', 'LongLTP', 'Quang Nam', 56789, 'long020299@gmail.com', 0),
('DT03', 'Sang', '1234', 234511123, 'long0202@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doi_tac_du_an`
--

CREATE TABLE IF NOT EXISTS `doi_tac_du_an` (
  `ma_du_an` int(11) NOT NULL,
  `ma_doi_tac` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doi_tac_du_an`
--

INSERT INTO `doi_tac_du_an` (`ma_du_an`, `ma_doi_tac`) VALUES
(1, 'DT01'),
(2, 'DT01'),
(3, 'DT01');

-- --------------------------------------------------------

--
-- Table structure for table `du_an`
--

CREATE TABLE IF NOT EXISTS `du_an` (
  `ma_du_an` int(11) NOT NULL,
  `ten_du_an` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_khach_hang` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mo_ta_du_an` text COLLATE utf8_unicode_ci,
  `ma_tinh_trang` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_nghiep_vu` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `update_link` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `du_an`
--

INSERT INTO `du_an` (`ma_du_an`, `ten_du_an`, `ma_khach_hang`, `mo_ta_du_an`, `ma_tinh_trang`, `ma_nghiep_vu`, `start_date`, `end_date`, `is_delete`, `update_link`) VALUES
(1, 'website bán hàng', 'KH001', 'web site ban hang', 'TT01', '1', '2018-08-17', '2018-08-18', 0, 0),
(2, 'website doanh nghiệp', 'KH001', 'website doanh nghiệp work-follow', 'TT02', '1', '2018-08-17', '2018-08-17', 0, 0),
(3, 'website bán người', 'KH001', 'Bán người online', 'TT01', '1', '2018-08-19', '2018-08-19', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `framework`
--

CREATE TABLE IF NOT EXISTS `framework` (
  `ma_framework` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_framework` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `framework`
--

INSERT INTO `framework` (`ma_framework`, `ten_framework`, `is_delete`) VALUES
('6', 'a', 0),
('FR01', 'Spring', 0),
('FR02', 'Code Igniter', 0),
('FR03', 'JSF', 0),
('FR04', 'ASP.net', 0),
('FR05', 'Express', 0);

-- --------------------------------------------------------

--
-- Table structure for table `framework_du_an`
--

CREATE TABLE IF NOT EXISTS `framework_du_an` (
  `ma_framework` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ma_du_an` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `framework_du_an`
--

INSERT INTO `framework_du_an` (`ma_framework`, `ma_du_an`) VALUES
('FR01', 1),
('FR01', 2),
('FR01', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hop_dong`
--

CREATE TABLE IF NOT EXISTS `hop_dong` (
  `ma_hop_dong` int(5) unsigned zerofill NOT NULL,
  `ma_nhan_vien` int(5) unsigned zerofill NOT NULL,
  `ma_loai_hop_dong` int(5) NOT NULL,
  `luong_thang_13` int(1) NOT NULL,
  `so_ngay_phep` int(2) NOT NULL,
  `ngay_ky_ket` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `trang_thai` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hop_dong`
--

INSERT INTO `hop_dong` (`ma_hop_dong`, `ma_nhan_vien`, `ma_loai_hop_dong`, `luong_thang_13`, `so_ngay_phep`, `ngay_ky_ket`, `ngay_ket_thuc`, `trang_thai`) VALUES
(00001, 00001, 2, 1, 12, '2018-01-12', '2028-01-12', 1),
(00002, 00002, 2, 1, 12, '2018-01-26', '2019-01-26', 1),
(00003, 00003, 2, 1, 12, '2018-05-11', '2019-05-11', 2),
(00004, 00004, 2, 1, 12, '2018-07-05', '2019-07-05', 1),
(00005, 00005, 2, 1, 12, '2018-05-06', '2019-05-06', 2),
(00006, 00006, 2, 1, 12, '2018-08-29', '2019-08-29', 2),
(00007, 00007, 2, 1, 12, '2018-02-09', '2019-02-09', 1),
(00008, 00008, 2, 1, 12, '2018-07-08', '2019-07-08', 2),
(00009, 00009, 2, 1, 12, '2018-04-15', '2019-04-15', 1),
(00010, 00010, 2, 1, 12, '2018-05-09', '2019-05-09', 2),
(00011, 00011, 2, 1, 12, '2018-01-24', '2019-01-24', 2),
(00012, 00012, 2, 1, 12, '2018-04-07', '2019-04-07', 2),
(00013, 00013, 2, 1, 12, '2018-05-19', '2019-05-19', 2),
(00014, 00014, 2, 1, 12, '2018-08-11', '2019-08-11', 2),
(00015, 00015, 2, 1, 12, '2018-06-07', '2019-06-07', 1),
(00016, 00016, 2, 1, 12, '2018-04-05', '2019-04-05', 1),
(00017, 00017, 2, 1, 12, '2018-02-26', '2019-02-26', 1),
(00018, 00018, 2, 1, 12, '2018-03-04', '2019-03-04', 2),
(00019, 00019, 2, 1, 12, '2018-05-26', '2019-05-26', 2),
(00020, 00020, 2, 1, 12, '2018-07-05', '2019-07-05', 1),
(00021, 00021, 2, 1, 12, '2018-05-21', '2019-05-21', 2),
(00022, 00022, 2, 1, 12, '2018-06-29', '2019-06-29', 2),
(00023, 00023, 2, 1, 12, '2018-03-18', '2019-03-18', 2),
(00024, 00024, 2, 1, 12, '2018-06-05', '2019-06-05', 2),
(00025, 00025, 2, 1, 12, '2018-08-15', '2019-08-15', 2),
(00026, 00026, 2, 1, 12, '2018-07-27', '2019-07-27', 2),
(00027, 00027, 2, 1, 12, '2018-02-22', '2019-02-22', 1),
(00028, 00028, 2, 1, 12, '2018-05-13', '2019-05-13', 1),
(00029, 00029, 2, 1, 12, '2018-07-22', '2019-07-22', 2),
(00030, 00030, 2, 1, 12, '2018-05-18', '2019-05-18', 2),
(00031, 00031, 2, 1, 12, '2018-02-09', '2019-02-09', 2),
(00032, 00032, 2, 1, 12, '2018-03-29', '2019-03-29', 1),
(00033, 00033, 2, 1, 12, '2018-02-02', '2019-02-02', 2),
(00034, 00034, 2, 1, 12, '2018-08-23', '2019-08-23', 2),
(00035, 00035, 2, 1, 12, '2018-07-27', '2019-07-27', 1),
(00036, 00036, 2, 1, 12, '2018-07-15', '2019-07-15', 2),
(00037, 00037, 2, 1, 12, '2018-05-16', '2019-05-16', 2),
(00038, 00038, 2, 1, 12, '2018-03-13', '2019-03-13', 2),
(00039, 00039, 2, 1, 12, '2018-05-26', '2019-05-26', 1),
(00040, 00040, 2, 1, 12, '2018-02-08', '2019-02-08', 2),
(00041, 00041, 2, 1, 12, '2018-08-24', '2019-08-24', 2),
(00042, 00042, 2, 1, 12, '2018-08-12', '2019-08-12', 1),
(00043, 00043, 2, 1, 12, '2018-06-21', '2019-06-21', 1),
(00044, 00044, 2, 1, 12, '2018-02-17', '2019-02-17', 1),
(00045, 00045, 2, 1, 12, '2018-04-12', '2019-04-12', 2),
(00046, 00046, 2, 1, 12, '2018-01-09', '2019-01-09', 2),
(00047, 00047, 2, 1, 12, '2018-03-15', '2019-03-15', 1),
(00048, 00048, 2, 1, 12, '2018-03-20', '2019-03-20', 1),
(00049, 00049, 2, 1, 12, '2018-08-25', '2019-08-25', 2),
(00050, 00050, 2, 1, 12, '2018-08-21', '2019-08-21', 1),
(00051, 00051, 2, 1, 12, '2018-08-11', '2019-08-11', 2),
(00052, 00052, 2, 1, 12, '2018-08-12', '2019-08-12', 2),
(00053, 00053, 2, 1, 12, '2018-03-24', '2019-03-24', 1),
(00054, 00054, 2, 1, 12, '2018-06-07', '2019-06-07', 2),
(00055, 00055, 2, 1, 12, '2018-08-12', '2019-08-12', 2),
(00056, 00056, 2, 1, 12, '2018-01-12', '2019-01-12', 1),
(00057, 00057, 2, 1, 12, '2018-03-01', '2019-03-01', 1),
(00058, 00058, 2, 1, 12, '2018-04-29', '2019-04-29', 1),
(00059, 00059, 2, 1, 12, '2018-06-17', '2019-06-17', 1),
(00060, 00060, 2, 1, 12, '2018-03-26', '2019-03-26', 1),
(00061, 00061, 2, 1, 12, '2018-03-04', '2019-03-04', 1),
(00062, 00062, 2, 1, 12, '2018-03-28', '2019-03-28', 1),
(00063, 00063, 2, 1, 12, '2018-04-05', '2019-04-05', 2),
(00064, 00064, 2, 1, 12, '2018-01-27', '2019-01-27', 1),
(00065, 00065, 2, 1, 12, '2018-08-13', '2019-08-13', 1),
(00066, 00066, 2, 1, 12, '2018-06-05', '2019-06-05', 1),
(00067, 00067, 2, 1, 12, '2018-08-27', '2019-08-27', 2),
(00068, 00068, 2, 1, 12, '2018-01-22', '2019-01-22', 1),
(00069, 00069, 2, 1, 12, '2018-07-20', '2019-07-20', 1),
(00070, 00070, 2, 1, 12, '2018-04-26', '2019-04-26', 1),
(00071, 00071, 2, 1, 12, '2018-05-06', '2019-05-06', 2),
(00072, 00072, 2, 1, 12, '2018-01-11', '2019-01-11', 1),
(00073, 00073, 2, 1, 12, '2018-05-22', '2019-05-22', 2),
(00074, 00074, 2, 1, 12, '2018-06-14', '2019-06-14', 1),
(00075, 00075, 2, 1, 12, '2018-06-29', '2019-06-29', 2),
(00076, 00076, 2, 1, 12, '2018-01-01', '2019-01-01', 2),
(00077, 00077, 2, 1, 12, '2018-04-02', '2019-04-02', 1),
(00078, 00078, 2, 1, 12, '2018-03-06', '2019-03-06', 1),
(00079, 00079, 2, 1, 12, '2018-02-04', '2019-02-04', 2),
(00080, 00080, 2, 1, 12, '2018-08-23', '2019-08-23', 2),
(00081, 00081, 2, 1, 12, '2018-05-27', '2019-05-27', 1),
(00082, 00082, 2, 1, 12, '2018-07-13', '2019-07-13', 2),
(00083, 00083, 2, 1, 12, '2018-02-13', '2019-02-13', 1),
(00084, 00084, 2, 1, 12, '2018-05-06', '2019-05-06', 2),
(00085, 00085, 2, 1, 12, '2018-06-28', '2019-06-28', 2),
(00086, 00086, 2, 1, 12, '2018-03-26', '2019-03-26', 1),
(00087, 00087, 2, 1, 12, '2018-01-18', '2019-01-18', 1),
(00088, 00088, 2, 1, 12, '2018-03-11', '2019-03-11', 2),
(00089, 00089, 2, 1, 12, '2018-03-03', '2019-03-03', 2),
(00090, 00090, 2, 1, 12, '2018-01-08', '2019-01-08', 1),
(00091, 00091, 2, 1, 12, '2018-08-25', '2019-08-25', 1),
(00092, 00092, 2, 1, 12, '2018-05-26', '2019-05-26', 1),
(00093, 00093, 2, 1, 12, '2018-06-18', '2019-06-18', 1),
(00094, 00094, 2, 1, 12, '2018-08-18', '2019-08-18', 1),
(00095, 00095, 2, 1, 12, '2018-06-27', '2019-06-27', 1),
(00096, 00096, 2, 1, 12, '2018-02-17', '2019-02-17', 2),
(00097, 00097, 2, 1, 12, '2018-04-03', '2019-04-03', 1),
(00098, 00098, 2, 1, 12, '2018-02-02', '2019-02-02', 1),
(00099, 00099, 2, 1, 12, '2018-07-27', '2019-07-27', 2),
(00100, 00100, 2, 1, 12, '2018-03-09', '2019-03-09', 1),
(00101, 00101, 2, 1, 12, '2018-06-18', '2019-06-18', 1),
(00102, 00102, 2, 1, 12, '2018-07-12', '2019-07-12', 2),
(00103, 00103, 2, 1, 12, '2018-03-15', '2019-03-15', 1),
(00104, 00104, 2, 1, 12, '2018-06-29', '2019-06-29', 1),
(00105, 00105, 2, 1, 12, '2018-07-01', '2019-07-01', 1),
(00106, 00106, 2, 1, 12, '2018-05-19', '2019-05-19', 1),
(00107, 00107, 2, 1, 12, '2018-02-09', '2019-02-09', 1),
(00108, 00108, 2, 1, 12, '2018-08-13', '2019-08-13', 2),
(00109, 00109, 2, 1, 12, '2018-05-02', '2019-05-02', 2),
(00110, 00110, 2, 1, 12, '2018-06-28', '2019-06-28', 1),
(00111, 00111, 2, 1, 12, '2018-06-19', '2019-06-19', 1),
(00112, 00112, 2, 1, 12, '2018-06-25', '2019-06-25', 1),
(00113, 00113, 2, 1, 12, '2018-05-22', '2019-05-22', 2),
(00114, 00114, 2, 1, 12, '2018-07-04', '2019-07-04', 1),
(00115, 00115, 2, 1, 12, '2018-03-12', '2019-03-12', 2),
(00116, 00116, 2, 1, 12, '2018-01-02', '2019-01-02', 2),
(00117, 00117, 2, 1, 12, '2018-03-18', '2019-03-18', 2),
(00118, 00118, 2, 1, 12, '2018-02-18', '2019-02-18', 2),
(00119, 00119, 2, 1, 12, '2018-04-12', '2019-04-12', 1),
(00120, 00120, 2, 1, 12, '2018-06-16', '2019-06-16', 2),
(00121, 00121, 2, 1, 12, '2018-06-23', '2019-06-23', 2),
(00122, 00122, 2, 1, 12, '2018-08-06', '2019-08-06', 1),
(00123, 00123, 2, 1, 12, '2018-01-12', '2019-01-12', 1),
(00124, 00124, 2, 1, 12, '2018-05-03', '2019-05-03', 1),
(00125, 00125, 2, 1, 12, '2018-03-02', '2019-03-02', 1),
(00126, 00126, 2, 1, 12, '2018-03-03', '2019-03-03', 2),
(00127, 00127, 2, 1, 12, '2018-04-06', '2019-04-06', 2),
(00128, 00128, 2, 1, 12, '2018-05-05', '2019-05-05', 1),
(00129, 00129, 2, 1, 12, '2018-03-17', '2019-03-17', 1),
(00130, 00130, 2, 1, 12, '2018-01-18', '2019-01-18', 1),
(00131, 00131, 2, 1, 12, '2018-02-28', '2019-02-28', 2),
(00132, 00132, 2, 1, 12, '2018-08-21', '2019-08-21', 1),
(00133, 00133, 2, 1, 12, '2018-06-21', '2019-06-21', 1),
(00134, 00134, 2, 1, 12, '2018-05-06', '2019-05-06', 1),
(00135, 00135, 2, 1, 12, '2018-03-29', '2019-03-29', 2),
(00136, 00136, 2, 1, 12, '2018-06-04', '2019-06-04', 2),
(00137, 00137, 2, 1, 12, '2018-05-14', '2019-05-14', 2),
(00138, 00138, 2, 1, 12, '2018-07-10', '2019-07-10', 1),
(00139, 00139, 2, 1, 12, '2018-02-14', '2019-02-14', 1),
(00140, 00140, 2, 1, 12, '2018-02-11', '2019-02-11', 1),
(00141, 00141, 2, 1, 12, '2018-04-05', '2019-04-05', 2),
(00142, 00142, 2, 1, 12, '2018-07-20', '2019-07-20', 1),
(00143, 00143, 2, 1, 12, '2018-05-18', '2019-05-18', 1),
(00144, 00144, 2, 1, 12, '2018-08-28', '2019-08-28', 1),
(00145, 00145, 2, 1, 12, '2018-04-20', '2019-04-20', 2),
(00146, 00146, 2, 1, 12, '2018-05-29', '2019-05-29', 2),
(00147, 00147, 2, 1, 12, '2018-07-03', '2019-07-03', 1),
(00148, 00148, 2, 1, 12, '2018-05-10', '2019-05-10', 2),
(00149, 00149, 2, 1, 12, '2018-08-02', '2019-08-02', 2),
(00150, 00150, 2, 1, 12, '2018-04-20', '2019-04-20', 1),
(00151, 00151, 2, 1, 12, '2018-07-18', '2019-07-18', 2),
(00152, 00152, 2, 1, 12, '2018-01-03', '2019-01-03', 2),
(00153, 00153, 2, 1, 12, '2018-08-19', '2019-08-19', 1),
(00154, 00154, 2, 1, 12, '2018-04-20', '2019-04-20', 1),
(00155, 00155, 2, 1, 12, '2018-08-17', '2019-08-17', 2),
(00156, 00156, 2, 1, 12, '2018-07-05', '2019-07-05', 1),
(00157, 00157, 2, 1, 12, '2018-06-03', '2019-06-03', 2),
(00158, 00158, 2, 1, 12, '2018-07-13', '2019-07-13', 1),
(00159, 00159, 2, 1, 12, '2018-01-21', '2019-01-21', 1),
(00160, 00160, 2, 1, 12, '2018-08-29', '2019-08-29', 2),
(00161, 00161, 2, 1, 12, '2018-08-08', '2019-08-08', 1),
(00162, 00162, 2, 1, 12, '2018-07-22', '2019-07-22', 2),
(00163, 00163, 2, 1, 12, '2018-02-12', '2019-02-12', 1),
(00164, 00164, 2, 1, 12, '2018-05-05', '2019-05-05', 2),
(00165, 00165, 2, 1, 12, '2018-08-22', '2019-08-22', 1),
(00166, 00166, 2, 1, 12, '2018-06-08', '2019-06-08', 2),
(00167, 00167, 2, 1, 12, '2018-06-02', '2019-06-02', 1),
(00168, 00168, 2, 1, 12, '2018-03-07', '2019-03-07', 1),
(00169, 00169, 2, 1, 12, '2018-02-18', '2019-02-18', 2),
(00170, 00170, 2, 1, 12, '2018-07-06', '2019-07-06', 1),
(00171, 00171, 2, 1, 12, '2018-01-25', '2019-01-25', 1),
(00172, 00172, 2, 1, 12, '2018-04-17', '2019-04-17', 2),
(00173, 00173, 2, 1, 12, '2018-05-16', '2019-05-16', 2),
(00174, 00174, 2, 1, 12, '2018-03-25', '2019-03-25', 2),
(00175, 00175, 2, 1, 12, '2018-06-14', '2019-06-14', 1),
(00176, 00176, 2, 1, 12, '2018-03-26', '2019-03-26', 1),
(00177, 00177, 2, 1, 12, '2018-05-14', '2019-05-14', 1),
(00178, 00178, 2, 1, 12, '2018-05-08', '2019-05-08', 1),
(00179, 00179, 2, 1, 12, '2018-06-02', '2019-06-02', 1),
(00180, 00180, 2, 1, 12, '2018-07-02', '2019-07-02', 1),
(00181, 00181, 2, 1, 12, '2018-07-04', '2019-07-04', 1),
(00182, 00182, 2, 1, 12, '2018-02-26', '2019-02-26', 2),
(00183, 00183, 2, 1, 12, '2018-04-21', '2019-04-21', 2),
(00184, 00184, 2, 1, 12, '2018-04-24', '2019-04-24', 1),
(00185, 00185, 2, 1, 12, '2018-02-24', '2019-02-24', 1),
(00186, 00186, 2, 1, 12, '2018-05-09', '2019-05-09', 2),
(00187, 00187, 2, 1, 12, '2018-01-29', '2019-01-29', 1),
(00188, 00188, 2, 1, 12, '2018-04-17', '2019-04-17', 1),
(00189, 00189, 2, 1, 12, '2018-08-21', '2019-08-21', 2),
(00190, 00190, 2, 1, 12, '2018-04-19', '2019-04-19', 1),
(00191, 00191, 2, 1, 12, '2018-02-09', '2019-02-09', 2),
(00192, 00192, 2, 1, 12, '2018-05-17', '2019-05-17', 1),
(00193, 00193, 2, 1, 12, '2018-07-10', '2019-07-10', 1),
(00194, 00194, 2, 1, 12, '2018-07-23', '2019-07-23', 2),
(00195, 00195, 2, 1, 12, '2018-05-03', '2019-05-03', 2),
(00196, 00196, 2, 1, 12, '2018-01-11', '2019-01-11', 1),
(00197, 00197, 2, 1, 12, '2018-07-05', '2019-07-05', 2),
(00198, 00198, 2, 1, 12, '2018-07-17', '2019-07-17', 2),
(00199, 00199, 2, 1, 12, '2018-03-04', '2019-03-04', 2),
(00200, 00200, 2, 1, 12, '2018-01-23', '2019-01-23', 2),
(00201, 00201, 2, 1, 12, '2018-01-29', '2019-01-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ho_so_nhan_vien`
--

CREATE TABLE IF NOT EXISTS `ho_so_nhan_vien` (
  `ma_nhan_vien` int(5) unsigned zerofill NOT NULL,
  `ma_phong_ban` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ma_chuc_danh` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ho_dem` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `anh_dai_dien` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nam_sinh` date NOT NULL,
  `gioi_tinh` int(1) NOT NULL,
  `ma_tinh_trang_hon_nhan` int(11) NOT NULL,
  `que_quan` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dan_toc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ma_quoc_tich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `noi_tam_tru` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `so_dien_thoai` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `so_cmnd` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `noi_cap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_cap` date NOT NULL,
  `trang_thai` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ho_so_nhan_vien`
--

INSERT INTO `ho_so_nhan_vien` (`ma_nhan_vien`, `ma_phong_ban`, `ma_chuc_danh`, `ho_dem`, `ten`, `anh_dai_dien`, `nam_sinh`, `gioi_tinh`, `ma_tinh_trang_hon_nhan`, `que_quan`, `dan_toc`, `ma_quoc_tich`, `noi_tam_tru`, `so_dien_thoai`, `email`, `so_cmnd`, `noi_cap`, `ngay_cap`, `trang_thai`) VALUES
(00001, 'PGD', 'GD', 'Đặng Văn', 'Nam', '1219820798006.png', '1998-07-20', 1, 1, '121 Hoàng Diệu, Hải Châu, Đà Nẵng', 'Kinh', 'VN', '121 Hoàng Diệu, Hải Châu, Đà Nẵng', '01266676809', 'dangvannam98@gmail.com', '201756910', 'Đà Nẵng', '2013-01-12', 1),
(00002, 'PGD', 'GD', 'Thái Nguyễn Thục', 'Nhi', '1219820798017.png', '1998-01-12', 2, 1, '128 Trần Văn Hai, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '128 Trần Văn Hai, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01694158988', 'doanphiphuc4081@gmail.com', '201127804', 'Đà Nẵng', '2014-10-21', 1),
(00003, 'PGD', 'NV', 'Trương Thành', 'Ngân', '1219820798019.png', '1985-09-25', 1, 2, '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', '01679921408', 'truongthanhngan9451@gmail.com', '201453041', 'Nam Định', '2011-01-19', 2),
(00004, 'PGD', 'NV', 'Hoàng Phi', 'Bách', '1219820798011.png', '1926-01-02', 2, 1, '06 Nguyễn Lý, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '06 Nguyễn Lý, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0947030127', 'hoangphibach6891@gmail.com', '201397509', 'Phú Yên', '2011-02-13', 1),
(00005, 'PNS', 'NV', 'Trương Hữu', 'Quang', '1219820798016.png', '1995-09-06', 1, 3, '56 Lê Hồng Phong, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '56 Lê Hồng Phong, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', '01233215139', 'truonghuuquang7531@gmail.com', '201185456', 'Cà Mau', '2008-10-18', 2),
(00006, 'PDA', 'NV', 'Đoàn Thị', 'Phước', '1219820798003.png', '1960-12-15', 2, 3, 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '0934657298', 'doanthiphuoc6031@gmail.com', '201850154', 'Đà Nẵng', '2008-11-21', 2),
(00007, 'PDA', 'TP', 'Đăng Hạ', 'Chí', '1219820798013.png', '1956-06-07', 1, 3, '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0995373667', 'danghachi8421@gmail.com', '201984014', 'Hậu Giang', '2012-06-14', 1),
(00008, 'PDA', 'NV', 'Vương Văn', 'Tài', '1219820798003.png', '1981-06-25', 1, 4, 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '0978177177', 'vuongvantai161@gmail.com', '201431316', 'Đà Nẵng', '2010-11-16', 2),
(00009, 'PDT', 'NV', 'Đồng Phi', 'Tiến', '1219820798015.png', '1977-05-04', 1, 2, '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '0965388198', 'dongphitien3291@gmail.com', '201526208', 'Đà Nẵng', '2011-12-03', 1),
(00010, 'PDA', 'NV', 'Hoàng Thành', 'Tuệ', '1219820798006.png', '1995-06-03', 2, 3, 'K122/22 Trưng Nữ Vương, Phường Bình Hiên, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K122/22 Trưng Nữ Vương, Phường Bình Hiên, Quận Hải Châu, Thành phố Đà Nẵng', '0912302727', 'hoangthanhtue4171@gmail.com', '201999080', 'Đà Nẵng', '2011-07-28', 2),
(00011, 'PDT', 'NV', 'Tôn Bình', 'Quang', '1219820798016.png', '1970-01-24', 2, 2, 'Lô A2.10 đường 30/4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô A2.10 đường 30/4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '01246865888', 'doanphiphuc181@gmail.com', '201400026', 'Đà Nẵng', '2012-10-19', 2),
(00012, 'PGD', 'NV', 'Tôn Tuấn', 'Phương', '1219820798015.png', '1954-04-09', 2, 2, '278-280 Xô Viết Nghệ Tĩnh, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '278-280 Xô Viết Nghệ Tĩnh, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0933906886', 'truongthanhngan7551@gmail.com', '201197272', 'Đà Nẵng', '2012-11-12', 2),
(00013, 'PNS', 'NV', 'Đào Văn', 'Thanh', '1219820798003.png', '1996-05-15', 2, 4, '11 Phạm Kiệt, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '11 Phạm Kiệt, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0907661973', 'hoangphibach2171@gmail.com', '201560149', 'Đà Nẵng', '2008-04-26', 2),
(00014, 'PIT', 'NV', 'Lê Phi', 'Tiền', '1219820798017.png', '1977-10-03', 2, 1, '356/19 Ngũ Hành Sơn, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '356/19 Ngũ Hành Sơn, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0984352870', 'truonghuuquang3951@gmail.com', '200898894', 'Đà Nẵng', '2008-05-03', 2),
(00015, 'PNS', 'NV', 'Lý Thành', 'Chí', '1219820798015.png', '1951-03-03', 2, 4, '500 Trần Cao Vân, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '500 Trần Cao Vân, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '01688970755', 'doanthiphuoc4391@gmail.com', '200895335', 'Đà Nẵng', '2011-08-15', 1),
(00016, 'PIT', 'TP', 'Tiến', 'Bùi Tuấn', '1219820798014.png', '1970-04-28', 2, 3, '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01233033698', 'danghachi8721@gmail.com', '201851326', 'Đồng Tháp', '2012-05-24', 1),
(00017, 'PGD', 'NV', 'Phùng Hạ', 'Châu', '1219820798002.png', '1957-06-04', 1, 2, '74/7/24 Ngô Thị Nhậm, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '74/7/24 Ngô Thị Nhậm, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '01679834761', 'vuongvantai3381@gmail.com', '201418951', 'Sơn La', '2008-09-08', 1),
(00018, 'PIT', 'NV', 'Lai Bình', 'Tài', '1219820798003.png', '1972-04-02', 2, 3, '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '0964697567', 'dongphitien1141@gmail.com', '201096002', 'Đà Nẵng', '2010-01-04', 2),
(00019, 'PIT', 'NV', 'Bùi Văn', 'Tiến', '1219820798019.png', '1986-07-13', 2, 1, 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01699784960', 'hoangthanhtue6991@gmail.com', '200802324', 'Khánh Hòa', '2012-02-25', 2),
(00020, 'PGD', 'NV', 'Võ Hưng', 'Tài', '1219820798017.png', '1973-12-29', 2, 2, 'K80/47 Lê Hữu Trác, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K80/47 Lê Hữu Trác, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '01283813511', 'tonbinhquang3261@gmail.com', '201837301', 'Đà Nẵng', '2010-07-27', 1),
(00021, 'PKT', 'NV', 'Đinh Vô', 'Tiền', '1219820798016.png', '1947-05-18', 1, 2, '755 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '755 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '01626365970', 'tontuanphuong2851@gmail.com', '201117928', 'Đà Nẵng', '2009-11-26', 2),
(00022, 'PKT', 'NV', 'Phan Hạ', 'Lâm', '1219820798010.png', '1967-07-17', 2, 3, '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', '01246929299', 'daovanthanh9661@gmail.com', '201790798', 'Đà Nẵng', '2008-03-22', 2),
(00023, 'PDA', 'NV', 'Đăng Phi', 'Long', '1219820798017.png', '1968-02-26', 1, 2, '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '01627908688', 'lephitien3051@gmail.com', '201820582', 'Vĩnh Long', '2012-02-25', 2),
(00024, 'PGD', 'NV', 'Dương Phương', 'Quá', '1219820798015.png', '1953-04-02', 1, 1, 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0915251298', 'lythanhchi6121@gmail.com', '201812686', 'Phú Yên', '2012-04-25', 2),
(00025, 'PDT', 'NV', 'Tôn Văn', 'Lâm', '1219820798012.png', '1970-02-28', 2, 1, 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0945659199', 'buituantien8641@gmail.com', '201261522', 'Đà Nẵng', '2009-11-17', 2),
(00026, 'PNS', 'NV', 'Dương Thị', 'Trí', '1219820798022.png', '1988-01-22', 2, 4, '74 Nguyễn Quyền, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '74 Nguyễn Quyền, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01634469344', 'phunghachau8321@gmail.com', '201933917', 'Đà Nẵng', '2008-08-16', 2),
(00027, 'PGD', 'NV', 'Hoàng Hạ', 'Nga', '1219820798006.png', '1941-06-20', 1, 1, '255 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '255 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0965430098', 'laibinhtai4641@gmail.com', '201147892', 'Đà Nẵng', '2012-10-28', 1),
(00028, 'PIT', 'PP', 'Thanh', 'Mai Phương', '1219820798015.png', '1960-02-22', 1, 4, 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01212988998', 'buivantien7241@gmail.com', '201450666', 'Đà Nẵng', '2012-06-24', 1),
(00029, 'PIT', 'NV', 'Lâm Mỹ', 'Tiền', '1219820798007.png', '1958-04-23', 1, 2, '454/4 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '454/4 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '0979261480', 'vohungtai5481@gmail.com', '201013234', 'Đà Nẵng', '2008-05-18', 2),
(00030, 'PKT', 'NV', 'Dương Phi', 'Tuệ', '1219820798011.png', '1946-06-10', 2, 3, '395 Võ An Ninh, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '395 Võ An Ninh, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0974551998', 'dinhvotien7611@gmail.com', '201539317', 'Đà Nẵng', '2011-10-17', 2),
(00031, 'PKT', 'NV', 'Phan Hữu', 'Tài', '1219820798007.png', '1999-02-23', 1, 1, 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '0947639057', 'phanhalam911@gmail.com', '201243329', 'Hoà Bình', '2012-07-28', 2),
(00032, 'PIT', 'NV', 'Trương Hưng', 'Trí', '1219820798019.png', '1996-06-13', 2, 3, '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01687860751', 'dangphilong3471@gmail.com', '201568082', 'Đà Nẵng', '2012-09-08', 1),
(00033, 'PIT', 'NV', 'Trương Hữu', 'Nga', '1219820798011.png', '1953-02-10', 1, 4, '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0912668622', 'duongphuongqua4401@gmail.com', '201869858', 'Đà Nẵng', '2008-11-04', 2),
(00034, 'PGD', 'PGD', 'Phạm Mỹ', 'Sơn', '1219820798019.png', '1996-11-04', 1, 2, '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0912237798', 'tonvanlam5991@gmail.com', '200946021', 'Đà Nẵng', '2012-04-23', 2),
(00035, 'PDT', 'PP', 'Châu', 'Triệu Hưng', '1219820798006.png', '1955-06-07', 1, 2, '1254 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '1254 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '01662141998', 'duongthitri2951@gmail.com', '200941269', 'Đà Nẵng', '2010-05-02', 1),
(00036, 'PGD', 'NV', 'Lê Bình', 'Chí', '1219820798007.png', '1964-11-22', 2, 2, 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0904853941', 'hoanghanga7281@gmail.com', '201392565', 'Đà Nẵng', '2008-08-06', 2),
(00037, 'PGD', 'GD', 'Triệu Văn', 'Tiến', '1219820798005.png', '1977-05-02', 2, 1, 'K81/4 Trần Ngọc Sương, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K81/4 Trần Ngọc Sương, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0983681215', 'maiphuongthanh1811@gmail.com', '201130415', 'Long An', '2008-03-19', 2),
(00038, 'PGD', 'NV', 'Trương Phi', 'Phước', '1219820798011.png', '1993-10-29', 1, 1, '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '0945014122', 'lammytien8661@gmail.com', '201826564', 'Đà Nẵng', '2010-03-01', 2),
(00039, 'PIT', 'NV', 'Bùi Phi', 'Tiền', '1219820798009.png', '1996-10-01', 1, 2, '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01698550584', 'duongphitue6881@gmail.com', '201448393', 'Yên Bái', '2008-09-05', 1),
(00040, 'PNS', 'NV', 'Vương Thành', 'Sơn', '1219820798009.png', '1979-07-12', 2, 3, 'Lô 50- B2.1 Cụm dân cư phía Bắc Tu Viện Phao Lô, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 50- B2.1 Cụm dân cư phía Bắc Tu Viện Phao Lô, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0975223285', 'phanhuutai8601@gmail.com', '200838748', 'Đà Nẵng', '2012-12-07', 2),
(00041, 'PKT', 'NV', 'Đinh Tuấn', 'Tiền', '1219820798001.png', '1946-01-06', 1, 4, '31 Hà Bổng, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '31 Hà Bổng, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '0942429773', 'truonghungtri1651@gmail.com', '201991378', 'Tỉnh Lai Châu', '2010-02-04', 2),
(00042, 'PNS', 'TP', 'Lâm Tuấn', 'Trân', '1219820798010.png', '1928-12-17', 1, 4, 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '0971413114', 'truonghuunga8531@gmail.com', '201474985', 'Đà Nẵng', '2011-11-12', 1),
(00043, 'PKT', 'NV', 'Lai Tuấn', 'Nga', '1219820798018.png', '1971-12-28', 2, 1, '73-75 Dương Đình Nghệ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '73-75 Dương Đình Nghệ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0989710068', 'phammyson1851@gmail.com', '201745755', 'Đà Nẵng', '2010-03-09', 1),
(00044, 'PIT', 'NV', 'Phùng Tuấn', 'Thảo', '1219820798022.png', '1959-04-04', 1, 1, '183 Hoàng Đức Lương, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '183 Hoàng Đức Lương, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0936127618', 'trieuhungchau3471@gmail.com', '201231558', 'Thừa Thiên Huế', '2008-10-15', 1),
(00045, 'PKT', 'NV', 'Đỗ Phi', 'Tuyền', '1219820798012.png', '1961-11-20', 2, 2, '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0965938770', 'lebinhchi4011@gmail.com', '201392608', 'Đà Nẵng', '2009-01-01', 2),
(00046, 'PIT', 'NV', 'Trương Văn', 'Quá', '1219820798009.png', '1978-04-05', 1, 2, '216 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '216 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '01234053369', 'trieuvantien551@gmail.com', '201529531', 'Đà Nẵng', '2009-03-25', 2),
(00047, 'PIT', 'NV', 'Triệu Thị', 'Nga', '1219820798014.png', '1936-03-03', 1, 1, 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '0917911310', 'truongphiphuoc2441@gmail.com', '200887650', 'Hà Giang', '2008-07-17', 1),
(00048, 'PKT', 'NV', 'Đỗ Văn', 'Chí', '1219820798004.png', '1944-09-16', 2, 3, '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0902140298', 'buiphitien4031@gmail.com', '201205466', 'Đà Nẵng', '2010-09-26', 1),
(00049, 'PGD', 'NV', 'Bùi Thành', 'Lâm', '1219820798004.png', '1950-04-17', 1, 3, '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '0922063883', 'vuongthanhson8921@gmail.com', '201860426', 'Quảng Ngãi', '2010-01-19', 2),
(00050, 'PIT', 'NV', 'Dương Hữu', 'Nguyệt', '1219820798012.png', '1942-10-25', 1, 4, 'Nhà số A2.7, Khu biệt thự Đảo Xanh, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Nhà số A2.7, Khu biệt thự Đảo Xanh, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '0915109597', 'dinhtuantien6881@gmail.com', '201987229', 'Đà Nẵng', '2010-05-23', 1),
(00051, 'PDA', 'NV', 'Đoàn Thị', 'Đạt', '1219820798003.png', '1948-09-13', 1, 4, '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', '0968882266', 'lamtuantran3441@gmail.com', '200880132', 'Vĩnh Long', '2010-10-10', 2),
(00052, 'PDA', 'NV', 'Lê Phương', 'Trí', '1219820798001.png', '1961-08-04', 2, 2, 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '0904770000', 'laituannga2941@gmail.com', '201134414', 'Đà Nẵng', '2009-09-15', 2),
(00053, 'PNS', 'NV', 'Trần Thành', 'Linh', '1219820798019.png', '1926-08-21', 1, 4, '112 Hải Hồ, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '112 Hải Hồ, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', '0986451062', 'phungtuanthao7001@gmail.com', '200928000', 'Tỉnh Phú Thọ', '2010-05-07', 1),
(00054, 'PGD', 'PGD', 'Hoàng Phục', 'Nguyệt', '1219820798012.png', '1994-01-24', 2, 2, '190 Phạm Cự Lượng, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '190 Phạm Cự Lượng, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '01676013809', 'dophituyen3011@gmail.com', '201413502', 'Lạng Sơn', '2008-12-09', 2),
(00055, 'PDT', 'NV', 'Đinh Phi', 'Quang', '1219820798001.png', '1957-05-07', 2, 1, '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '01668603473', 'truongvanqua2081@gmail.com', '201900150', 'Quảng Bình', '2010-08-25', 2),
(00056, 'PDT', 'TP', 'Thành', 'Đăng Bình', '1219820798010.png', '1974-09-29', 2, 2, '21 Phan Tốn, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '21 Phan Tốn, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0977039598', 'trieuthinga8971@gmail.com', '200990430', 'Bắc Ninh', '2010-08-03', 1),
(00057, 'PKT', 'TP', 'Quá', 'Triệu Thành', '1219820798002.png', '1951-05-03', 2, 1, 'Lô 12 Phước Trường 16, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 12 Phước Trường 16, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '01685388927', 'dovanchi4531@gmail.com', '201183364', 'Đà Nẵng', '2011-05-01', 1),
(00058, 'PIT', 'NV', 'Đoàn Thị', 'Long', '1219820798006.png', '1959-05-21', 2, 1, 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0989633435', 'buithanhlam6911@gmail.com', '200839404', 'Hà Nam', '2010-10-12', 1),
(00059, 'PKT', 'NV', 'Phạm Thành', 'Bách', '1219820798003.png', '1995-07-02', 2, 2, '36 Sơn Thủy 3, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '36 Sơn Thủy 3, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01242598906', 'duonghuunguyet6031@gmail.com', '201626856', 'Tỉnh Lai Châu', '2011-06-08', 1),
(00060, 'PGD', 'PGD', 'Trần Vô', 'Phúc', '1219820798014.png', '1956-06-28', 1, 1, '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '01632689968', 'doanthidat1431@gmail.com', '201072027', 'Đà Nẵng', '2009-09-21', 1),
(00061, 'PIT', 'NV', 'Trần Tuấn', 'Chí', '1219820798005.png', '1983-12-14', 2, 2, '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01278971998', 'lephuongtri171@gmail.com', '201728701', 'Đà Nẵng', '2010-03-06', 1),
(00062, 'PIT', 'NV', 'Triệu Hạ', 'Trân', '1219820798005.png', '1982-03-12', 2, 2, '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0906200838', 'tranthanhlinh6911@gmail.com', '201905722', 'Đà Nẵng', '2010-06-02', 1),
(00063, 'PNS', 'NV', 'Lý Hạ', 'Long', '1219820798012.png', '1962-08-08', 2, 3, 'Kiệt A379/6 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Kiệt A379/6 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0915165989', 'hoangphucnguyet7731@gmail.com', '201338393', 'Đà Nẵng', '2008-02-15', 2),
(00064, 'PIT', 'NV', 'Trương Vô', 'Nguyệt', '1219820798008.png', '1938-03-02', 2, 2, '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0982343267', 'dinhphiquang5661@gmail.com', '201398932', 'Đà Nẵng', '2012-03-02', 1),
(00065, 'PIT', 'NV', 'Đỗ Hưng', 'Lâm', '1219820798022.png', '1959-02-04', 2, 3, '37 Hà Huy Tập, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '37 Hà Huy Tập, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '01669954165', 'dangbinhthanh2551@gmail.com', '201057001', 'Tỉnh Bắc Kạn', '2008-02-16', 1),
(00066, 'PDA', 'NV', 'Trần Phục', 'Phục', '1219820798008.png', '1966-10-18', 1, 4, '111 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '111 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0966593219', 'trieuthanhqua4311@gmail.com', '201932448', 'Đà Nẵng', '2008-10-20', 1),
(00067, 'PNS', 'NV', 'Dương Mỹ', 'Quân', '1219820798010.png', '1960-05-18', 2, 4, '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0904188855', 'doanthilong5361@gmail.com', '201869729', 'Bình Dương', '2011-10-25', 2),
(00068, 'PDA', 'NV', 'Trương Phi', 'Chí', '1219820798015.png', '1930-08-09', 1, 3, 'Lô A11-1, đường số 4, Khu công nghệ cao Đà Nẵng, Xã Hoà Liên, Huyện Hoà Vang, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô A11-1, đường số 4, Khu công nghệ cao Đà Nẵng, Xã Hoà Liên, Huyện Hoà Vang, Thành phố Đà Nẵng', '0948700098', 'phamthanhbach671@gmail.com', '201254054', 'Tỉnh Bắc Kạn', '2012-12-15', 1),
(00069, 'PDT', 'NV', 'Đăng Mỹ', 'Phúc', '1219820798015.png', '1951-06-21', 2, 4, '34 Lỗ Giáng 16, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '34 Lỗ Giáng 16, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0911400831', 'tranvophuc6021@gmail.com', '201526246', 'Đà Nẵng', '2010-09-18', 1),
(00070, 'PDA', 'NV', 'Lai Vô', 'Trân', '1219820798015.png', '1992-08-10', 1, 3, 'K03/09 Dũng Sĩ Thanh Khê, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K03/09 Dũng Sĩ Thanh Khê, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '01643014832', 'trantuanchi6491@gmail.com', '201008530', 'Đà Nẵng', '2010-12-14', 1),
(00071, 'PKT', 'NV', 'Đăng Phương', 'Đạt', '1219820798011.png', '1925-01-29', 1, 4, 'Lô 39 Đường Sơn Thủy 12, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 39 Đường Sơn Thủy 12, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01674876709', 'trieuhatran5111@gmail.com', '201610794', 'Tỉnh Phú Thọ', '2011-09-12', 2),
(00072, 'PIT', 'NV', 'Phan Vô', 'Phúc', '1219820798004.png', '1978-07-22', 1, 1, '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01249919515', 'lyhalong6511@gmail.com', '201119410', 'Bắc Giang', '2012-12-19', 1),
(00073, 'PDT', 'NV', 'Phùng Thành', 'Nga', '1219820798016.png', '1929-12-05', 2, 4, '89 Hà Mục, Tổ 55, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '89 Hà Mục, Tổ 55, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0912933156', 'truongvonguyet9761@gmail.com', '201953901', 'Đà Nẵng', '2008-07-21', 2),
(00074, 'PKT', 'NV', 'Phan Hữu', 'Đạt', '1219820798016.png', '1959-06-16', 1, 3, '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '0946859486', 'dohunglam7281@gmail.com', '201514365', 'Đà Nẵng', '2008-03-03', 1),
(00075, 'PNS', 'NV', 'Lê Tuấn', 'Thanh', '1219820798007.png', '1938-03-08', 2, 2, '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '0969352395', 'tranphucphuc8091@gmail.com', '200824865', 'Lạng Sơn', '2012-01-29', 2),
(00076, 'PDA', 'NV', 'Bùi Phương', 'Thành', '1219820798002.png', '1986-12-22', 2, 1, '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01278913923', 'duongmyquan9621@gmail.com', '201061140', 'Kon Tum', '2010-05-01', 2),
(00077, 'PIT', 'NV', 'Phan Thành', 'Tiền', '1219820798009.png', '1958-02-18', 2, 3, '12 Nam Thọ 2, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '12 Nam Thọ 2, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '0941076889', 'truongphichi3051@gmail.com', '201660295', 'Đà Nẵng', '2011-08-23', 1),
(00078, 'PNS', 'NV', 'Lâm Hạ', 'Sơn', '1219820798001.png', '1950-01-06', 1, 4, '31 Trần Phú, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '31 Trần Phú, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '01234641998', 'dangmyphuc8341@gmail.com', '201968726', 'Đà Nẵng', '2010-10-21', 1),
(00079, 'PDA', 'NV', 'Võ Văn', 'Linh', '1219820798010.png', '1958-04-04', 2, 3, 'K340/9 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K340/9 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '0946204772', 'laivotran2961@gmail.com', '201867586', 'Cao Bằng', '2009-03-22', 2),
(00080, 'PNS', 'NV', 'Võ Thị', 'Ngân', '1219820798019.png', '1927-06-14', 2, 4, 'Số 35 Thái Phiên, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 35 Thái Phiên, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', '01234952498', 'dangphuongdat6431@gmail.com', '201263979', 'Sơn La', '2010-09-21', 2),
(00081, 'PDT', 'NV', 'Phan Phi', 'Quá', '1219820798012.png', '1997-12-16', 1, 2, '40A Nguyễn Thiện Kế, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '40A Nguyễn Thiện Kế, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '01213057124', 'phanvophuc81@gmail.com', '201679205', 'Quảng Nam', '2012-10-20', 1),
(00082, 'PDA', 'NV', 'Lê Bình', 'Sơn', '1219820798009.png', '1961-10-09', 1, 2, '91 Ngô Nhân Tịnh, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '91 Ngô Nhân Tịnh, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0995476010', 'phungthanhnga2211@gmail.com', '201880516', 'Đồng Tháp', '2010-09-09', 2),
(00083, 'PIT', 'NV', 'Lý Văn', 'Linh', '1219820798003.png', '1942-01-13', 1, 3, 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '0985426898', 'phanhuudat5211@gmail.com', '201746656', 'Ninh Thuận', '2011-06-08', 1),
(00084, 'PNS', 'NV', 'Trần Phi', 'Phục', '1219820798007.png', '1956-06-23', 1, 4, 'Lô D8-108 Khu dân cư đô thị mới nam cầu Cẩm Lệ, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô D8-108 Khu dân cư đô thị mới nam cầu Cẩm Lệ, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '01239173861', 'letuanthanh1941@gmail.com', '201977463', 'Đà Nẵng', '2012-10-18', 2),
(00085, 'PDA', 'NV', 'Đào Thành', 'Tăng', '1219820798009.png', '1954-10-21', 1, 1, '152/40B Phan Thanh, Phường Thạc Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '152/40B Phan Thanh, Phường Thạc Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '01682567595', 'buiphuongthanh6451@gmail.com', '201585397', 'Đà Nẵng', '2012-03-20', 2),
(00086, 'PKT', 'PP', 'Tài', 'Lâm Thị', '1219820798005.png', '1945-04-07', 1, 1, '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0982214775', 'phanthanhtien851@gmail.com', '201121396', 'Đà Nẵng', '2012-05-08', 1),
(00087, 'PDT', 'NV', 'Dương Phục', 'Bách', '1219820798003.png', '1933-12-13', 1, 4, 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '0942705296', 'lamhason391@gmail.com', '201742447', 'Thừa Thiên Huế', '2010-09-23', 1),
(00088, 'PDT', 'NV', 'Trương Bình', 'Mạnh', '1219820798011.png', '1968-04-16', 1, 3, '93 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '93 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0962880082', 'vovanlinh5851@gmail.com', '201511143', 'Bà Rịa - Vũng Tàu', '2009-08-18', 2),
(00089, 'PIT', 'NV', 'Lê Hưng', 'Trân', '1219820798021.png', '1955-11-27', 2, 2, 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '0976698784', 'vothingan5501@gmail.com', '201646309', 'Trà Vinh', '2012-08-07', 2),
(00090, 'PDA', 'NV', 'Lâm Vô', 'Thảo', '1219820798003.png', '1960-08-17', 2, 2, 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '0975981998', 'phanphiqua5511@gmail.com', '201180378', 'Long An', '2012-10-13', 1),
(00091, 'PNS', 'NV', 'Phùng Phục', 'Tuyền', '1219820798005.png', '1985-12-12', 2, 2, '27 Nguyễn Minh Không, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '27 Nguyễn Minh Không, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '0964663020', 'lebinhson7181@gmail.com', '200893675', 'Cần Thơ', '2008-01-01', 1),
(00092, 'PKT', 'NV', 'Nguyễn Văn', 'Tăng', '1219820798008.png', '1934-10-29', 2, 4, '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '01665595959', 'lyvanlinh1381@gmail.com', '201183153', 'Thanh Hóa', '2010-05-29', 1),
(00093, 'PDT', 'NV', 'Đào Thị', 'Thanh', '1219820798005.png', '1945-01-18', 2, 3, 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '0978822321', 'tranphiphuc9311@gmail.com', '200891995', 'Đà Nẵng', '2008-05-11', 1),
(00094, 'PNS', 'NV', 'Tôn Mỹ', 'Phương', '1219820798004.png', '1980-12-02', 2, 2, '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0982113700', 'daothanhtang5731@gmail.com', '201386670', 'Đà Nẵng', '2012-10-27', 1),
(00095, 'PNS', 'NV', 'Dương Thị', 'Thảo', '1219820798004.png', '1931-07-24', 1, 3, '18 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '18 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '0983379481', 'lamthitai1391@gmail.com', '201999940', 'Nghệ An', '2011-07-17', 1),
(00096, 'PKT', 'NV', 'Phan Thành', 'Thanh', '1219820798001.png', '1939-10-18', 1, 4, '372/51 Phan Châu Trinh, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '372/51 Phan Châu Trinh, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', '0983341998', 'duongphucbach1871@gmail.com', '201439684', 'Nam Định', '2009-06-27', 2),
(00097, 'PNS', 'NV', 'Vương Thành', 'Thành', '1219820798009.png', '1995-03-10', 2, 4, '64 Lê Văn Hưu, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '64 Lê Văn Hưu, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0936014607', 'truongbinhmanh7761@gmail.com', '201434101', 'Đà Nẵng', '2009-08-08', 1),
(00098, 'PDT', 'NV', 'Đỗ Phi', 'Châu', '1219820798019.png', '1941-11-26', 2, 3, 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '0962508119', 'lehungtran9091@gmail.com', '201209723', 'Đà Nẵng', '2011-06-20', 1),
(00099, 'PNS', 'NV', 'Võ Phi', 'Tuệ', '1219820798011.png', '1964-08-04', 2, 3, 'Lô A-110 KDC dọc tuyến đường Trường Sa, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô A-110 KDC dọc tuyến đường Trường Sa, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '01648346758', 'lamvothao9011@gmail.com', '201609313', 'Đà Nẵng', '2011-04-16', 2),
(00100, 'PNS', 'NV', 'Đoàn Văn', 'Đạt', '1219820798010.png', '1970-09-20', 1, 2, 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '01635468595', 'phungphuctuyen1241@gmail.com', '200927611', 'Đà Nẵng', '2011-05-16', 1),
(00101, 'PDA', 'PP', 'Thanh', 'Phan Văn', '1219820798017.png', '1966-05-12', 2, 3, '247 Nguyễn Sắc Kim, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '247 Nguyễn Sắc Kim, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01652574253', 'nguyenvantang7191@gmail.com', '200919737', 'Đà Nẵng', '2012-09-03', 1),
(00102, 'PNS', 'NV', 'Phan Thành', 'Linh', '1219820798015.png', '1972-02-09', 1, 1, '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '0985572067', 'daothithanh841@gmail.com', '201503257', 'Đà Nẵng', '2011-02-23', 2),
(00103, 'PDT', 'NV', 'Vương Văn', 'Thanh', '1219820798019.png', '1957-02-18', 2, 2, 'K149/69 Lê Đình Lý, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K149/69 Lê Đình Lý, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '0949953592', 'tonmyphuong8901@gmail.com', '201240487', 'Nghệ An', '2011-04-23', 1),
(00104, 'PDT', 'NV', 'Lê Vô', 'Trân', '1219820798007.png', '1940-02-22', 2, 1, 'K394/7 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K394/7 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0946528666', 'duongthithao2051@gmail.com', '201409646', 'Đà Nẵng', '2012-10-03', 1),
(00105, 'PNS', 'NV', 'Hoàng Vô', 'Chí', '1219820798015.png', '1996-10-12', 1, 4, 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '0962925258', 'phanthanhthanh2951@gmail.com', '201386740', 'Hà Giang', '2009-07-04', 1),
(00106, 'PDA', 'NV', 'Đỗ Hạ', 'Trí', '1219820798003.png', '1971-06-16', 1, 4, '37 Cẩm Bắc 4, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '37 Cẩm Bắc 4, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01658006028', 'vuongthanhthanh2751@gmail.com', '200866912', 'Tiền Giang', '2009-05-28', 1),
(00107, 'PNS', 'NV', 'Phan Thành', 'Phúc', '1219820798001.png', '1949-09-15', 2, 4, 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '01266062579', 'dophichau7471@gmail.com', '201088957', 'Quảng Ninh', '2010-07-09', 1),
(00108, 'PDA', 'NV', 'Triệu Thành', 'Trân', '1219820798002.png', '1993-07-19', 2, 2, '20 Nguyễn Tạo, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '20 Nguyễn Tạo, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0944170598', 'vophitue5531@gmail.com', '201826529', 'Đà Nẵng', '2009-06-27', 2),
(00109, 'PDA', 'NV', 'Nguyễn Thành', 'Thanh', '1219820798017.png', '1982-01-11', 2, 1, 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01236861827', 'doanvandat1361@gmail.com', '201805121', 'Đà Nẵng', '2008-12-01', 2),
(00110, 'PIT', 'NV', 'Hoàng Phục', 'Châu', '1219820798022.png', '1944-11-15', 1, 3, '79 Hồ Tùng Mậu, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '79 Hồ Tùng Mậu, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '01266129070', 'phanvanthanh8951@gmail.com', '201250295', 'Quảng Bình', '2011-11-26', 1),
(00111, 'PDT', 'NV', 'Đỗ Phương', 'Thanh', '1219820798008.png', '1928-10-22', 2, 4, 'Lô 61-62 B2.15 An Thượng 26, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 61-62 B2.15 An Thượng 26, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0902226268', 'phanthanhlinh951@gmail.com', '201080046', 'Bến Tre', '2008-05-28', 1),
(00112, 'PKT', 'NV', 'Phùng Phục', 'Trí', '1219820798022.png', '1995-06-04', 2, 2, '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '0982570551', 'vuongvanthanh9171@gmail.com', '201653877', 'Đà Nẵng', '2011-03-05', 1),
(00113, 'PDT', 'NV', 'Đồng Hạ', 'Tiền', '1219820798012.png', '1925-06-11', 2, 4, '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '0986305162', 'levotran9161@gmail.com', '201045432', 'Sóc Trăng', '2009-04-10', 2),
(00114, 'PKT', 'NV', 'Đăng Hưng', 'Ngân', '1219820798014.png', '1996-08-27', 1, 2, 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01213150798', 'hoangvochi1351@gmail.com', '201073591', 'Cà Mau', '2009-02-06', 1),
(00115, 'PDA', 'NV', 'Trương Thị', 'Tài', '1219820798015.png', '1982-11-10', 2, 4, 'Số 1, đường An Cư 1, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 1, đường An Cư 1, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0965028269', 'dohatri2181@gmail.com', '200919892', 'Tỉnh Bắc Kạn', '2009-03-27', 2),
(00116, 'PDA', 'NV', 'Đoàn Thị', 'Đạt', '1219820798015.png', '1968-04-19', 1, 2, 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01222285400', 'phanthanhphuc9691@gmail.com', '201633157', 'Đà Nẵng', '2008-07-21', 2),
(00117, 'PNS', 'NV', 'Đồng Văn', 'Tiền', '1219820798001.png', '1968-06-01', 2, 4, '597 Trường Chinh, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '597 Trường Chinh, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01677756081', 'trieuthanhtran3391@gmail.com', '201705630', 'Đà Nẵng', '2009-11-21', 2),
(00118, 'PNS', 'NV', 'Hoàng Phục', 'Ngân', '1219820798006.png', '1984-08-24', 2, 4, '99A Hà Huy Tập, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '99A Hà Huy Tập, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '01223386688', 'nguyenthanhthanh451@gmail.com', '201248273', 'Thừa Thiên Huế', '2012-02-28', 2),
(00119, 'PGD', 'PGD', 'Hoàng Hữu', 'Phước', '1219820798014.png', '1986-11-26', 2, 3, '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01662710266', 'hoangphucchau1301@gmail.com', '200939511', 'Thừa Thiên Huế', '2009-12-02', 1),
(00120, 'PDT', 'NV', 'Lý Thị', 'Long', '1219820798006.png', '1955-02-01', 1, 2, '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '0914948269', 'dophuongthanh5361@gmail.com', '201416589', 'Đà Nẵng', '2012-02-28', 2),
(00121, 'PIT', 'NV', 'Lý Phi', 'Phục', '1219820798021.png', '1969-07-13', 2, 3, '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0973150498', 'phungphuctri2901@gmail.com', '201034528', 'Đà Nẵng', '2011-06-27', 2),
(00122, 'PIT', 'NV', 'Nguyễn Phương', 'Thành', '1219820798014.png', '1971-01-25', 2, 1, 'Lô A68, Đường 30 Tháng 4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô A68, Đường 30 Tháng 4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '01638300419', 'donghatien6421@gmail.com', '201903161', 'Bình Dương', '2010-07-16', 1),
(00123, 'PDT', 'NV', 'Võ Phục', 'Mạnh', '1219820798002.png', '1982-12-16', 1, 2, '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '0942251998', 'danghungngan4361@gmail.com', '200881147', 'Đà Nẵng', '2011-11-27', 1),
(00124, 'PNS', 'PP', 'Long', 'Lý Bình', '1219820798021.png', '1935-05-01', 2, 4, '65 Ngô Thị Liễu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '65 Ngô Thị Liễu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '0904893181', 'truongthitai7821@gmail.com', '201681129', 'Đà Nẵng', '2010-04-04', 1),
(00125, 'PKT', 'NV', 'Trương Thành', 'Mạnh', '1219820798008.png', '1962-12-19', 1, 1, 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', '01234555424', 'doanthidat8531@gmail.com', '201476209', 'Đà Nẵng', '2008-09-28', 1),
(00126, 'PNS', 'NV', 'Đồng Phi', 'Tuệ', '1219820798007.png', '1983-08-03', 2, 1, '388 Trần Hưng Đạo, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '388 Trần Hưng Đạo, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '0902319019', 'dongvantien1321@gmail.com', '200850659', 'Đà Nẵng', '2011-01-14', 2),
(00127, 'PKT', 'NV', 'Tôn Phương', 'Thanh', '1219820798012.png', '1966-02-20', 2, 3, 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0916183036', 'hoangphucngan4741@gmail.com', '201145118', 'Kon Tum', '2012-04-05', 2),
(00128, 'PIT', 'NV', 'Hoàng Thị', 'Phước', '1219820798009.png', '1944-04-27', 2, 2, '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0982171823', 'hoanghuuphuoc7361@gmail.com', '201694279', 'Bắc Giang', '2012-08-19', 1),
(00129, 'PKT', 'NV', 'Võ Văn', 'Trân', '1219820798018.png', '1942-04-12', 2, 1, '57/K1/4 Đường Hòa An 19, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '57/K1/4 Đường Hòa An 19, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0913347176', 'lythilong2911@gmail.com', '201548990', 'Đà Nẵng', '2009-08-18', 1),
(00130, 'PIT', 'NV', 'Lý Hữu', 'Trí', '1219820798005.png', '1988-09-18', 2, 3, '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '0995919963', 'lyphiphuc2331@gmail.com', '201225972', 'Đà Nẵng', '2009-09-22', 1),
(00131, 'PIT', 'NV', 'Phan Hưng', 'Nghĩa', '1219820798002.png', '1959-08-23', 1, 3, '35 Trần Thủ Độ , Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '35 Trần Thủ Độ , Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01273008666', 'nguyenphuongthanh9611@gmail.com', '201195693', 'Hồ Chí Minh', '2012-02-19', 2),
(00132, 'PIT', 'NV', 'Trần Văn', 'Lâm', '1219820798006.png', '1943-06-24', 1, 4, '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', '0932319898', 'vophucmanh3581@gmail.com', '201001812', 'Phú Yên', '2010-11-18', 1),
(00133, 'PDA', 'NV', 'Phùng Hữu', 'Quang', '1219820798009.png', '1974-08-28', 2, 1, '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0912184410', 'lybinhlong2441@gmail.com', '201815584', 'Đà Nẵng', '2011-11-11', 1),
(00134, 'PIT', 'NV', 'Đinh Vô', 'Châu', '1219820798015.png', '1978-06-13', 2, 4, '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '0913316667', 'truongthanhmanh7201@gmail.com', '201313002', 'Đà Nẵng', '2011-08-13', 1),
(00135, 'PDA', 'NV', 'Đào Tuấn', 'Tuyền', '1219820798009.png', '1968-01-29', 2, 2, '572/92 Ông Ích Khiêm, Phường Hải Châu II, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '572/92 Ông Ích Khiêm, Phường Hải Châu II, Quận Hải Châu, Thành phố Đà Nẵng', '0983554498', 'dongphitue1541@gmail.com', '201714038', 'Kiên Giang', '2010-04-02', 2),
(00136, 'PDA', 'NV', 'Lâm Thị', 'Châu', '1219820798006.png', '1925-03-27', 1, 3, '215/52 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '215/52 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '01669445319', 'tonphuongthanh6161@gmail.com', '201638561', 'Bà Rịa - Vũng Tàu', '2008-04-19', 2),
(00137, 'PNS', 'NV', 'Lý Thành', 'Linh', '1219820798001.png', '1940-10-04', 2, 1, '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '01693039959', 'hoangthiphuoc3111@gmail.com', '200821530', 'Sóc Trăng', '2012-11-02', 2),
(00138, 'PDA', 'NV', 'Tôn Hưng', 'Phúc', '1219820798020.png', '1926-06-03', 2, 3, '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '01234005598', 'vovantran8741@gmail.com', '201849815', 'Vĩnh Long', '2008-01-01', 1),
(00139, 'PDT', 'NV', 'Lai Thị', 'Chí', '1219820798007.png', '1978-09-16', 1, 2, '317/60 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '317/60 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '01214121722', 'lyhuutri3441@gmail.com', '200991234', 'Nam Định', '2009-12-14', 1),
(00140, 'PDT', 'NV', 'Tôn Hưng', 'Phương', '1219820798015.png', '1940-10-25', 2, 4, '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0979771674', 'phanhungnghia5231@gmail.com', '201020121', 'Quảng Ninh', '2008-10-19', 1),
(00141, 'PKT', 'NV', 'Vương Phương', 'Quang', '1219820798006.png', '1974-04-03', 2, 4, 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '0904520909', 'tranvanlam9161@gmail.com', '201221364', 'Ninh Bình', '2009-07-10', 2),
(00142, 'PIT', 'NV', 'Hoàng Văn', 'Tuệ', '1219820798021.png', '1938-10-04', 2, 3, 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0977231998', 'phunghuuquang9221@gmail.com', '201981648', 'Long An', '2011-01-27', 1),
(00143, 'PKT', 'NV', 'Phạm Phi', 'Linh', '1219820798003.png', '1934-12-19', 2, 1, 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '0979931405', 'dinhvochau4591@gmail.com', '201356701', 'Kiên Giang', '2008-06-15', 1),
(00144, 'PDT', 'NV', 'Lý Thành', 'Phục', '1219820798011.png', '1953-09-25', 2, 4, '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01263100594', 'daotuantuyen8221@gmail.com', '201158119', 'Đà Nẵng', '2008-04-23', 1),
(00145, 'PIT', 'NV', 'Lê Phương', 'Phúc', '1219820798008.png', '1932-07-20', 1, 3, 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '01636290441', 'lamthichau2971@gmail.com', '200968178', 'Kon Tum', '2008-11-16', 2),
(00146, 'PIT', 'NV', 'Lý Vô', 'Đạt', '1219820798005.png', '1950-09-10', 2, 3, '244 Nguyễn Duy Trinh, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '244 Nguyễn Duy Trinh, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0947305361', 'lythanhlinh6811@gmail.com', '201026844', 'Đà Nẵng', '2009-05-20', 2),
(00147, 'PNS', 'NV', 'Đăng Vô', 'Nghĩa', '1219820798015.png', '1947-01-28', 1, 4, '130/19 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '130/19 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '0942645560', 'tonhungphuc1741@gmail.com', '201189554', 'Đà Nẵng', '2012-05-12', 1),
(00148, 'PIT', 'NV', 'Đinh Thị', 'Tuyền', '1219820798017.png', '1944-03-23', 1, 1, 'Lô 165 Khu TĐC phía nam Hoàng Văn Thái, Phường Hoà Hiệp Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 165 Khu TĐC phía nam Hoàng Văn Thái, Phường Hoà Hiệp Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01662685066', 'laithichi9541@gmail.com', '201583325', 'Vĩnh Phúc', '2012-05-18', 2);
INSERT INTO `ho_so_nhan_vien` (`ma_nhan_vien`, `ma_phong_ban`, `ma_chuc_danh`, `ho_dem`, `ten`, `anh_dai_dien`, `nam_sinh`, `gioi_tinh`, `ma_tinh_trang_hon_nhan`, `que_quan`, `dan_toc`, `ma_quoc_tich`, `noi_tam_tru`, `so_dien_thoai`, `email`, `so_cmnd`, `noi_cap`, `ngay_cap`, `trang_thai`) VALUES
(00149, 'PIT', 'NV', 'Lai Thành', 'Tài', '1219820798007.png', '1990-08-29', 1, 2, 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '0982236673', 'tonhungphuong7591@gmail.com', '201443743', 'Nam Định', '2009-10-25', 2),
(00150, 'PIT', 'NV', 'Hoàng Thị', 'Sơn', '1219820798021.png', '1973-01-29', 1, 3, 'K31/12 Mẹ Nhu, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K31/12 Mẹ Nhu, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '0903294798', 'vuongphuongquang6411@gmail.com', '201819512', 'Đà Nẵng', '2011-12-03', 1),
(00151, 'PNS', 'NV', 'Nguyễn Thành', 'Bách', '1219820798002.png', '1939-12-05', 1, 1, '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01687197564', 'hoangvantue7711@gmail.com', '201469809', 'Khánh Hòa', '2009-10-07', 2),
(00152, 'PDA', 'NV', 'Bùi Phục', 'Phúc', '1219820798017.png', '1929-12-17', 2, 4, '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '01655399169', 'phamphilinh8651@gmail.com', '201484685', 'Đà Nẵng', '2011-08-19', 2),
(00153, 'PKT', 'NV', 'Tôn Phương', 'Nguyệt', '1219820798002.png', '1944-05-05', 1, 4, 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '01645857067', 'lythanhphuc5221@gmail.com', '201588038', 'Đà Nẵng', '2009-07-04', 1),
(00154, 'PNS', 'NV', 'Đinh Phương', 'Tiền', '1219820798007.png', '1962-11-19', 2, 3, 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01685628826', 'lephuongphuc9041@gmail.com', '201688464', 'Đà Nẵng', '2011-11-17', 1),
(00155, 'PKT', 'NV', 'Mai Văn', 'Tài', '1219820798017.png', '1993-02-12', 1, 2, 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '01649713688', 'lyvodat9271@gmail.com', '201936273', 'Đà Nẵng', '2008-12-28', 2),
(00156, 'PIT', 'NV', 'Lý Hưng', 'Long', '1219820798007.png', '1956-06-14', 2, 3, '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '0977824888', 'dangvonghia5211@gmail.com', '201644735', 'Đà Nẵng', '2012-03-02', 1),
(00157, 'PDT', 'NV', 'Lâm Hưng', 'Quân', '1219820798006.png', '1960-12-05', 2, 4, '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '0909529939', 'dinhthituyen1321@gmail.com', '200843853', 'Đà Nẵng', '2008-03-16', 2),
(00158, 'PKT', 'NV', 'Đỗ Hạ', 'Tuyền', '1219820798020.png', '1936-04-04', 1, 1, 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '01225241973', 'laithanhtai5891@gmail.com', '200875888', 'Đà Nẵng', '2009-01-25', 1),
(00159, 'PNS', 'NV', 'Lai Mỹ', 'Châu', '1219820798013.png', '1961-03-10', 2, 2, '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0902134602', 'hoangthison831@gmail.com', '201018594', 'Quảng Trị', '2009-03-25', 1),
(00160, 'PDA', 'NV', 'Trương Hạ', 'Thanh', '1219820798010.png', '1966-03-17', 1, 3, 'K19/8 Hoàng Hoa Thám, Phường Tân Chính, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K19/8 Hoàng Hoa Thám, Phường Tân Chính, Quận Thanh Khê, Thành phố Đà Nẵng', '0914751741', 'nguyenthanhbach441@gmail.com', '201124743', 'Hà Nội', '2011-01-22', 2),
(00161, 'PIT', 'NV', 'Tôn Tuấn', 'Lâm', '1219820798016.png', '1980-08-27', 1, 2, 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', '0934366138', 'buiphucphuc9961@gmail.com', '201416171', 'Đà Nẵng', '2009-10-22', 1),
(00162, 'PNS', 'NV', 'Đỗ Phục', 'Tiền', '1219820798021.png', '1927-03-02', 2, 2, '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '01654780392', 'tonphuongnguyet4571@gmail.com', '201833156', 'Đà Nẵng', '2009-01-10', 2),
(00163, 'PDA', 'NV', 'Hoàng Hạ', 'Tuyền', '1219820798005.png', '1960-09-09', 2, 1, '35 Cao Thắng, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '35 Cao Thắng, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', '01699098584', 'dinhphuongtien2691@gmail.com', '201209250', 'Quảng Ngãi', '2012-12-20', 1),
(00164, 'PNS', 'NV', 'Nguyễn Vô', 'Nga', '1219820798013.png', '1928-09-16', 2, 1, '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '01639248369', 'maivantai2371@gmail.com', '201729068', 'Bạc Liêu', '2008-07-19', 2),
(00165, 'PDT', 'NV', 'Phạm Bình', 'Thái', '1219820798014.png', '1941-03-15', 2, 3, '86/39 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '86/39 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '01626966001', 'lyhunglong6421@gmail.com', '201356401', 'Thừa Thiên Huế', '2011-06-05', 1),
(00166, 'PDA', 'NV', 'Triệu Hưng', 'Tiền', '1219820798002.png', '1945-04-04', 2, 2, '62 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '62 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0989931173', 'lamhungquan9571@gmail.com', '200955069', 'Đà Nẵng', '2008-12-17', 2),
(00167, 'PKT', 'NV', 'Lý Bình', 'Mạnh', '1219820798021.png', '1930-05-23', 1, 4, '47 Hồ Nghinh, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '47 Hồ Nghinh, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '01694683046', 'dohatuyen4861@gmail.com', '201550162', 'Lạng Sơn', '2010-04-25', 1),
(00168, 'PNS', 'NV', 'Triệu Phi', 'Nga', '1219820798004.png', '1977-06-13', 2, 2, 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0983050498', 'laimychau221@gmail.com', '201772112', 'Bà Rịa - Vũng Tàu', '2012-10-17', 1),
(00169, 'PDA', 'NV', 'Lê Mỹ', 'Tăng', '1219820798009.png', '1988-03-11', 2, 4, '06 Vũ Ngọc Phan, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '06 Vũ Ngọc Phan, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '01658341354', 'truonghathanh6221@gmail.com', '201776676', 'Đà Nẵng', '2010-01-07', 2),
(00170, 'PKT', 'NV', 'Trần Hưng', 'Mạnh', '1219820798002.png', '1925-04-25', 2, 2, '91 Đinh Châu, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '91 Đinh Châu, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0915070429', 'tontuanlam6071@gmail.com', '200935756', 'Đà Nẵng', '2012-04-24', 1),
(00171, 'PDA', 'NV', 'Lâm Tuấn', 'Tiền', '1219820798022.png', '1952-08-20', 1, 1, '243/12 Ngõ B Tôn Đức Thắng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '243/12 Ngõ B Tôn Đức Thắng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '01642471298', 'dophuctien9741@gmail.com', '201038745', 'Hà Nội', '2011-02-12', 1),
(00172, 'PDT', 'NV', 'Triệu Phương', 'Tài', '1219820798018.png', '1936-04-04', 2, 2, 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '0918296498', 'hoanghatuyen7511@gmail.com', '201306740', 'Đà Nẵng', '2009-08-10', 2),
(00173, 'PIT', 'NV', 'Bùi Hưng', 'Trân', '1219820798017.png', '1933-11-17', 1, 1, '144 Bùi Vịnh, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '144 Bùi Vịnh, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0936811100', 'nguyenvonga6921@gmail.com', '201248747', 'Hải Dương', '2008-10-14', 2),
(00174, 'PDA', 'NV', 'Đinh Thành', 'Châu', '1219820798012.png', '1939-06-18', 2, 4, 'Lô 18, Khu C1, Khu nhà ở Quân đội K38, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 18, Khu C1, Khu nhà ở Quân đội K38, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0962720529', 'phambinhthai461@gmail.com', '200935877', 'Cà Mau', '2012-01-12', 2),
(00175, 'PNS', 'NV', 'Trần Hạ', 'Nguyệt', '1219820798002.png', '1937-04-16', 1, 4, 'Số 25 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Số 25 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0988391086', 'trieuhungtien5151@gmail.com', '201255655', 'Đà Nẵng', '2011-02-19', 1),
(00176, 'PNS', 'NV', 'Triệu Vô', 'Lâm', '1219820798020.png', '1934-10-11', 2, 2, '115 Nguyễn Văn Linh, Phường Nam Dương, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '115 Nguyễn Văn Linh, Phường Nam Dương, Quận Hải Châu, Thành phố Đà Nẵng', '01646533210', 'lybinhmanh2551@gmail.com', '201387311', 'Đà Nẵng', '2009-05-17', 1),
(00177, 'PDT', 'NV', 'Bùi Hữu', 'Tuyền', '1219820798022.png', '1995-11-17', 1, 3, '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0988971151', 'trieuphinga3391@gmail.com', '201786204', 'Điện Biên', '2012-02-18', 1),
(00178, 'PNS', 'NV', 'Lê Bình', 'Linh', '1219820798008.png', '1983-09-06', 1, 3, '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0949537187', 'lemytang3431@gmail.com', '201174985', 'Hậu Giang', '2009-03-02', 1),
(00179, 'PNS', 'NV', 'Đồng Thành', 'Thảo', '1219820798002.png', '1926-12-09', 1, 4, '138/74/04/14/61 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '138/74/04/14/61 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01235627798', 'tranhungmanh5511@gmail.com', '201866197', 'Bình Định', '2012-08-01', 1),
(00180, 'PKT', 'NV', 'Dương Hưng', 'Quân', '1219820798021.png', '1990-06-28', 1, 4, '56 Phan Văn Đạt, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '56 Phan Văn Đạt, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '0913314267', 'lamtuantien4881@gmail.com', '201689627', 'Đắk Lắk', '2012-05-16', 1),
(00181, 'PDA', 'NV', 'Lai Hữu', 'Nga', '1219820798013.png', '1987-08-26', 2, 3, 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01632767469', 'trieuphuongtai5491@gmail.com', '201133299', 'Bắc Giang', '2009-07-10', 1),
(00182, 'PDT', 'NV', 'Nguyễn Hữu', 'Thảo', '1219820798012.png', '1974-08-11', 1, 4, 'Lô 249, Đường Hoàng Minh Thảo, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 249, Đường Hoàng Minh Thảo, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01666614597', 'buihungtran6321@gmail.com', '201786724', 'Thừa Thiên Huế', '2011-11-17', 2),
(00183, 'PNS', 'NV', 'Hoàng Phi', 'Chí', '1219820798003.png', '1998-05-14', 2, 2, 'K411/25/5 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K411/25/5 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0946733629', 'dinhthanhchau281@gmail.com', '200805379', 'Bình Dương', '2009-10-08', 2),
(00184, 'PDT', 'NV', 'Võ Thành', 'Nga', '1219820798018.png', '1977-10-11', 2, 1, '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '01205670657', 'tranhanguyet6911@gmail.com', '200973634', 'Đà Nẵng', '2009-08-11', 1),
(00185, 'PDA', 'NV', 'Đào Hưng', 'Thảo', '1219820798006.png', '1958-02-06', 1, 1, '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '01663418967', 'trieuvolam3811@gmail.com', '201162360', 'Đà Nẵng', '2011-06-18', 1),
(00186, 'PNS', 'NV', 'Tôn Mỹ', 'Thành', '1219820798012.png', '1967-02-08', 2, 2, '185 Trần Xuân Lê, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 'Kinh', 'VN', '185 Trần Xuân Lê, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '0987482498', 'buihuutuyen3281@gmail.com', '201461944', 'Đà Nẵng', '2008-05-23', 2),
(00187, 'PDT', 'NV', 'Đỗ Thành', 'Linh', '1219820798005.png', '1944-10-10', 2, 2, '39 Xuân Tâm, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '39 Xuân Tâm, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '0979097898', 'lebinhlinh7091@gmail.com', '201672629', 'Lào Cai', '2011-10-02', 1),
(00188, 'PDT', 'NV', 'Trương Thị', 'Đạt', '1219820798016.png', '1952-12-20', 2, 4, '149 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '149 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '01649826729', 'dongthanhthao791@gmail.com', '201000101', 'Tiền Giang', '2008-10-13', 1),
(00189, 'PNS', 'NV', 'Lai Văn', 'Châu', '1219820798020.png', '1934-04-17', 2, 2, '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '0964690169', 'duonghungquan4971@gmail.com', '201542234', 'Kiên Giang', '2009-10-09', 2),
(00190, 'PDA', 'NV', 'Phùng Phục', 'Nga', '1219820798011.png', '1989-09-17', 2, 2, 'Lô 526 Đô Đốc Lân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'Lô 526 Đô Đốc Lân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '0977565788', 'laihuunga7511@gmail.com', '201646355', 'Lạng Sơn', '2009-07-08', 1),
(00191, 'PNS', 'NV', 'Đào Vô', 'Trân', '1219820798021.png', '1930-06-14', 2, 3, '46 Nguyễn Đình Trọng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', '46 Nguyễn Đình Trọng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '01699904035', 'nguyenhuuthao9241@gmail.com', '201735247', 'Đà Nẵng', '2011-09-27', 2),
(00192, 'PDA', 'NV', 'Đỗ Vô', 'Bách', '1219820798008.png', '1937-07-21', 1, 2, 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '0974693703', 'hoangphichi6021@gmail.com', '201038102', 'Ninh Bình', '2009-11-09', 1),
(00193, 'PDA', 'NV', 'Trương Thị', 'Tiền', '1219820798018.png', '1969-06-16', 2, 1, '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '0964118879', 'vothanhnga3721@gmail.com', '201877426', 'Bình Định', '2009-07-09', 1),
(00194, 'PIT', 'NV', 'Trương Phi', 'Mạnh', '1219820798016.png', '1984-02-18', 2, 2, '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', 'Kinh', 'VN', '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '0979697846', 'daohungthao9641@gmail.com', '200844276', 'Điện Biên', '2012-01-19', 2),
(00195, 'PDT', 'NV', 'Bùi Văn', 'Nga', '1219820798007.png', '1974-11-01', 2, 2, '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01643148498', 'tonmythanh7041@gmail.com', '201067460', 'Đà Nẵng', '2011-02-26', 2),
(00196, 'PDT', 'NV', 'Hoàng Bình', 'Tăng', '1219820798002.png', '1993-01-20', 1, 1, '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '0948123062', 'dothanhlinh7161@gmail.com', '201601257', 'Đà Nẵng', '2008-09-18', 1),
(00197, 'PDT', 'NV', 'Dương Thành', 'Mạnh', '1219820798014.png', '1953-04-08', 1, 2, '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '0902271303', 'truongthidat5611@gmail.com', '201803181', 'Khánh Hòa', '2010-08-27', 2),
(00198, 'PKT', 'NV', 'Đăng Thị', 'Châu', '1219820798011.png', '1980-04-06', 2, 4, '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 'Kinh', 'VN', '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '01626590658', 'laivanchau4271@gmail.com', '201690828', 'Bà Rịa - Vũng Tàu', '2008-08-01', 2),
(00199, 'PDA', 'NV', 'Đỗ Bình', 'Linh', '1219820798003.png', '1998-03-22', 1, 4, 'K854/07 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K854/07 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '01273311545', 'phungphucnga31@gmail.com', '201512701', 'Đà Nẵng', '2011-08-06', 2),
(00200, 'PDA', 'NV', 'Vương Mỹ', 'Phúc', '1219820798020.png', '1960-05-23', 2, 2, 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 'Kinh', 'VN', 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '01628151156', 'daovotran6941@gmail.com', '200916550', 'Yên Bái', '2010-09-26', 2),
(00201, 'PNS', 'NV', 'Dương Hưng', 'Chí', '1219820798017.png', '1939-01-05', 2, 1, '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 'Kinh', 'VN', '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '0982735661', 'dovobach9031@gmail.com', '201476741', 'Quảng Nam', '2008-07-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khach_hang`
--

CREATE TABLE IF NOT EXISTS `khach_hang` (
  `ma_khach_hang` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_khach_hang` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dia_chi` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nghiep_vu` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` int(12) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khach_hang`
--

INSERT INTO `khach_hang` (`ma_khach_hang`, `ten_khach_hang`, `dia_chi`, `nghiep_vu`, `phone_number`, `email`, `is_delete`) VALUES
('KH001', 'Công ty thép Hòa An', '18 - Ngô Thì Nhậm - Đà Nẵng', 'Kinh doanh ', 511436634, 'hoaanct@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loai_hop_dong`
--

CREATE TABLE IF NOT EXISTS `loai_hop_dong` (
  `ma_loai_hop_dong` int(5) NOT NULL,
  `ten_hop_dong` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loai_hop_dong`
--

INSERT INTO `loai_hop_dong` (`ma_loai_hop_dong`, `ten_hop_dong`) VALUES
(1, 'Hợp đồng thử việc'),
(2, 'Hợp đồng chính thức');

-- --------------------------------------------------------

--
-- Table structure for table `nghiep_vu`
--

CREATE TABLE IF NOT EXISTS `nghiep_vu` (
  `ma_nghiep_vu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_nghiep_vu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nghiep_vu`
--

INSERT INTO `nghiep_vu` (`ma_nghiep_vu`, `ten_nghiep_vu`, `is_delete`) VALUES
('1', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ngon_ngu`
--

CREATE TABLE IF NOT EXISTS `ngon_ngu` (
  `ma_ngon_ngu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_ngon_ngu` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ngon_ngu`
--

INSERT INTO `ngon_ngu` (`ma_ngon_ngu`, `ten_ngon_ngu`, `is_delete`) VALUES
('PL01', 'Java', 0),
('PL02', 'C#', 0),
('PL03', 'NodeJS', 0),
('PL04', 'AngularJS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ngon_ngu_du_an`
--

CREATE TABLE IF NOT EXISTS `ngon_ngu_du_an` (
  `ma_ngon_ngu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ma_du_an` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ngon_ngu_du_an`
--

INSERT INTO `ngon_ngu_du_an` (`ma_ngon_ngu`, `ma_du_an`) VALUES
('PL01', 1),
('PL01', 2),
('PL01', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nhiem_vu`
--

CREATE TABLE IF NOT EXISTS `nhiem_vu` (
  `ma_vai_tro` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ma_nhan_vien` int(11) NOT NULL DEFAULT '0',
  `ma_du_an` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhiem_vu`
--

INSERT INTO `nhiem_vu` (`ma_vai_tro`, `ma_nhan_vien`, `ma_du_an`) VALUES
('VT01', 1, 1),
('VT02', 1, 1),
('VT02', 1, 2),
('VT02', 2, 1),
('VT02', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `phong_ban`
--

CREATE TABLE IF NOT EXISTS `phong_ban` (
  `ma_phong_ban` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_phong_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phong_ban`
--

INSERT INTO `phong_ban` (`ma_phong_ban`, `ten_phong_ban`) VALUES
('PDA', 'Phòng Dự án'),
('PDT', 'Phòng Đào tạo'),
('PGD', 'Phòng Giám đốc'),
('PIT', 'Phòng IT'),
('PKT', 'Phòng Kế toán'),
('PNS', 'Phòng Nhân sự');

-- --------------------------------------------------------

--
-- Table structure for table `quoc_tich`
--

CREATE TABLE IF NOT EXISTS `quoc_tich` (
  `ma_quoc_tich` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_quoc_tich` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quoc_tich`
--

INSERT INTO `quoc_tich` (`ma_quoc_tich`, `ten_quoc_tich`) VALUES
('AD', 'Andorra'),
('AE', 'United Arab Emirates'),
('AF', 'Afghanistan'),
('AG', 'Antigua And Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albania'),
('AM', 'Armenia'),
('AN', 'Netherlands Antilles'),
('AO', 'Angola'),
('AQ', 'Antarctica'),
('AR', 'Argentina'),
('AS', 'American Samoa'),
('AT', 'Austria'),
('AU', 'Australia'),
('AW', 'Aruba'),
('AX', 'Åland Islands'),
('AZ', 'Azerbaijan'),
('BA', 'Bosnia And Herzegovina'),
('BB', 'Barbados'),
('BD', 'Bangladesh'),
('BE', 'Belgium'),
('BF', 'Burkina Faso'),
('BG', 'Bulgaria'),
('BH', 'Bahrain'),
('BI', 'Burundi'),
('BJ', 'Benin'),
('BM', 'Bermuda'),
('BN', 'Brunei Darussalam'),
('BO', 'Bolivia'),
('BR', 'Brazil'),
('BS', 'Bahamas'),
('BT', 'Bhutan'),
('BV', 'Bouvet Island'),
('BW', 'Botswana'),
('BY', 'Belarus'),
('BZ', 'Belize'),
('CA', 'Canada'),
('CC', 'Cocos (Keeling) Islands'),
('CD', 'Congo, The Democratic Republic Of The'),
('CF', 'Central African Republic'),
('CG', 'Congo'),
('CH', 'Switzerland'),
('CI', 'Côte D''Ivoire'),
('CK', 'Cook Islands'),
('CL', 'Chile'),
('CM', 'Cameroon'),
('CN', 'China'),
('CO', 'Colombia'),
('CR', 'Costa Rica'),
('CS', 'Serbia And Montenegro'),
('CU', 'Cuba'),
('CV', 'Cape Verde'),
('CX', 'Christmas Island'),
('CY', 'Cyprus'),
('CZ', 'Czech Republic'),
('DE', 'Germany'),
('DJ', 'Djibouti'),
('DK', 'Denmark'),
('DM', 'Dominica'),
('DO', 'Dominican Republic'),
('DZ', 'Algeria'),
('EC', 'Ecuador'),
('EE', 'Estonia'),
('EG', 'Egypt'),
('EH', 'Western Sahara'),
('ER', 'Eritrea'),
('ES', 'Spain'),
('ET', 'Ethiopia'),
('FI', 'Finland'),
('FJ', 'Fiji'),
('FK', 'Falkland Islands (Malvinas)'),
('FM', 'Micronesia, Federated States Of'),
('FO', 'Faroe Islands'),
('FR', 'France'),
('GA', 'Gabon'),
('GB', 'United Kingdom'),
('GD', 'Grenada'),
('GE', 'Georgia'),
('GF', 'French Guiana'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GL', 'Greenland'),
('GM', 'Gambia'),
('GN', 'Guinea'),
('GP', 'Guadeloupe'),
('GQ', 'Equatorial Guinea'),
('GR', 'Greece'),
('GS', 'South Georgia And The South Sandwich Islands'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HK', 'Hong Kong'),
('HM', 'Heard Island And Mcdonald Islands'),
('HN', 'Honduras'),
('HR', 'Croatia'),
('HT', 'Haiti'),
('HU', 'Hungary'),
('ID', 'Indonesia'),
('IE', 'Ireland'),
('IL', 'Israel'),
('IN', 'India'),
('IO', 'British Indian Ocean Territory'),
('IQ', 'Iraq'),
('IR', 'Iran, Islamic Republic Of'),
('IS', 'Iceland'),
('IT', 'Italy'),
('JM', 'Jamaica'),
('JO', 'Jordan'),
('JP', 'Japan'),
('KE', 'Kenya'),
('KG', 'Kyrgyzstan'),
('KH', 'Cambodia'),
('KI', 'Kiribati'),
('KM', 'Comoros'),
('KN', 'Saint Kitts And Nevis'),
('KP', 'Korea, Democratic People''S Republic Of'),
('KR', 'Korea, Republic Of'),
('KW', 'Kuwait'),
('KY', 'Cayman Islands'),
('KZ', 'Kazakhstan'),
('LA', 'Lao People''S Democratic Republic'),
('LB', 'Lebanon'),
('LC', 'Saint Lucia'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Liberia'),
('LS', 'Lesotho'),
('LT', 'Lithuania'),
('LU', 'Luxembourg'),
('LV', 'Latvia'),
('LY', 'Libyan Arab Jamahiriya'),
('MA', 'Morocco'),
('MC', 'Monaco'),
('MD', 'Moldova, Republic Of'),
('MG', 'Madagascar'),
('MH', 'Marshall Islands'),
('MK', 'Macedonia, The Former Yugoslav Republic Of'),
('ML', 'Mali'),
('MM', 'Myanmar'),
('MN', 'Mongolia'),
('MO', 'Macao'),
('MP', 'Northern Mariana Islands'),
('MQ', 'Martinique'),
('MR', 'Mauritania'),
('MS', 'Montserrat'),
('MT', 'Malta'),
('MU', 'Mauritius'),
('MV', 'Maldives'),
('MW', 'Malawi'),
('MX', 'Mexico'),
('MY', 'Malaysia'),
('MZ', 'Mozambique'),
('NA', 'Namibia'),
('NC', 'New Caledonia'),
('NE', 'Niger'),
('NF', 'Norfolk Island'),
('NG', 'Nigeria'),
('NI', 'Nicaragua'),
('NL', 'Netherlands'),
('NO', 'Norway'),
('NP', 'Nepal'),
('NR', 'Nauru'),
('NU', 'Niue'),
('NZ', 'New Zealand'),
('OM', 'Oman'),
('PA', 'Panama'),
('PE', 'Peru'),
('PF', 'French Polynesia'),
('PG', 'Papua New Guinea'),
('PH', 'Philippines'),
('PK', 'Pakistan'),
('PL', 'Poland'),
('PM', 'Saint Pierre And Miquelon'),
('PN', 'Pitcairn'),
('PR', 'Puerto Rico'),
('PS', 'Palestinian Territory, Occupied'),
('PT', 'Portugal'),
('PW', 'Palau'),
('PY', 'Paraguay'),
('QA', 'Qatar'),
('RE', 'Réunion'),
('RO', 'Romania'),
('RU', 'Russian Federation'),
('RW', 'Rwanda'),
('SA', 'Saudi Arabia'),
('SB', 'Solomon Islands'),
('SC', 'Seychelles'),
('SD', 'Sudan'),
('SE', 'Sweden'),
('SG', 'Singapore'),
('SH', 'Saint Helena'),
('SI', 'Slovenia'),
('SJ', 'Svalbard And Jan Mayen'),
('SK', 'Slovakia'),
('SL', 'Sierra Leone'),
('SM', 'San Marino'),
('SN', 'Senegal'),
('SO', 'Somalia'),
('SR', 'Suriname'),
('ST', 'Sao Tome And Principe'),
('SV', 'El Salvador'),
('SY', 'Syrian Arab Republic'),
('SZ', 'Swaziland'),
('TC', 'Turks And Caicos Islands'),
('TD', 'Chad'),
('TF', 'French Southern Territories'),
('TG', 'Togo'),
('TH', 'Thailand'),
('TJ', 'Tajikistan'),
('TK', 'Tokelau'),
('TL', 'Timor-Leste'),
('TM', 'Turkmenistan'),
('TN', 'Tunisia'),
('TO', 'Tonga'),
('TR', 'Turkey'),
('TT', 'Trinidad And Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taiwan, Province Of China'),
('TZ', 'Tanzania, United Republic Of'),
('UA', 'Ukraine'),
('UG', 'Uganda'),
('UM', 'United States Minor Outlying Islands'),
('US', 'United States'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistan'),
('VA', 'Holy See (Vatican City State)'),
('VC', 'Saint Vincent And The Grenadines'),
('VE', 'Venezuela'),
('VG', 'Virgin Islands, British'),
('VI', 'Virgin Islands, U.S.'),
('VN', 'Viet Nam'),
('VU', 'Vanuatu'),
('WF', 'Wallis And Futuna'),
('WS', 'Samoa'),
('YE', 'Yemen'),
('YT', 'Mayotte'),
('ZA', 'South Africa'),
('ZM', 'Zambia'),
('ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `ma_role` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ma_role`, `name`) VALUES
(1, 'ROLE_PNS'),
(2, 'ROLE_PGD'),
(3, 'ROLE_TPPDA'),
(4, 'ROLE_TPPDT'),
(5, 'ROLE_TPPIT'),
(6, 'ROLE_TPPKT'),
(7, 'ROLE_TPPNS'),
(8, 'ROLE_NV');

-- --------------------------------------------------------

--
-- Table structure for table `thong_tin_bang_cap`
--

CREATE TABLE IF NOT EXISTS `thong_tin_bang_cap` (
  `id` int(11) NOT NULL,
  `ma_nhan_vien` int(5) unsigned zerofill NOT NULL,
  `ten_bang_cap` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `loai_bang_cap` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `don_vi_cap` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_cap` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thong_tin_bang_cap`
--

INSERT INTO `thong_tin_bang_cap` (`id`, `ma_nhan_vien`, `ten_bang_cap`, `loai_bang_cap`, `don_vi_cap`, `ngay_cap`) VALUES
(1, 00201, 'Cử nhân công nghệ thông tin', 'Khá', 'Cao đẳng công nghệ thông tin', '2016-06-20'),
(2, 00196, 'Cử nhân công nghệ thông tin', 'Giỏi', 'Cao đẳng công nghệ thông tin', '2016-06-12'),
(3, 00193, 'Cử nhân công nghệ thông tin', 'Trung bình', 'Cao đẳng công nghệ thông tin', '2016-06-28'),
(4, 00192, 'Cử nhân tài chính doanh nghiệp', 'Khá', 'Đại học kinh tế', '2015-06-29'),
(5, 00190, 'Cử nhân kinh doanh', 'Khá', 'Đại học kinh tế', '2015-06-28'),
(6, 00188, 'Cử nhân tài chính doanh nghiệp', 'Giỏi', 'Đại học kinh tế', '2014-05-29'),
(7, 00187, 'Cử nhân toán ứng dụng', 'Giỏi', 'Đại học sư phạm', '2016-06-13'),
(8, 00185, 'Cử nhân kinh tế', 'Giỏi', 'Đại học kinh tế', '2013-05-23'),
(9, 00184, 'Cử nhân công nghệ thông tin', 'Khá', 'Đại học bách khoa Đà Nẵng', '2011-05-24'),
(10, 00181, 'Cử nhân công nghệ thông tin', 'Giỏi', 'Cao đẳng công nghệ thông tin', '2014-04-12'),
(11, 00001, 'Cử nhân tài chính doanh nghiệp', 'Giỏi', 'Đại học bách khoa Đà Nẵng', '1999-04-12'),
(12, 00010, 'Cử nhân kinh tế', 'Khá', 'Đại học kinh tế', '2018-08-01'),
(13, 00003, 'Cử nhân toán ứng dụng', 'Giỏi', 'Đại học sư phạm', '2018-08-24'),
(14, 00004, 'Cử nhân tài chính doanh nghiệp', 'Khá', 'Đại học kinh tế', '2016-07-06'),
(15, 00005, 'Cử nhân công nghệ thông tin', 'Giỏi', 'Cao đẳng công nghệ thông tin', '2017-08-11'),
(16, 00006, 'Cử nhân kinh tế', 'Khá', 'Đại học kinh tế', '2018-03-08'),
(17, 00007, 'Cử nhân toán ứng dụng', 'Khá', 'Đại học sư phạm', '2017-06-09'),
(18, 00008, 'Cử nhân kinh tế', 'Khá', 'Đại học kinh tế', '2018-02-16'),
(19, 00009, 'Cử nhân tài chính doanh nghiệp', 'Khá', 'Đại học kinh tế', '2018-04-12'),
(21, 00201, 'Cử nhân kinh tế', 'Khá', 'Đại học kinh tế', '2018-08-03');

-- --------------------------------------------------------

--
-- Table structure for table `thong_tin_gia_dinh`
--

CREATE TABLE IF NOT EXISTS `thong_tin_gia_dinh` (
  `id` int(11) NOT NULL,
  `ma_nhan_vien` int(5) unsigned zerofill NOT NULL,
  `ten` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ho_dem` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `que_quan` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nam_sinh` date NOT NULL,
  `gioi_tinh` int(1) NOT NULL,
  `so_dien_thoai` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `quan_he` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thong_tin_gia_dinh`
--

INSERT INTO `thong_tin_gia_dinh` (`id`, `ma_nhan_vien`, `ten`, `ho_dem`, `que_quan`, `nam_sinh`, `gioi_tinh`, `so_dien_thoai`, `quan_he`) VALUES
(1, 00001, 'Việt', 'Đặng Văn', 'Đà Nẵng', '1992-05-07', 1, '01266676809', 'Anh'),
(2, 00002, 'Trang', 'Lê Thị Huyền', '128 Trần Văn Hai, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(3, 00002, 'Hoàng', 'Lê Minh', '128 Trần Văn Hai, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(4, 00003, 'Trang', 'Lê Thị Huyền', '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(5, 00003, 'Hoàng', 'Lê Minh', '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(6, 00004, 'Trang', 'Lê Thị Huyền', '06 Nguyễn Lý, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(7, 00004, 'Hoàng', 'Lê Minh', '06 Nguyễn Lý, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(8, 00005, 'Trang', 'Lê Thị Huyền', '56 Lê Hồng Phong, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(9, 00005, 'Hoàng', 'Lê Minh', '56 Lê Hồng Phong, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(10, 00006, 'Trang', 'Lê Thị Huyền', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(11, 00006, 'Hoàng', 'Lê Minh', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(12, 00007, 'Trang', 'Lê Thị Huyền', '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(13, 00007, 'Hoàng', 'Lê Minh', '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(14, 00008, 'Trang', 'Lê Thị Huyền', 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(15, 00008, 'Hoàng', 'Lê Minh', 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(16, 00009, 'Trang', 'Lê Thị Huyền', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(17, 00009, 'Hoàng', 'Lê Minh', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(18, 00010, 'Trang', 'Lê Thị Huyền', 'K122/22 Trưng Nữ Vương, Phường Bình Hiên, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(19, 00010, 'Hoàng', 'Lê Minh', 'K122/22 Trưng Nữ Vương, Phường Bình Hiên, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(20, 00011, 'Trang', 'Lê Thị Huyền', 'Lô A2.10 đường 30/4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(21, 00011, 'Hoàng', 'Lê Minh', 'Lô A2.10 đường 30/4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(22, 00012, 'Trang', 'Lê Thị Huyền', '278-280 Xô Viết Nghệ Tĩnh, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(23, 00012, 'Hoàng', 'Lê Minh', '278-280 Xô Viết Nghệ Tĩnh, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(24, 00013, 'Trang', 'Lê Thị Huyền', '11 Phạm Kiệt, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(25, 00013, 'Hoàng', 'Lê Minh', '11 Phạm Kiệt, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(26, 00014, 'Trang', 'Lê Thị Huyền', '356/19 Ngũ Hành Sơn, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(27, 00014, 'Hoàng', 'Lê Minh', '356/19 Ngũ Hành Sơn, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(28, 00015, 'Trang', 'Lê Thị Huyền', '500 Trần Cao Vân, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(29, 00015, 'Hoàng', 'Lê Minh', '500 Trần Cao Vân, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(30, 00016, 'Trang', 'Lê Thị Huyền', '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(31, 00016, 'Hoàng', 'Lê Minh', '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(32, 00017, 'Trang', 'Lê Thị Huyền', '74/7/24 Ngô Thị Nhậm, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(33, 00017, 'Hoàng', 'Lê Minh', '74/7/24 Ngô Thị Nhậm, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(34, 00018, 'Trang', 'Lê Thị Huyền', '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(35, 00018, 'Hoàng', 'Lê Minh', '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(36, 00019, 'Trang', 'Lê Thị Huyền', 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(37, 00019, 'Hoàng', 'Lê Minh', 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(38, 00020, 'Trang', 'Lê Thị Huyền', 'K80/47 Lê Hữu Trác, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(39, 00020, 'Hoàng', 'Lê Minh', 'K80/47 Lê Hữu Trác, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(40, 00021, 'Trang', 'Lê Thị Huyền', '755 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(41, 00021, 'Hoàng', 'Lê Minh', '755 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(42, 00022, 'Trang', 'Lê Thị Huyền', '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(43, 00022, 'Hoàng', 'Lê Minh', '693A/42 Trần Cao Vân, Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(44, 00023, 'Trang', 'Lê Thị Huyền', '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(45, 00023, 'Hoàng', 'Lê Minh', '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(46, 00024, 'Trang', 'Lê Thị Huyền', 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(47, 00024, 'Hoàng', 'Lê Minh', 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(48, 00025, 'Trang', 'Lê Thị Huyền', 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(49, 00025, 'Hoàng', 'Lê Minh', 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(50, 00026, 'Trang', 'Lê Thị Huyền', '74 Nguyễn Quyền, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(51, 00026, 'Hoàng', 'Lê Minh', '74 Nguyễn Quyền, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(52, 00027, 'Trang', 'Lê Thị Huyền', '255 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(53, 00027, 'Hoàng', 'Lê Minh', '255 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(54, 00028, 'Trang', 'Lê Thị Huyền', 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(55, 00028, 'Hoàng', 'Lê Minh', 'Lô 50-B1.108 Khu Đô Thị Sinh Thái Ven Sông Hòa Xuân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(56, 00029, 'Trang', 'Lê Thị Huyền', '454/4 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(57, 00029, 'Hoàng', 'Lê Minh', '454/4 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(58, 00030, 'Trang', 'Lê Thị Huyền', '395 Võ An Ninh, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(59, 00030, 'Hoàng', 'Lê Minh', '395 Võ An Ninh, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(60, 00031, 'Trang', 'Lê Thị Huyền', 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(61, 00031, 'Hoàng', 'Lê Minh', 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(62, 00032, 'Trang', 'Lê Thị Huyền', '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(63, 00032, 'Hoàng', 'Lê Minh', '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(64, 00033, 'Trang', 'Lê Thị Huyền', '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(65, 00033, 'Hoàng', 'Lê Minh', '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(66, 00034, 'Trang', 'Lê Thị Huyền', '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(67, 00034, 'Hoàng', 'Lê Minh', '97/33 Cách Mạng Tháng Tám, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(68, 00035, 'Trang', 'Lê Thị Huyền', '1254 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(69, 00035, 'Hoàng', 'Lê Minh', '1254 Xô Viết Nghệ Tĩnh, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(70, 00036, 'Trang', 'Lê Thị Huyền', 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(71, 00036, 'Hoàng', 'Lê Minh', 'Số 10 An Thượng 36, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(72, 00037, 'Trang', 'Lê Thị Huyền', 'K81/4 Trần Ngọc Sương, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(73, 00037, 'Hoàng', 'Lê Minh', 'K81/4 Trần Ngọc Sương, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(74, 00038, 'Trang', 'Lê Thị Huyền', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(75, 00038, 'Hoàng', 'Lê Minh', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(76, 00039, 'Trang', 'Lê Thị Huyền', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(77, 00039, 'Hoàng', 'Lê Minh', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(78, 00040, 'Trang', 'Lê Thị Huyền', 'Lô 50- B2.1 Cụm dân cư phía Bắc Tu Viện Phao Lô, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(79, 00040, 'Hoàng', 'Lê Minh', 'Lô 50- B2.1 Cụm dân cư phía Bắc Tu Viện Phao Lô, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(80, 00041, 'Trang', 'Lê Thị Huyền', '31 Hà Bổng, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(81, 00041, 'Hoàng', 'Lê Minh', '31 Hà Bổng, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(82, 00042, 'Trang', 'Lê Thị Huyền', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(83, 00042, 'Hoàng', 'Lê Minh', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(84, 00043, 'Trang', 'Lê Thị Huyền', '73-75 Dương Đình Nghệ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(85, 00043, 'Hoàng', 'Lê Minh', '73-75 Dương Đình Nghệ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(86, 00044, 'Trang', 'Lê Thị Huyền', '183 Hoàng Đức Lương, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(87, 00044, 'Hoàng', 'Lê Minh', '183 Hoàng Đức Lương, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(88, 00045, 'Trang', 'Lê Thị Huyền', '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(89, 00045, 'Hoàng', 'Lê Minh', '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(90, 00046, 'Trang', 'Lê Thị Huyền', '216 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(91, 00046, 'Hoàng', 'Lê Minh', '216 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(92, 00047, 'Trang', 'Lê Thị Huyền', 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(93, 00047, 'Hoàng', 'Lê Minh', 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(94, 00048, 'Trang', 'Lê Thị Huyền', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(95, 00048, 'Hoàng', 'Lê Minh', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(96, 00049, 'Trang', 'Lê Thị Huyền', '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(97, 00049, 'Hoàng', 'Lê Minh', '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(98, 00050, 'Trang', 'Lê Thị Huyền', 'Nhà số A2.7, Khu biệt thự Đảo Xanh, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(99, 00050, 'Hoàng', 'Lê Minh', 'Nhà số A2.7, Khu biệt thự Đảo Xanh, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(100, 00051, 'Trang', 'Lê Thị Huyền', '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(101, 00051, 'Hoàng', 'Lê Minh', '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(102, 00052, 'Trang', 'Lê Thị Huyền', 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(103, 00052, 'Hoàng', 'Lê Minh', 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(104, 00053, 'Trang', 'Lê Thị Huyền', '112 Hải Hồ, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(105, 00053, 'Hoàng', 'Lê Minh', '112 Hải Hồ, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(106, 00054, 'Trang', 'Lê Thị Huyền', '190 Phạm Cự Lượng, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(107, 00054, 'Hoàng', 'Lê Minh', '190 Phạm Cự Lượng, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(108, 00055, 'Trang', 'Lê Thị Huyền', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(109, 00055, 'Hoàng', 'Lê Minh', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(110, 00056, 'Trang', 'Lê Thị Huyền', '21 Phan Tốn, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(111, 00056, 'Hoàng', 'Lê Minh', '21 Phan Tốn, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(112, 00057, 'Trang', 'Lê Thị Huyền', 'Lô 12 Phước Trường 16, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(113, 00057, 'Hoàng', 'Lê Minh', 'Lô 12 Phước Trường 16, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(114, 00058, 'Trang', 'Lê Thị Huyền', 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(115, 00058, 'Hoàng', 'Lê Minh', 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(116, 00059, 'Trang', 'Lê Thị Huyền', '36 Sơn Thủy 3, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(117, 00059, 'Hoàng', 'Lê Minh', '36 Sơn Thủy 3, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(118, 00060, 'Trang', 'Lê Thị Huyền', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(119, 00060, 'Hoàng', 'Lê Minh', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(120, 00061, 'Trang', 'Lê Thị Huyền', '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(121, 00061, 'Hoàng', 'Lê Minh', '109 Mẹ Thứ, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(122, 00062, 'Trang', 'Lê Thị Huyền', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(123, 00062, 'Hoàng', 'Lê Minh', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(124, 00063, 'Trang', 'Lê Thị Huyền', 'Kiệt A379/6 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(125, 00063, 'Hoàng', 'Lê Minh', 'Kiệt A379/6 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(126, 00064, 'Trang', 'Lê Thị Huyền', '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(127, 00064, 'Hoàng', 'Lê Minh', '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(128, 00065, 'Trang', 'Lê Thị Huyền', '37 Hà Huy Tập, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(129, 00065, 'Hoàng', 'Lê Minh', '37 Hà Huy Tập, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(130, 00066, 'Trang', 'Lê Thị Huyền', '111 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(131, 00066, 'Hoàng', 'Lê Minh', '111 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(132, 00067, 'Trang', 'Lê Thị Huyền', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(133, 00067, 'Hoàng', 'Lê Minh', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(134, 00068, 'Trang', 'Lê Thị Huyền', 'Lô A11-1, đường số 4, Khu công nghệ cao Đà Nẵng, Xã Hoà Liên, Huyện Hoà Vang, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(135, 00068, 'Hoàng', 'Lê Minh', 'Lô A11-1, đường số 4, Khu công nghệ cao Đà Nẵng, Xã Hoà Liên, Huyện Hoà Vang, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(136, 00069, 'Trang', 'Lê Thị Huyền', '34 Lỗ Giáng 16, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(137, 00069, 'Hoàng', 'Lê Minh', '34 Lỗ Giáng 16, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(138, 00070, 'Trang', 'Lê Thị Huyền', 'K03/09 Dũng Sĩ Thanh Khê, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(139, 00070, 'Hoàng', 'Lê Minh', 'K03/09 Dũng Sĩ Thanh Khê, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(140, 00071, 'Trang', 'Lê Thị Huyền', 'Lô 39 Đường Sơn Thủy 12, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(141, 00071, 'Hoàng', 'Lê Minh', 'Lô 39 Đường Sơn Thủy 12, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(142, 00072, 'Trang', 'Lê Thị Huyền', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(143, 00072, 'Hoàng', 'Lê Minh', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(144, 00073, 'Trang', 'Lê Thị Huyền', '89 Hà Mục, Tổ 55, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(145, 00073, 'Hoàng', 'Lê Minh', '89 Hà Mục, Tổ 55, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(146, 00074, 'Trang', 'Lê Thị Huyền', '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(147, 00074, 'Hoàng', 'Lê Minh', '1999 Nguyễn Tất Thành, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(148, 00075, 'Trang', 'Lê Thị Huyền', '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(149, 00075, 'Hoàng', 'Lê Minh', '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(150, 00076, 'Trang', 'Lê Thị Huyền', '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(151, 00076, 'Hoàng', 'Lê Minh', '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(152, 00077, 'Trang', 'Lê Thị Huyền', '12 Nam Thọ 2, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(153, 00077, 'Hoàng', 'Lê Minh', '12 Nam Thọ 2, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(154, 00078, 'Trang', 'Lê Thị Huyền', '31 Trần Phú, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(155, 00078, 'Hoàng', 'Lê Minh', '31 Trần Phú, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(156, 00079, 'Trang', 'Lê Thị Huyền', 'K340/9 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(157, 00079, 'Hoàng', 'Lê Minh', 'K340/9 Nguyễn Tri Phương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(158, 00080, 'Trang', 'Lê Thị Huyền', 'Số 35 Thái Phiên, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(159, 00080, 'Hoàng', 'Lê Minh', 'Số 35 Thái Phiên, Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(160, 00081, 'Trang', 'Lê Thị Huyền', '40A Nguyễn Thiện Kế, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(161, 00081, 'Hoàng', 'Lê Minh', '40A Nguyễn Thiện Kế, Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(162, 00082, 'Trang', 'Lê Thị Huyền', '91 Ngô Nhân Tịnh, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(163, 00082, 'Hoàng', 'Lê Minh', '91 Ngô Nhân Tịnh, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(164, 00083, 'Trang', 'Lê Thị Huyền', 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(165, 00083, 'Hoàng', 'Lê Minh', 'K434/23 Núi Thành, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(166, 00084, 'Trang', 'Lê Thị Huyền', 'Lô D8-108 Khu dân cư đô thị mới nam cầu Cẩm Lệ, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(167, 00084, 'Hoàng', 'Lê Minh', 'Lô D8-108 Khu dân cư đô thị mới nam cầu Cẩm Lệ, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(168, 00085, 'Trang', 'Lê Thị Huyền', '152/40B Phan Thanh, Phường Thạc Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(169, 00085, 'Hoàng', 'Lê Minh', '152/40B Phan Thanh, Phường Thạc Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(170, 00086, 'Trang', 'Lê Thị Huyền', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(171, 00086, 'Hoàng', 'Lê Minh', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(172, 00087, 'Trang', 'Lê Thị Huyền', 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(173, 00087, 'Hoàng', 'Lê Minh', 'K634/73/32 Trưng Nữ Vương, Phường Hoà Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(174, 00088, 'Trang', 'Lê Thị Huyền', '93 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(175, 00088, 'Hoàng', 'Lê Minh', '93 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(176, 00089, 'Trang', 'Lê Thị Huyền', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(177, 00089, 'Hoàng', 'Lê Minh', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(178, 00090, 'Trang', 'Lê Thị Huyền', 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(179, 00090, 'Hoàng', 'Lê Minh', 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(180, 00091, 'Trang', 'Lê Thị Huyền', '27 Nguyễn Minh Không, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(181, 00091, 'Hoàng', 'Lê Minh', '27 Nguyễn Minh Không, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(182, 00092, 'Trang', 'Lê Thị Huyền', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(183, 00092, 'Hoàng', 'Lê Minh', '375/31 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(184, 00093, 'Trang', 'Lê Thị Huyền', 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(185, 00093, 'Hoàng', 'Lê Minh', 'K72/32 Ngọc Hân, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(186, 00094, 'Trang', 'Lê Thị Huyền', '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(187, 00094, 'Hoàng', 'Lê Minh', '115 Trần Văn Ơn, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(188, 00095, 'Trang', 'Lê Thị Huyền', '18 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(189, 00095, 'Hoàng', 'Lê Minh', '18 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(190, 00096, 'Trang', 'Lê Thị Huyền', '372/51 Phan Châu Trinh, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(191, 00096, 'Hoàng', 'Lê Minh', '372/51 Phan Châu Trinh, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(192, 00097, 'Trang', 'Lê Thị Huyền', '64 Lê Văn Hưu, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(193, 00097, 'Hoàng', 'Lê Minh', '64 Lê Văn Hưu, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(194, 00098, 'Trang', 'Lê Thị Huyền', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(195, 00098, 'Hoàng', 'Lê Minh', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(196, 00099, 'Trang', 'Lê Thị Huyền', 'Lô A-110 KDC dọc tuyến đường Trường Sa, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(197, 00099, 'Hoàng', 'Lê Minh', 'Lô A-110 KDC dọc tuyến đường Trường Sa, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(198, 00100, 'Trang', 'Lê Thị Huyền', 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(199, 00100, 'Hoàng', 'Lê Minh', 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(200, 00101, 'Trang', 'Lê Thị Huyền', '247 Nguyễn Sắc Kim, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(201, 00101, 'Hoàng', 'Lê Minh', '247 Nguyễn Sắc Kim, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(202, 00102, 'Trang', 'Lê Thị Huyền', '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(203, 00102, 'Hoàng', 'Lê Minh', '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(204, 00103, 'Trang', 'Lê Thị Huyền', 'K149/69 Lê Đình Lý, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(205, 00103, 'Hoàng', 'Lê Minh', 'K149/69 Lê Đình Lý, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(206, 00104, 'Trang', 'Lê Thị Huyền', 'K394/7 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(207, 00104, 'Hoàng', 'Lê Minh', 'K394/7 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(208, 00105, 'Trang', 'Lê Thị Huyền', 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(209, 00105, 'Hoàng', 'Lê Minh', 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(210, 00106, 'Trang', 'Lê Thị Huyền', '37 Cẩm Bắc 4, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(211, 00106, 'Hoàng', 'Lê Minh', '37 Cẩm Bắc 4, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(212, 00107, 'Trang', 'Lê Thị Huyền', 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(213, 00107, 'Hoàng', 'Lê Minh', 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(214, 00108, 'Trang', 'Lê Thị Huyền', '20 Nguyễn Tạo, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(215, 00108, 'Hoàng', 'Lê Minh', '20 Nguyễn Tạo, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(216, 00109, 'Trang', 'Lê Thị Huyền', 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(217, 00109, 'Hoàng', 'Lê Minh', 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(218, 00110, 'Trang', 'Lê Thị Huyền', '79 Hồ Tùng Mậu, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(219, 00110, 'Hoàng', 'Lê Minh', '79 Hồ Tùng Mậu, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(220, 00111, 'Trang', 'Lê Thị Huyền', 'Lô 61-62 B2.15 An Thượng 26, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(221, 00111, 'Hoàng', 'Lê Minh', 'Lô 61-62 B2.15 An Thượng 26, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(222, 00112, 'Trang', 'Lê Thị Huyền', '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(223, 00112, 'Hoàng', 'Lê Minh', '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(224, 00113, 'Trang', 'Lê Thị Huyền', '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(225, 00113, 'Hoàng', 'Lê Minh', '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(226, 00114, 'Trang', 'Lê Thị Huyền', 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(227, 00114, 'Hoàng', 'Lê Minh', 'Lô 11 khu phức hợp dịch vụ thương mại, chung cư và đất ở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(228, 00115, 'Trang', 'Lê Thị Huyền', 'Số 1, đường An Cư 1, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(229, 00115, 'Hoàng', 'Lê Minh', 'Số 1, đường An Cư 1, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(230, 00116, 'Trang', 'Lê Thị Huyền', 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(231, 00116, 'Hoàng', 'Lê Minh', 'K3/20 Hà Văn Trí, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(232, 00117, 'Trang', 'Lê Thị Huyền', '597 Trường Chinh, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(233, 00117, 'Hoàng', 'Lê Minh', '597 Trường Chinh, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(234, 00118, 'Trang', 'Lê Thị Huyền', '99A Hà Huy Tập, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(235, 00118, 'Hoàng', 'Lê Minh', '99A Hà Huy Tập, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(236, 00119, 'Trang', 'Lê Thị Huyền', '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(237, 00119, 'Hoàng', 'Lê Minh', '13 An Thượng 31, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(238, 00120, 'Trang', 'Lê Thị Huyền', '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(239, 00120, 'Hoàng', 'Lê Minh', '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(240, 00121, 'Trang', 'Lê Thị Huyền', '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(241, 00121, 'Hoàng', 'Lê Minh', '108 Trần Huy Liệu, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(242, 00122, 'Trang', 'Lê Thị Huyền', 'Lô A68, Đường 30 Tháng 4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(243, 00122, 'Hoàng', 'Lê Minh', 'Lô A68, Đường 30 Tháng 4, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(244, 00123, 'Trang', 'Lê Thị Huyền', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(245, 00123, 'Hoàng', 'Lê Minh', '09 Ngô Văn Sở, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(246, 00124, 'Trang', 'Lê Thị Huyền', '65 Ngô Thị Liễu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(247, 00124, 'Hoàng', 'Lê Minh', '65 Ngô Thị Liễu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(248, 00125, 'Trang', 'Lê Thị Huyền', 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(249, 00125, 'Hoàng', 'Lê Minh', 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(250, 00126, 'Trang', 'Lê Thị Huyền', '388 Trần Hưng Đạo, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(251, 00126, 'Hoàng', 'Lê Minh', '388 Trần Hưng Đạo, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(252, 00127, 'Trang', 'Lê Thị Huyền', 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(253, 00127, 'Hoàng', 'Lê Minh', 'K5/500 Tôn Đản, Phường Hoà Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(254, 00128, 'Trang', 'Lê Thị Huyền', '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(255, 00128, 'Hoàng', 'Lê Minh', '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(256, 00129, 'Trang', 'Lê Thị Huyền', '57/K1/4 Đường Hòa An 19, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(257, 00129, 'Hoàng', 'Lê Minh', '57/K1/4 Đường Hòa An 19, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(258, 00130, 'Trang', 'Lê Thị Huyền', '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(259, 00130, 'Hoàng', 'Lê Minh', '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(260, 00131, 'Trang', 'Lê Thị Huyền', '35 Trần Thủ Độ , Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(261, 00131, 'Hoàng', 'Lê Minh', '35 Trần Thủ Độ , Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(262, 00132, 'Trang', 'Lê Thị Huyền', '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(263, 00132, 'Hoàng', 'Lê Minh', '43 Trần Quý Cáp, Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(264, 00133, 'Trang', 'Lê Thị Huyền', '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(265, 00133, 'Hoàng', 'Lê Minh', '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(266, 00134, 'Trang', 'Lê Thị Huyền', '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(267, 00134, 'Hoàng', 'Lê Minh', '240 Phan Đăng Lưu, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(268, 00135, 'Trang', 'Lê Thị Huyền', '572/92 Ông Ích Khiêm, Phường Hải Châu II, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(269, 00135, 'Hoàng', 'Lê Minh', '572/92 Ông Ích Khiêm, Phường Hải Châu II, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(270, 00136, 'Trang', 'Lê Thị Huyền', '215/52 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(271, 00136, 'Hoàng', 'Lê Minh', '215/52 Hà Huy Tập, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(272, 00137, 'Trang', 'Lê Thị Huyền', '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(273, 00137, 'Hoàng', 'Lê Minh', '103 Vũ Quỳnh, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(274, 00138, 'Trang', 'Lê Thị Huyền', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(275, 00138, 'Hoàng', 'Lê Minh', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(276, 00139, 'Trang', 'Lê Thị Huyền', '317/60 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(277, 00139, 'Hoàng', 'Lê Minh', '317/60 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(278, 00140, 'Trang', 'Lê Thị Huyền', '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(279, 00140, 'Hoàng', 'Lê Minh', '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(280, 00141, 'Trang', 'Lê Thị Huyền', 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(281, 00141, 'Hoàng', 'Lê Minh', 'Lô 6 Khu B2-2 KDC phía nam sông quá giáng, Xã Hoà Phước, Huyện Hoà Vang, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(282, 00142, 'Trang', 'Lê Thị Huyền', 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(283, 00142, 'Hoàng', 'Lê Minh', 'K408/17/21 Tôn Đản, Phường Hoà An, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(284, 00143, 'Trang', 'Lê Thị Huyền', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(285, 00143, 'Hoàng', 'Lê Minh', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(286, 00144, 'Trang', 'Lê Thị Huyền', '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(287, 00144, 'Hoàng', 'Lê Minh', '260 Lê Văn Hiến, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(288, 00145, 'Trang', 'Lê Thị Huyền', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(289, 00145, 'Hoàng', 'Lê Minh', 'K36/H8/31 Nguyễn Huy Tưởng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(290, 00146, 'Trang', 'Lê Thị Huyền', '244 Nguyễn Duy Trinh, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(291, 00146, 'Hoàng', 'Lê Minh', '244 Nguyễn Duy Trinh, Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(292, 00147, 'Trang', 'Lê Thị Huyền', '130/19 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(293, 00147, 'Hoàng', 'Lê Minh', '130/19 Điện Biên Phủ, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(294, 00148, 'Trang', 'Lê Thị Huyền', 'Lô 165 Khu TĐC phía nam Hoàng Văn Thái, Phường Hoà Hiệp Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(295, 00148, 'Hoàng', 'Lê Minh', 'Lô 165 Khu TĐC phía nam Hoàng Văn Thái, Phường Hoà Hiệp Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(296, 00149, 'Trang', 'Lê Thị Huyền', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(297, 00149, 'Hoàng', 'Lê Minh', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(298, 00150, 'Trang', 'Lê Thị Huyền', 'K31/12 Mẹ Nhu, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(299, 00150, 'Hoàng', 'Lê Minh', 'K31/12 Mẹ Nhu, Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(300, 00151, 'Trang', 'Lê Thị Huyền', '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(301, 00151, 'Hoàng', 'Lê Minh', '15 An Thượng 27, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(302, 00152, 'Trang', 'Lê Thị Huyền', '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(303, 00152, 'Hoàng', 'Lê Minh', '23 Nại Nghĩa 3, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(304, 00153, 'Trang', 'Lê Thị Huyền', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(305, 00153, 'Hoàng', 'Lê Minh', 'Lô số 03-A3.5 Khu công viên Bắc Tượng Đài, Phường Hoà Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(306, 00154, 'Trang', 'Lê Thị Huyền', 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(307, 00154, 'Hoàng', 'Lê Minh', 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(308, 00155, 'Trang', 'Lê Thị Huyền', 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(309, 00155, 'Hoàng', 'Lê Minh', 'K233/27 Trưng Nữ Vương, Phường Hoà Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(310, 00156, 'Trang', 'Lê Thị Huyền', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(311, 00156, 'Hoàng', 'Lê Minh', '76 Nguyễn Sơn, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(312, 00157, 'Trang', 'Lê Thị Huyền', '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(313, 00157, 'Hoàng', 'Lê Minh', '33 Ngô Quyền, Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(314, 00158, 'Trang', 'Lê Thị Huyền', 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(315, 00158, 'Hoàng', 'Lê Minh', 'Lô B2-13-30 Khu đô thị Phước Lý, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(316, 00159, 'Trang', 'Lê Thị Huyền', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(317, 00159, 'Hoàng', 'Lê Minh', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(318, 00160, 'Trang', 'Lê Thị Huyền', 'K19/8 Hoàng Hoa Thám, Phường Tân Chính, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(319, 00160, 'Hoàng', 'Lê Minh', 'K19/8 Hoàng Hoa Thám, Phường Tân Chính, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(320, 00161, 'Trang', 'Lê Thị Huyền', 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(321, 00161, 'Hoàng', 'Lê Minh', 'K424/H19/08 Ông Ích Khiêm, Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(322, 00162, 'Trang', 'Lê Thị Huyền', '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(323, 00162, 'Hoàng', 'Lê Minh', '288 Bế Văn Đàn, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(324, 00163, 'Trang', 'Lê Thị Huyền', '35 Cao Thắng, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(325, 00163, 'Hoàng', 'Lê Minh', '35 Cao Thắng, Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(326, 00164, 'Trang', 'Lê Thị Huyền', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(327, 00164, 'Hoàng', 'Lê Minh', '472 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(328, 00165, 'Trang', 'Lê Thị Huyền', '86/39 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(329, 00165, 'Hoàng', 'Lê Minh', '86/39 Phạm Nhữ Tăng, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(330, 00166, 'Trang', 'Lê Thị Huyền', '62 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(331, 00166, 'Hoàng', 'Lê Minh', '62 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(332, 00167, 'Trang', 'Lê Thị Huyền', '47 Hồ Nghinh, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(333, 00167, 'Hoàng', 'Lê Minh', '47 Hồ Nghinh, Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(334, 00168, 'Trang', 'Lê Thị Huyền', 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ');
INSERT INTO `thong_tin_gia_dinh` (`id`, `ma_nhan_vien`, `ten`, `ho_dem`, `que_quan`, `nam_sinh`, `gioi_tinh`, `so_dien_thoai`, `quan_he`) VALUES
(335, 00168, 'Hoàng', 'Lê Minh', 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(336, 00169, 'Trang', 'Lê Thị Huyền', '06 Vũ Ngọc Phan, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(337, 00169, 'Hoàng', 'Lê Minh', '06 Vũ Ngọc Phan, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(338, 00170, 'Trang', 'Lê Thị Huyền', '91 Đinh Châu, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(339, 00170, 'Hoàng', 'Lê Minh', '91 Đinh Châu, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(340, 00171, 'Trang', 'Lê Thị Huyền', '243/12 Ngõ B Tôn Đức Thắng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(341, 00171, 'Hoàng', 'Lê Minh', '243/12 Ngõ B Tôn Đức Thắng, Phường Hoà Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(342, 00172, 'Trang', 'Lê Thị Huyền', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(343, 00172, 'Hoàng', 'Lê Minh', 'Số 54 Nguyễn Thiếp, Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(344, 00173, 'Trang', 'Lê Thị Huyền', '144 Bùi Vịnh, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(345, 00173, 'Hoàng', 'Lê Minh', '144 Bùi Vịnh, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(346, 00174, 'Trang', 'Lê Thị Huyền', 'Lô 18, Khu C1, Khu nhà ở Quân đội K38, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(347, 00174, 'Hoàng', 'Lê Minh', 'Lô 18, Khu C1, Khu nhà ở Quân đội K38, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(348, 00175, 'Trang', 'Lê Thị Huyền', 'Số 25 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(349, 00175, 'Hoàng', 'Lê Minh', 'Số 25 Thế Lữ, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(350, 00176, 'Trang', 'Lê Thị Huyền', '115 Nguyễn Văn Linh, Phường Nam Dương, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(351, 00176, 'Hoàng', 'Lê Minh', '115 Nguyễn Văn Linh, Phường Nam Dương, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(352, 00177, 'Trang', 'Lê Thị Huyền', '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(353, 00177, 'Hoàng', 'Lê Minh', '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(354, 00178, 'Trang', 'Lê Thị Huyền', '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(355, 00178, 'Hoàng', 'Lê Minh', '23 Trịnh Lỗi, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(356, 00179, 'Trang', 'Lê Thị Huyền', '138/74/04/14/61 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(357, 00179, 'Hoàng', 'Lê Minh', '138/74/04/14/61 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(358, 00180, 'Trang', 'Lê Thị Huyền', '56 Phan Văn Đạt, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(359, 00180, 'Hoàng', 'Lê Minh', '56 Phan Văn Đạt, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(360, 00181, 'Trang', 'Lê Thị Huyền', 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(361, 00181, 'Hoàng', 'Lê Minh', 'Lô 03 B2- 62, Khu đô thị Nam Hòa Xuân, Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(362, 00182, 'Trang', 'Lê Thị Huyền', 'Lô 249, Đường Hoàng Minh Thảo, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(363, 00182, 'Hoàng', 'Lê Minh', 'Lô 249, Đường Hoàng Minh Thảo, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(364, 00183, 'Trang', 'Lê Thị Huyền', 'K411/25/5 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(365, 00183, 'Hoàng', 'Lê Minh', 'K411/25/5 Nguyễn Phước Nguyên, Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(366, 00184, 'Trang', 'Lê Thị Huyền', '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(367, 00184, 'Hoàng', 'Lê Minh', '30A đường Nguyễn Tri Phương, Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(368, 00185, 'Trang', 'Lê Thị Huyền', '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(369, 00185, 'Hoàng', 'Lê Minh', '689 Nguyễn Tất Thành, Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(370, 00186, 'Trang', 'Lê Thị Huyền', '185 Trần Xuân Lê, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(371, 00186, 'Hoàng', 'Lê Minh', '185 Trần Xuân Lê, Phường Hoà Khê, Quận Thanh Khê, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(372, 00187, 'Trang', 'Lê Thị Huyền', '39 Xuân Tâm, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(373, 00187, 'Hoàng', 'Lê Minh', '39 Xuân Tâm, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(374, 00188, 'Trang', 'Lê Thị Huyền', '149 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(375, 00188, 'Hoàng', 'Lê Minh', '149 Hoàng Văn Thái, Phường Hoà Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(376, 00189, 'Trang', 'Lê Thị Huyền', '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(377, 00189, 'Hoàng', 'Lê Minh', '03 Trần Thanh Mại, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(378, 00190, 'Trang', 'Lê Thị Huyền', 'Lô 526 Đô Đốc Lân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(379, 00190, 'Hoàng', 'Lê Minh', 'Lô 526 Đô Đốc Lân, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(380, 00191, 'Trang', 'Lê Thị Huyền', '46 Nguyễn Đình Trọng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(381, 00191, 'Hoàng', 'Lê Minh', '46 Nguyễn Đình Trọng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(382, 00192, 'Trang', 'Lê Thị Huyền', 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(383, 00192, 'Hoàng', 'Lê Minh', 'K166/17 Nguyễn Lương Bằng, Phường Hoà Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(384, 00193, 'Trang', 'Lê Thị Huyền', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(385, 00193, 'Hoàng', 'Lê Minh', '21/3 Yên Bái, Phường Hải Châu I, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(386, 00194, 'Trang', 'Lê Thị Huyền', '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(387, 00194, 'Hoàng', 'Lê Minh', '152/6 Lý Tự Trọng, Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(388, 00195, 'Trang', 'Lê Thị Huyền', '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(389, 00195, 'Hoàng', 'Lê Minh', '85 Khương Hữu Dụng, Phường Hoà Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(390, 00196, 'Trang', 'Lê Thị Huyền', '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(391, 00196, 'Hoàng', 'Lê Minh', '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(392, 00197, 'Trang', 'Lê Thị Huyền', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(393, 00197, 'Hoàng', 'Lê Minh', '281 Đoàn Khuê, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(394, 00198, 'Trang', 'Lê Thị Huyền', '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(395, 00198, 'Hoàng', 'Lê Minh', '01 Võ Như Hưng, Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(396, 00199, 'Trang', 'Lê Thị Huyền', 'K854/07 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(397, 00199, 'Hoàng', 'Lê Minh', 'K854/07 Ngô Quyền, Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(398, 00200, 'Trang', 'Lê Thị Huyền', 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(399, 00200, 'Hoàng', 'Lê Minh', 'K523/45 Cách Mạng Tháng Tám, Phường Hoà Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(400, 00201, 'Trang', 'Lê Thị Huyền', '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1994-03-29', 2, '01266676809', 'Mẹ'),
(401, 00201, 'Hoàng', 'Lê Minh', '303 Khúc Hạo, Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', '1996-08-26', 1, '01266676809', 'Bố'),
(402, 00001, 'Nam', 'Đặng Văn', 'Đà Nẵng', '1998-07-20', 1, '01266676809', 'Em');

-- --------------------------------------------------------

--
-- Table structure for table `tinh_trang`
--

CREATE TABLE IF NOT EXISTS `tinh_trang` (
  `ma_tinh_trang` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_tinh_trang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinh_trang`
--

INSERT INTO `tinh_trang` (`ma_tinh_trang`, `ten_tinh_trang`, `is_delete`) VALUES
('TT01', 'New', 0),
('TT02', 'In Progress', 0),
('TT03', 'On Hold', 0),
('TT04', 'Completed', 0),
('TT05', 'Archived', 0),
('TT06', 'Cancelled', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tinh_trang_hon_nhan`
--

CREATE TABLE IF NOT EXISTS `tinh_trang_hon_nhan` (
  `ma_tinh_trang_hon_nhan` int(11) NOT NULL,
  `tinh_trang_hon_nhan` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinh_trang_hon_nhan`
--

INSERT INTO `tinh_trang_hon_nhan` (`ma_tinh_trang_hon_nhan`, `tinh_trang_hon_nhan`) VALUES
(1, 'Độc thân'),
(2, 'Đã đính hôn'),
(3, 'Đã kết hôn'),
(4, 'Đã ly hôn');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ma_tai_khoan` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_nhan_vien` int(11) NOT NULL,
  `enabled` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ma_tai_khoan`, `username`, `password`, `ma_nhan_vien`, `enabled`) VALUES
(1, 'giamdoc', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 1, 1),
(2, 'truongphongduan', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 7, 1),
(3, 'truongphongdaotao', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 56, 1),
(4, 'truongphongit', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 16, 1),
(5, 'truongphongketoan', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 57, 1),
(6, 'truongphongnhansu', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 42, 1),
(7, 'phophongduan', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 101, 1),
(8, 'phophongdaotao', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 35, 1),
(9, 'phophongit', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 28, 1),
(10, 'phophongketoan', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 86, 1),
(11, 'phophongnhansu', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 124, 1),
(12, 'phogiamdoc', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 60, 1),
(13, 'nhanvienphongduan', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 66, 1),
(14, 'nhanvienphongdaotao', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 69, 1),
(15, 'nhanvienphongit', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 65, 1),
(16, 'nhanvienphongketoan', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 74, 1),
(17, 'nhanvienphongnhansu', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `ma_tai_khoan` int(11) NOT NULL DEFAULT '0',
  `ma_role` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`ma_tai_khoan`, `ma_role`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 1),
(6, 7),
(7, 3),
(8, 4),
(9, 5),
(10, 6),
(11, 1),
(11, 7),
(12, 2),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 1),
(17, 8);

-- --------------------------------------------------------

--
-- Table structure for table `vai_tro_thanh_vien`
--

CREATE TABLE IF NOT EXISTS `vai_tro_thanh_vien` (
  `ma_vai_tro` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_vai_tro` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vai_tro_thanh_vien`
--

INSERT INTO `vai_tro_thanh_vien` (`ma_vai_tro`, `ten_vai_tro`, `is_delete`) VALUES
('VT01', 'PM', 0),
('VT02', 'Technical Lead', 0),
('VT03', 'Dev', 0),
('VT04', 'Tester', 0),
('VT05', 'Reviewer', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chuc_danh`
--
ALTER TABLE `chuc_danh`
  ADD PRIMARY KEY (`ma_chuc_danh`);

--
-- Indexes for table `co_so_du_lieu`
--
ALTER TABLE `co_so_du_lieu`
  ADD PRIMARY KEY (`ma_database`);

--
-- Indexes for table `database_du_an`
--
ALTER TABLE `database_du_an`
  ADD PRIMARY KEY (`ma_database`,`ma_du_an`);

--
-- Indexes for table `doi_tac`
--
ALTER TABLE `doi_tac`
  ADD PRIMARY KEY (`ma_doi_tac`);

--
-- Indexes for table `doi_tac_du_an`
--
ALTER TABLE `doi_tac_du_an`
  ADD PRIMARY KEY (`ma_du_an`,`ma_doi_tac`);

--
-- Indexes for table `du_an`
--
ALTER TABLE `du_an`
  ADD PRIMARY KEY (`ma_du_an`),
  ADD UNIQUE KEY `MaDuAn` (`ma_du_an`),
  ADD KEY `MaDuAn_2` (`ma_du_an`),
  ADD KEY `MaDuAn_3` (`ma_du_an`),
  ADD KEY `ma_tinh_trang` (`ma_tinh_trang`);

--
-- Indexes for table `framework`
--
ALTER TABLE `framework`
  ADD PRIMARY KEY (`ma_framework`);

--
-- Indexes for table `framework_du_an`
--
ALTER TABLE `framework_du_an`
  ADD PRIMARY KEY (`ma_framework`,`ma_du_an`);

--
-- Indexes for table `hop_dong`
--
ALTER TABLE `hop_dong`
  ADD PRIMARY KEY (`ma_hop_dong`),
  ADD KEY `hop_dong_ibfk_1` (`ma_nhan_vien`),
  ADD KEY `hop_dong_ibfk_2` (`ma_loai_hop_dong`);

--
-- Indexes for table `ho_so_nhan_vien`
--
ALTER TABLE `ho_so_nhan_vien`
  ADD PRIMARY KEY (`ma_nhan_vien`),
  ADD KEY `ma_phong_ban` (`ma_phong_ban`),
  ADD KEY `ma_chuc_danh` (`ma_chuc_danh`),
  ADD KEY `ma_quoc_tich` (`ma_quoc_tich`),
  ADD KEY `ma_tinh_trang_hon_nhan` (`ma_tinh_trang_hon_nhan`);

--
-- Indexes for table `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`ma_khach_hang`);

--
-- Indexes for table `loai_hop_dong`
--
ALTER TABLE `loai_hop_dong`
  ADD PRIMARY KEY (`ma_loai_hop_dong`);

--
-- Indexes for table `nghiep_vu`
--
ALTER TABLE `nghiep_vu`
  ADD PRIMARY KEY (`ma_nghiep_vu`);

--
-- Indexes for table `ngon_ngu`
--
ALTER TABLE `ngon_ngu`
  ADD PRIMARY KEY (`ma_ngon_ngu`);

--
-- Indexes for table `ngon_ngu_du_an`
--
ALTER TABLE `ngon_ngu_du_an`
  ADD PRIMARY KEY (`ma_ngon_ngu`,`ma_du_an`),
  ADD KEY `ma_du_an` (`ma_du_an`);

--
-- Indexes for table `nhiem_vu`
--
ALTER TABLE `nhiem_vu`
  ADD PRIMARY KEY (`ma_vai_tro`,`ma_nhan_vien`,`ma_du_an`);

--
-- Indexes for table `phong_ban`
--
ALTER TABLE `phong_ban`
  ADD PRIMARY KEY (`ma_phong_ban`);

--
-- Indexes for table `quoc_tich`
--
ALTER TABLE `quoc_tich`
  ADD PRIMARY KEY (`ma_quoc_tich`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ma_role`);

--
-- Indexes for table `thong_tin_bang_cap`
--
ALTER TABLE `thong_tin_bang_cap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thong_tin_bang_cap_ibfk_1` (`ma_nhan_vien`);

--
-- Indexes for table `thong_tin_gia_dinh`
--
ALTER TABLE `thong_tin_gia_dinh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thong_tin_gia_dinh_ibfk_1` (`ma_nhan_vien`);

--
-- Indexes for table `tinh_trang`
--
ALTER TABLE `tinh_trang`
  ADD PRIMARY KEY (`ma_tinh_trang`);

--
-- Indexes for table `tinh_trang_hon_nhan`
--
ALTER TABLE `tinh_trang_hon_nhan`
  ADD PRIMARY KEY (`ma_tinh_trang_hon_nhan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ma_tai_khoan`),
  ADD UNIQUE KEY `ma_nhan_vien` (`ma_nhan_vien`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`ma_tai_khoan`,`ma_role`),
  ADD KEY `_idx` (`ma_tai_khoan`),
  ADD KEY `dfdf_idx` (`ma_role`);

--
-- Indexes for table `vai_tro_thanh_vien`
--
ALTER TABLE `vai_tro_thanh_vien`
  ADD PRIMARY KEY (`ma_vai_tro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `du_an`
--
ALTER TABLE `du_an`
  MODIFY `ma_du_an` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hop_dong`
--
ALTER TABLE `hop_dong`
  MODIFY `ma_hop_dong` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `ho_so_nhan_vien`
--
ALTER TABLE `ho_so_nhan_vien`
  MODIFY `ma_nhan_vien` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `loai_hop_dong`
--
ALTER TABLE `loai_hop_dong`
  MODIFY `ma_loai_hop_dong` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ma_role` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `thong_tin_bang_cap`
--
ALTER TABLE `thong_tin_bang_cap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `thong_tin_gia_dinh`
--
ALTER TABLE `thong_tin_gia_dinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=403;
--
-- AUTO_INCREMENT for table `tinh_trang_hon_nhan`
--
ALTER TABLE `tinh_trang_hon_nhan`
  MODIFY `ma_tinh_trang_hon_nhan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ma_tai_khoan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `du_an`
--
ALTER TABLE `du_an`
  ADD CONSTRAINT `du_an_ibfk_1` FOREIGN KEY (`ma_tinh_trang`) REFERENCES `tinh_trang` (`ma_tinh_trang`);

--
-- Constraints for table `hop_dong`
--
ALTER TABLE `hop_dong`
  ADD CONSTRAINT `hop_dong_ibfk_1` FOREIGN KEY (`ma_nhan_vien`) REFERENCES `ho_so_nhan_vien` (`ma_nhan_vien`),
  ADD CONSTRAINT `hop_dong_ibfk_2` FOREIGN KEY (`ma_loai_hop_dong`) REFERENCES `loai_hop_dong` (`ma_loai_hop_dong`);

--
-- Constraints for table `ho_so_nhan_vien`
--
ALTER TABLE `ho_so_nhan_vien`
  ADD CONSTRAINT `ho_so_nhan_vien_ibfk_1` FOREIGN KEY (`ma_phong_ban`) REFERENCES `phong_ban` (`ma_phong_ban`),
  ADD CONSTRAINT `ho_so_nhan_vien_ibfk_2` FOREIGN KEY (`ma_chuc_danh`) REFERENCES `chuc_danh` (`ma_chuc_danh`),
  ADD CONSTRAINT `ho_so_nhan_vien_ibfk_3` FOREIGN KEY (`ma_quoc_tich`) REFERENCES `quoc_tich` (`ma_quoc_tich`),
  ADD CONSTRAINT `ho_so_nhan_vien_ibfk_4` FOREIGN KEY (`ma_tinh_trang_hon_nhan`) REFERENCES `tinh_trang_hon_nhan` (`ma_tinh_trang_hon_nhan`);

--
-- Constraints for table `ngon_ngu_du_an`
--
ALTER TABLE `ngon_ngu_du_an`
  ADD CONSTRAINT `ngon_ngu_du_an_ibfk_2` FOREIGN KEY (`ma_ngon_ngu`) REFERENCES `ngon_ngu` (`ma_ngon_ngu`);

--
-- Constraints for table `thong_tin_bang_cap`
--
ALTER TABLE `thong_tin_bang_cap`
  ADD CONSTRAINT `thong_tin_bang_cap_ibfk_1` FOREIGN KEY (`ma_nhan_vien`) REFERENCES `ho_so_nhan_vien` (`ma_nhan_vien`);

--
-- Constraints for table `thong_tin_gia_dinh`
--
ALTER TABLE `thong_tin_gia_dinh`
  ADD CONSTRAINT `thong_tin_gia_dinh_ibfk_1` FOREIGN KEY (`ma_nhan_vien`) REFERENCES `ho_so_nhan_vien` (`ma_nhan_vien`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
