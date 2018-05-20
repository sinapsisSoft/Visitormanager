-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2018 a las 15:30:12
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `visitormanager`
--
CREATE DATABASE IF NOT EXISTS `visitormanager` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `visitormanager`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `attachments_id` int(11) NOT NULL AUTO_INCREMENT,
  `attachments_code` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `attachments_type` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`attachments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_nit` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `business_name` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `business_address` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `business_phone` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `business_mail` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_mac_device` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `log_password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `log_id_user` int(11) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `login_user` (`log_id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `Request_type` int(10) NOT NULL,
  `Request_code` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Request_description` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Request_state` int(11) NOT NULL,
  `Request_file_attached` int(11) NOT NULL,
  PRIMARY KEY (`Request_id`),
  KEY `request_request_type` (`Request_type`),
  KEY `request_attachments` (`Request_file_attached`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `State_name` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `State_type` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `State_descripction` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`State_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `type_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_request_name` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `type_request_description` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`type_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `Type_user` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Type_user_description` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Type_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `User_mail` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `User_type` int(5) NOT NULL,
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `User_surname` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `User_state` int(10) NOT NULL,
  PRIMARY KEY (`User_id`) USING BTREE,
  KEY `user_type_user` (`User_type`),
  KEY `user_state` (`User_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `Visit_code` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Visit_date` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Visit_user` int(11) NOT NULL,
  `Visit_requerit` int(11) NOT NULL,
  `Visit_state` int(11) NOT NULL,
  `Visit_business` int(11) NOT NULL,
  PRIMARY KEY (`Visit_id`),
  KEY `visit_business` (`Visit_business`),
  KEY `visit_request` (`Visit_requerit`),
  KEY `visit_user` (`Visit_user`),
  KEY `visit_state` (`Visit_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `visit`
--

TRUNCATE TABLE `visit`;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_user` FOREIGN KEY (`log_id_user`) REFERENCES `user` (`User_id`);

--
-- Filtros para la tabla `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_attachments` FOREIGN KEY (`Request_file_attached`) REFERENCES `attachments` (`attachments_id`),
  ADD CONSTRAINT `request_request_type` FOREIGN KEY (`Request_type`) REFERENCES `type_request` (`type_request_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_state` FOREIGN KEY (`User_state`) REFERENCES `state` (`State_id`),
  ADD CONSTRAINT `user_type_user` FOREIGN KEY (`User_type`) REFERENCES `type_user` (`Type_user_id`);

--
-- Filtros para la tabla `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_business` FOREIGN KEY (`Visit_business`) REFERENCES `business` (`business_id`),
  ADD CONSTRAINT `visit_request` FOREIGN KEY (`Visit_requerit`) REFERENCES `request` (`Request_id`),
  ADD CONSTRAINT `visit_state` FOREIGN KEY (`Visit_state`) REFERENCES `state` (`State_id`),
  ADD CONSTRAINT `visit_user` FOREIGN KEY (`Visit_user`) REFERENCES `user` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
