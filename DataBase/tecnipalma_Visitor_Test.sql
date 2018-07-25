-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-07-2018 a las 16:33:10
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecnipalma_Visitor_Test`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `Insert_update_business`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Insert_update_business` (IN `nit` VARCHAR(40), `name` VARCHAR(60), IN `address` VARCHAR(80), IN `phone` VARCHAR(20), IN `mail` VARCHAR(80))  BEGIN 
	INSERT INTO Business (Business_id,Business_nit,Business_name,Business_address,Business_phone,Business_mail)
	VALUES (NULL,nit,name,address,phone,mail)
    ON DUPLICATE KEY UPDATE Business_name=name, Business_address=address,Business_phone=phone;
END$$

DROP PROCEDURE IF EXISTS `Insert_update_request`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Insert_update_request` (IN `type_request` INT(11), IN `code_request` VARCHAR(20), IN `description_request` VARCHAR(120), IN `state_request` INT(11), IN `visit_request` INT(11))  BEGIN
	INSERT INTO Request(Request_id,Request_type,Request_code,Request_description,Request_state,Request_visit)
	VALUES (NULL,type_request,code_request,description_request,state_request,visit_request)
    ON DUPLICATE KEY UPDATE Request_description=description_request,Request_state=state_request;
END$$

DROP PROCEDURE IF EXISTS `Insert_update_user`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Insert_update_user` (`mail` VARCHAR(80), `type` INT(11), `name` VARCHAR(40), `surname` VARCHAR(60), `state` INT(5))  BEGIN
    INSERT INTO user(User_id,User_mail,User_type,User_name,User_surname,User_state) 
    VALUES (NULL,mail,type,name,surname,state) 
    ON DUPLICATE KEY UPDATE User_name=name, User_surname=surname,User_state=state,User_type=type;
END$$

DROP PROCEDURE IF EXISTS `Insert_update_visit`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Insert_update_visit` (IN `code_vis` VARCHAR(40), IN `date_vis` VARCHAR(10), IN `user_vis` INT(11), IN `business_vis` INT(11), IN `state_vis` INT(11))  BEGIN
	INSERT INTO Visit(Visit_id,Visit_code,Visit_date,Visit_user,Visit_business,Visit_state)
	VALUES (NULL,code_vis,date_vis,user_vis,business_vis,state_vis)
    ON DUPLICATE KEY UPDATE Visit_state=state_vis;
END$$

DROP PROCEDURE IF EXISTS `Log_user`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Log_user` (IN `mac` VARCHAR(40), IN `password_user` VARCHAR(80), IN `mail` VARCHAR(80))  BEGIN
    SELECT Us.User_id, Us.User_name, Us.User_surname FROM Login 
    INNER JOIN User AS Us ON Us.User_id=Login.Log_user_id
    WHERE Login.Log_mac=mac AND Login.Log_password=password_user 
    AND Us.User_mail=mail AND Us.User_state=1;
END$$

DROP PROCEDURE IF EXISTS `Search_business`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Search_business` (IN `nit` VARCHAR(40))  BEGIN
	SET @vardomain= CONCAT('%',LOWER(TRIM(nit)),'%');
    SELECT * FROM Business WHERE Business_nit LIKE @vardomain;
END$$

DROP PROCEDURE IF EXISTS `Search_request`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Search_request` (IN `code_request` VARCHAR(20), IN `visit_request` VARCHAR(20), IN `type` INT(11))  BEGIN
	IF type=0  THEN
    	SELECT * FROM Request WHERE Request_code=code_request;
    ELSEIF type=1 THEN
    	SELECT * FROM Request WHERE Request_visit=visit_request;
    ELSE 
    	SELECT * FROM Request;	
    END IF;
END$$

DROP PROCEDURE IF EXISTS `Search_user`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Search_user` (IN `mail` VARCHAR(120), IN `state` INT(11))  BEGIN
    SELECT * FROM User 
    WHERE User_mail LIKE CONCAT('%',mail,'%') AND User_state=state;
END$$

DROP PROCEDURE IF EXISTS `Search_visit`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Search_visit` (IN `Code` VARCHAR(20))  BEGIN
 SELECT VI.Visit_code AS CODE,VI.Visit_date AS DATE,BUS.Business_nit AS NIT, US.User_name AS NAME, US.User_surname  AS SURNAME, ST.State_name FROM Visit AS VI INNER JOIN Business AS BUS ON VI.Visit_business=BUS.Business_id INNER JOIN User AS US ON VI.Visit_user=US.User_id INNER JOIN State AS ST ON VI.Visit_state=ST.State_id WHERE VI.Visit_code=Code;
END$$

DROP PROCEDURE IF EXISTS `Search_visi_usert`$$
CREATE DEFINER=`tecnipalma`@`localhost` PROCEDURE `Search_visi_usert` (IN `mail` VARCHAR(120))  BEGIN
 SELECT VI.Visit_code AS CODE,VI.Visit_date AS DATE,BUS.Business_nit AS NIT, US.User_name AS NAME, US.User_surname  AS SURNAME, ST.State_name FROM Visit AS VI INNER JOIN Business AS BUS ON VI.Visit_business=BUS.Business_id INNER JOIN User AS US ON VI.Visit_user=US.User_id INNER JOIN State AS ST ON VI.Visit_state=ST.State_id WHERE US.User_mail=mail;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Attachments`
--

DROP TABLE IF EXISTS `Attachments`;
CREATE TABLE IF NOT EXISTS `Attachments` (
  `Atta_id` int(11) NOT NULL AUTO_INCREMENT,
  `Atta_path_ftp` varchar(200) NOT NULL,
  `Atta_name` varchar(60) NOT NULL,
  `Atta_type` int(11) NOT NULL,
  `Atta_request` varchar(20) NOT NULL,
  PRIMARY KEY (`Atta_id`),
  UNIQUE KEY `Atta_path_ftp` (`Atta_path_ftp`),
  KEY `attachments_request` (`Atta_request`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `Attachments`
--

TRUNCATE TABLE `Attachments`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Business`
--

DROP TABLE IF EXISTS `Business`;
CREATE TABLE IF NOT EXISTS `Business` (
  `Business_id` int(11) NOT NULL AUTO_INCREMENT,
  `Business_nit` varchar(40) NOT NULL,
  `Business_name` varchar(60) NOT NULL,
  `Business_address` varchar(80) NOT NULL,
  `Business_phone` varchar(20) NOT NULL,
  `Business_mail` varchar(80) NOT NULL,
  PRIMARY KEY (`Business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `Business`
--

TRUNCATE TABLE `Business`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Login`
--

DROP TABLE IF EXISTS `Login`;
CREATE TABLE IF NOT EXISTS `Login` (
  `Log_id` int(11) NOT NULL AUTO_INCREMENT,
  `Log_mac` varchar(40) NOT NULL,
  `Log_password` varchar(60) NOT NULL,
  `Log_user_id` int(11) NOT NULL,
  PRIMARY KEY (`Log_id`),
  KEY `Login_user` (`Log_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `Login`
--

TRUNCATE TABLE `Login`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Meeting`
--

DROP TABLE IF EXISTS `Meeting`;
CREATE TABLE IF NOT EXISTS `Meeting` (
  `Meeting_id` int(11) NOT NULL AUTO_INCREMENT,
  `Meeting_date` varchar(10) NOT NULL,
  `Mennting_contact` int(11) NOT NULL,
  `Mennting_description` varchar(200) NOT NULL,
  `Mennting_visit` varchar(20) NOT NULL,
  PRIMARY KEY (`Meeting_id`),
  KEY `Meeting_contact` (`Mennting_contact`),
  KEY `Meeting_visit` (`Mennting_visit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `Meeting`
--

TRUNCATE TABLE `Meeting`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Request`
--

DROP TABLE IF EXISTS `Request`;
CREATE TABLE IF NOT EXISTS `Request` (
  `Request_id` int(11) NOT NULL AUTO_INCREMENT,
  `Request_type` int(11) NOT NULL,
  `Request_code` varchar(20) NOT NULL,
  `Request_description` varchar(120) NOT NULL,
  `Request_state` int(11) NOT NULL,
  `Request_meeting` int(11) NOT NULL,
  PRIMARY KEY (`Request_id`),
  UNIQUE KEY `Request_code` (`Request_code`),
  KEY `Request_meeting` (`Request_meeting`),
  KEY `Request_state` (`Request_state`),
  KEY `Request_type_request` (`Request_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table for Request administration';

--
-- Truncar tablas antes de insertar `Request`
--

TRUNCATE TABLE `Request`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `State`
--

DROP TABLE IF EXISTS `State`;
CREATE TABLE IF NOT EXISTS `State` (
  `State_id` int(11) NOT NULL AUTO_INCREMENT,
  `State_name` varchar(60) NOT NULL,
  `State_description` varchar(120) NOT NULL,
  PRIMARY KEY (`State_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table for state administration';

--
-- Truncar tablas antes de insertar `State`
--

TRUNCATE TABLE `State`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Type_request`
--

DROP TABLE IF EXISTS `Type_request`;
CREATE TABLE IF NOT EXISTS `Type_request` (
  `Type_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_request_name` varchar(60) NOT NULL,
  `Type_request_description` varchar(200) NOT NULL,
  PRIMARY KEY (`Type_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table for type request administrator ';

--
-- Truncar tablas antes de insertar `Type_request`
--

TRUNCATE TABLE `Type_request`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Type_user`
--

DROP TABLE IF EXISTS `Type_user`;
CREATE TABLE IF NOT EXISTS `Type_user` (
  `Type_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_user_name` varchar(40) NOT NULL,
  `Type_user_description` varchar(120) NOT NULL,
  PRIMARY KEY (`Type_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `Type_user`
--

TRUNCATE TABLE `Type_user`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(60) NOT NULL,
  `User_surname` varchar(80) NOT NULL,
  `User_mail` varchar(120) NOT NULL,
  `User_state` int(11) NOT NULL,
  `User_type` int(11) NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `User_mail` (`User_mail`),
  KEY `User_typeUser` (`User_type`),
  KEY `User_state` (`User_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table for user administration';

--
-- Truncar tablas antes de insertar `User`
--

TRUNCATE TABLE `User`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User_contact`
--

DROP TABLE IF EXISTS `User_contact`;
CREATE TABLE IF NOT EXISTS `User_contact` (
  `User_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_contact_name` varchar(40) NOT NULL,
  PRIMARY KEY (`User_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `User_contact`
--

TRUNCATE TABLE `User_contact`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Visit`
--

DROP TABLE IF EXISTS `Visit`;
CREATE TABLE IF NOT EXISTS `Visit` (
  `Visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `Visit_code` varchar(20) NOT NULL,
  `Visit_date` varchar(10) NOT NULL,
  `Visit_user` int(11) NOT NULL,
  `Visit_business` int(11) NOT NULL,
  PRIMARY KEY (`Visit_id`),
  UNIQUE KEY `Visit_code` (`Visit_code`),
  KEY `Visit_user` (`Visit_user`),
  KEY `visit_business` (`Visit_business`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `Visit`
--

TRUNCATE TABLE `Visit`;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Attachments`
--
ALTER TABLE `Attachments`
  ADD CONSTRAINT `attachments_request` FOREIGN KEY (`Atta_request`) REFERENCES `Request` (`Request_code`);

--
-- Filtros para la tabla `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `Login_user` FOREIGN KEY (`Log_user_id`) REFERENCES `User` (`User_id`);

--
-- Filtros para la tabla `Meeting`
--
ALTER TABLE `Meeting`
  ADD CONSTRAINT `Meeting_contact` FOREIGN KEY (`Mennting_contact`) REFERENCES `User_contact` (`User_contact_id`),
  ADD CONSTRAINT `Meeting_visit` FOREIGN KEY (`Mennting_visit`) REFERENCES `Visit` (`Visit_code`);

--
-- Filtros para la tabla `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `Request_meeting` FOREIGN KEY (`Request_meeting`) REFERENCES `Meeting` (`Meeting_id`),
  ADD CONSTRAINT `Request_state` FOREIGN KEY (`Request_state`) REFERENCES `State` (`State_id`),
  ADD CONSTRAINT `Request_type_request` FOREIGN KEY (`Request_type`) REFERENCES `Type_request` (`Type_request_id`);

--
-- Filtros para la tabla `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_state` FOREIGN KEY (`User_state`) REFERENCES `State` (`State_id`),
  ADD CONSTRAINT `User_typeUser` FOREIGN KEY (`User_type`) REFERENCES `Type_user` (`Type_user_id`);

--
-- Filtros para la tabla `Visit`
--
ALTER TABLE `Visit`
  ADD CONSTRAINT `Visit_user` FOREIGN KEY (`Visit_user`) REFERENCES `User` (`User_id`),
  ADD CONSTRAINT `visit_business` FOREIGN KEY (`Visit_business`) REFERENCES `Business` (`Business_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
