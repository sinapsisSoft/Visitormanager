-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2018 a las 00:09:09
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Visitor_Manager`
--
CREATE DATABASE IF NOT EXISTS `Visitor_Manager` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `Visitor_Manager`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `Atta_id` int(11) NOT NULL AUTO_INCREMENT,
  `Atta_path_ftp` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Atta_name` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Atta_type` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Atta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `attachments`
--

TRUNCATE TABLE `attachments`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `Business_id` int(11) NOT NULL AUTO_INCREMENT,
  `Business_nit` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Business_name` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Business_address` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Business_phone` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Business_mail` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `business`
--

TRUNCATE TABLE `business`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `Log_id` int(11) NOT NULL AUTO_INCREMENT,
  `Log_mac` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Log_password` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `Log_user_id` int(11) NOT NULL,
  PRIMARY KEY (`Log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `login`
--

TRUNCATE TABLE `login`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `Request_id` int(11) NOT NULL AUTO_INCREMENT,
  `Request_type` int(11) NOT NULL,
  `Request_code` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Request_description` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Request_state` int(11) NOT NULL,
  `Request_file_attached` int(11) NOT NULL,
  PRIMARY KEY (`Request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `request`
--

TRUNCATE TABLE `request`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `State_id` int(11) NOT NULL AUTO_INCREMENT,
  `State_name` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `State_description` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `State_type` int(10) NOT NULL,
  PRIMARY KEY (`State_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `state`
--

TRUNCATE TABLE `state`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_request`
--

DROP TABLE IF EXISTS `type_request`;
CREATE TABLE IF NOT EXISTS `type_request` (
  `Type_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_request_name` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Type_request_description` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Type_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `type_request`
--

TRUNCATE TABLE `type_request`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_user`
--

DROP TABLE IF EXISTS `type_user`;
CREATE TABLE IF NOT EXISTS `type_user` (
  `Type_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_user_name` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Type_user_description` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Type_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `type_user`
--

TRUNCATE TABLE `type_user`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_mail` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `User_type` int(11) NOT NULL,
  `User_name` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `User_surname` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `User_state` int(11) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visit`
--

DROP TABLE IF EXISTS `visit`;
CREATE TABLE IF NOT EXISTS `visit` (
  `Visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `Visit_code` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `Visit_date` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Visit_user` int(11) NOT NULL,
  `Visit_business` int(11) NOT NULL,
  `Visit_requerit` int(11) NOT NULL,
  `Visit_state` int(11) NOT NULL,
  PRIMARY KEY (`Visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Truncar tablas antes de insertar `visit`
--

TRUNCATE TABLE `visit`;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
