-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2018 a las 23:05:47
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
-- Base de datos: `visitormanager`
--
CREATE DATABASE IF NOT EXISTS `visitormanager` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `visitormanager`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `CreateBusiness`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateBusiness` (IN `businessNit` VARCHAR(20), IN `businessPhone` VARCHAR(20), IN `businessAddress` VARCHAR(30), IN `businessName` VARCHAR(30), IN `businessMail` VARCHAR(80))  BEGIN
   INSERT INTO business(business_id,business_nit,business_name,business_address,business_phone,business_mail) 
   VALUES (NULL,businessNit,businessName,businessAddress,businessPhone,businessMail);
   END$$

DROP PROCEDURE IF EXISTS `CreateUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUser` (IN `userMail` VARCHAR(80), IN `UserType` INT(5), IN `UserName` VARCHAR(40), IN `UserSurname` VARCHAR(40), IN `UserState` INT(10))  BEGIN
   INSERT INTO user(User_mail,User_type,User_id,User_name,User_surname,User_state) 
   VALUES (userMail,UserType,NULL,UserName,UserSurname,UserState);
   END$$

DROP PROCEDURE IF EXISTS `SearchBusiness`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchBusiness` (IN `businessData` VARCHAR(80), IN `typeSearch` INT(5))  BEGIN
   IF typeSearch=0 THEN SELECT * FROM business WHERE business_mail=businessData;
   ELSEIF typeSearch=1 THEN SELECT * FROM business WHERE business_mail LIKE CONCAT('%',businessData,'%'); 
   ELSEIF typeSearch=2 THEN SELECT * FROM business WHERE business_name LIKE CONCAT('%',businessData,'%'); 
   ELSEIF typeSearch=3 THEN SELECT * FROM business WHERE business_nit LIKE CONCAT('%',businessData,'%');
   ELSE  SELECT * FROM business;
   END IF;
   END$$

DROP PROCEDURE IF EXISTS `SearchUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUser` (IN `userData` VARCHAR(80), `typeSearch` INT(5))  BEGIN
   IF typeSearch=0 THEN SELECT * FROM user WHERE User_mail LIKE CONCAT('%',userData, '%') AND User_state=1;
   ELSEIF typeSearch=1 THEN SELECT * FROM user WHERE User_type=CAST(userData AS UNSIGNED) AND User_state=1;
   ELSE SELECT * FROM user WHERE User_state=1;
   END IF;
   END$$

DROP PROCEDURE IF EXISTS `UpdateStateUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStateUser` (IN `UserId` INT(11))  BEGIN 
UPDATE user SET User_state=2 WHERE User_id=UserId;
END$$

DELIMITER ;

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
  PRIMARY KEY (`business_id`),
  UNIQUE KEY `business_nit` (`business_nit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `business`
--

TRUNCATE TABLE `business`;
--
-- Volcado de datos para la tabla `business`
--

INSERT DELAYED INTO `business` (`business_id`, `business_nit`, `business_name`, `business_address`, `business_phone`, `business_mail`) VALUES
(1, '80859867-7', '7800733', 'Calle 102 # 35 -45', 'Sinapsis Soft', 'info@sinapsissoft.co'),
(3, '80859867-9', '7800733', 'Calle 102 # 35 -45', 'Sinapsis Soft 2', 'info@sinapsissoft1.co'),
(4, '80859867-8', '7800733', 'Calle 102 # 35 -45', 'Sinapsis Soft 2', 'info@sinapsissoft2.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `state`
--

TRUNCATE TABLE `state`;
--
-- Volcado de datos para la tabla `state`
--

INSERT DELAYED INTO `state` (`State_id`, `State_name`, `State_type`, `State_descripction`) VALUES
(1, 'Active', 'User', 'Estado activo en la plataforma'),
(2, 'Inactive', 'User', 'Estado inactivo en la platafor');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `type_user`
--

TRUNCATE TABLE `type_user`;
--
-- Volcado de datos para la tabla `type_user`
--

INSERT DELAYED INTO `type_user` (`Type_user_id`, `Type_user`, `Type_user_description`) VALUES
(1, 'Administrator', 'Roll de administración de la p'),
(2, 'Visitor', 'Roll de ingeniero de la plataf');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Truncar tablas antes de insertar `user`
--

TRUNCATE TABLE `user`;
--
-- Volcado de datos para la tabla `user`
--

INSERT DELAYED INTO `user` (`User_mail`, `User_type`, `User_id`, `User_name`, `User_surname`, `User_state`) VALUES
('diehercasvan@gmail.com', 1, 1, 'Diego', 'Casallas', 2),
('diehercasvan@outlook.com', 1, 2, 'Hernando', 'Vanegas', 1),
('dcasallas@outlook.com', 1, 3, 'Juan', 'Rodriguez', 1),
('dcasallas@outlook.com', 1, 4, 'Juan', 'Rodriguez', 1),
('dcasallas@outlook.com', 1, 5, 'Juan', 'Rodriguez', 1),
('dcasallas@gmail.com', 1, 6, 'Felipe ', 'Casallas', 1),
('dcasallas@gmail.com', 1, 7, 'Felipe ', 'Casallas', 1);

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
