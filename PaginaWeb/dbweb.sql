-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2019 a las 08:24:56
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbweb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnew` ()  NO SQL
BEGIN
set @ur := 0;
select registro into @ur from r;
insert into calificacion ( `id_asignatura`, `registro`, `periodo`, `calificacion`, `nomina`) VALUES
        ('MPPHU2906BT',@ur, 'Ago-Dic 18', NULL, 1000),
        ('MPF3006MCC', @ur, 'Ago-Dic 18', NULL, 1010),
        ('MPPMT2706BT',@ur, 'Ago-Dic 18', NULL, 1020),
        ('MPF2106DSO', @ur, 'Ago-Dic 18', NULL, 1030),
        ('MPF2206DSO', @ur, 'Ago-Dic 18', NULL, 2222),
        ('MPF2306DSO', @ur, 'Ago-Dic 18', NULL, 1040),
        ('MPF2406DSO', @ur, 'Ago-Dic 18', NULL, 1050),
        ('MPF2506DSO', @ur, 'Ago-Dic 18', NULL, 1060),
        ('MPF2806MCC', @ur, 'Ago-Dic 18', NULL, 1070),
        ('MBCS2405BT', @ur, 'Feb-Jul 17', NULL, 1080),
        ('MPF1605DSO', @ur, 'Feb-Jul 17', NULL, 1090),
        ('MPF1705DSO', @ur, 'Feb-Jul 17', NULL, 1100),
        ('MPF1805DSO', @ur, 'Feb-Jul 17', NULL, 1110),
        ('MPF1905DSO', @ur, 'Feb-Jul 17', NULL, 1120),
        ('MPF2005DSO', @ur, 'Feb-Jul 17', NULL, 1090),
        ('MPF2505MCC', @ur, 'Feb-Jul 17', NULL, 1130),
        ('MPPCO2605BT',@ur, 'Feb-Jul 17', NULL, 1010),
        ('MPPMT2305BT',@ur, 'Feb-Jul 17', NULL, 1140);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia`
--

CREATE TABLE `academia` (
  `id_academia` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_carrera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `academia`
--

INSERT INTO `academia` (`id_academia`, `nombre`, `id_carrera`) VALUES
(1, 'Informática', 100),
(2, 'Computación', 100),
(3, 'IT', 100),
(4, 'Electrónica Analógica', 100),
(5, 'Electrónica Digital', 100),
(6, 'Inglés', 900),
(7, 'Matemáticas', 1000),
(8, 'Física', 1000),
(9, 'Química', 1000),
(10, 'Dibujo', 1000),
(11, 'Ingeniería Industrial', 900),
(12, 'Metodologías', 900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `REGISTRO` int(11) NOT NULL,
  `DOMICILIO` varchar(45) DEFAULT NULL,
  `CELULAR` bigint(20) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `APELLIDO_MATERNO` varchar(20) DEFAULT NULL,
  `APELLIDO_PATERNO` varchar(10) DEFAULT NULL,
  `COLONIA` varchar(30) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `CLAVE_MUNICIPIO` int(11) DEFAULT NULL,
  `ID_CARRERA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`REGISTRO`, `DOMICILIO`, `CELULAR`, `SEXO`, `APELLIDO_MATERNO`, `APELLIDO_PATERNO`, `COLONIA`, `NOMBRE`, `password`, `CLAVE_MUNICIPIO`, `ID_CARRERA`) VALUES
(15100026, ' Cadiz #2884', 3322281955, 'M', 'Marquez ', 'Amezua', ' Fraccionamiento Autocinema', ' Carlos Daniel', 'zIÆî¹mù‰Ú{Û:t', 120, 100),
(15100318, 'Calle tesistan #478 ', 3334899490, 'M', 'Zamora', 'Ron', ' La Venta del Astillero', 'Jose Maria ', '²¤UÂ/P/N¥‹¬óú~”@', 120, 100),
(15100363, 'C. Aquiles serdan #106', 3323716566, 'M', 'Torres', ' Vazquez', 'Atemajac del valle', 'Jose Guadalupe', '²¤UÂ/P/N¥‹¬óú~”@', 120, 100),
(15300203, 'Avenida Campo Real Oriente #433', 3317025959, 'M', 'Becerra', 'Orozco', 'Campo Real', 'Tito Osvaldo', 'åü´®DLŠéÝ==[²', 120, 100),
(16100027, 'C. Casa Blanca 135 #219 ', 3311030523, 'M', 'Pardo', 'Arroyo', 'Fracc. Real Casa Blanca', 'Pedro Eduardo', '–%Ø“mBËD˜RŽÎ]Å', 120, 100),
(16100030, 'Marina Puerto Melaque #12', 3317649385, 'M', 'Pérez', 'Ayala', 'Residencial Santa Margarita', 'Sydney Alejandro', '1ó–áó;•*Ó±&eË)Ï', 120, 100),
(16100066, 'C. Del Itsml #1781', 3322289617, 'M', 'Criollo', 'Corona', 'Mezquitán Country', 'Roberto', '²ôd­Fƒ³éêFÈM1’', 120, 100),
(16100117, 'C. Arco Tiberio #878', 3334999593, 'M', 'Corona', 'Gómez', 'Arcos de Zapopan', 'Fernando Zazir', '@V×^ ÒFú-qÞLB', 120, 100),
(16100156, ' Avenida Valdepeñas', 3317032900, 'M', 'Martinez de castro', ' Iñiguez', ' Real de valdepeñas', 'Roberto Daniel', 'o…³\\Åíœ.Î)ë,/ê', 120, 100),
(16100167, 'PROL LAURELES #1311 A ', 3323403259, 'M', 'Estrada ', 'Leon ', 'SAN GILBERTO', 'Rafael', 'ˆ[ë¹]öž-õÌËnUÐ', 120, 100),
(16100181, 'C. GRAL EULOGIO PARRA #1543 ', 3315751278, 'M', 'Espinoza ', 'Luis ', 'VILLASEÑOR ', 'Miguel Angel ', 'ã>—®¬gŽË×\'8$îò³¹', 39, 100),
(16100239, 'C. Bahía de todos los Santos #2889 int 30', 3321121765, 'M', 'Delgado', 'Ortega', 'Parques de Santa María', 'Emilio Alejandro', '<|lqQYv*#‡Ïq5', 98, 100),
(16100246, ' C. Bosques del Centinela 576', 3313104474, 'M', ' Ballesteros', 'Palomera ', 'Villas del Centinela', ' Eduardo', 'Íj™\0ìô.>´Aæ@¨', 120, 100),
(16100261, 'Manuel Acuña #181', 3315186191, 'M', 'Alcantar', 'Pintor', 'Colonia Barranquitas', 'Álvaro Misael', 'Òïv\Zeîªj¯•Ñ®SE', 120, 100),
(16100288, 'C. Canarias 1074 E. 13', 3317473102, 'M', 'Angeles', 'Rodríguez', 'Chapultepec Country', 'Gabriel Alfonso', 'Ç’NfÌ©Ÿ	ë·ÆË%Ñ%', 39, 100),
(16100290, 'C. Santa Monica #340 int. 30', 3312131813, 'M', 'Martínez', 'Rodríguez', 'Parques de Zapopan', 'Gabriel Alejandro', '†‹@8ÏnÁµòdö½e', 120, 100),
(16100605, 'C. Paseo de las Aves #5270', 3314712619, 'M', 'Rodríguez ', 'Ruiz', 'Huentitán el Alto', 'Oscar Isaac', 'ÛK\r6Îms(Vgmv¢å', 39, 100);

--
-- Disparadores `alumno`
--
DELIMITER $$
CREATE TRIGGER `alumnew` AFTER INSERT ON `alumno` FOR EACH ROW call alumnew()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `Id_Asignatura` varchar(15) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `id_academia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`Id_Asignatura`, `nombre`, `id_academia`) VALUES
('MBCS2405BT', 'Ciencia, Tecnoloía, Sociedad y Valores', 12),
('MPF1605DSO', 'Arquitectura de Computadoras', 5),
('MPF1705DSO', 'Base de Datos I', 1),
('MPF1805DSO', 'Redes WAN', 3),
('MPF1905DSO', 'Estructura de Datos', 2),
('MPF2005DSO', 'Interfaces', 4),
('MPF2106DSO', 'Organización de Computadoras', 4),
('MPF2206DSO', 'Bases de Datos II', 1),
('MPF2306DSO', 'Sistemas Operativos', 3),
('MPF2406DSO', 'Programación Móvil I', 2),
('MPF2505MCC', 'Administración', 12),
('MPF2506DSO', 'Sistemas de Medición y Control', 4),
('MPF2806MCC', 'Metodología de la Investigación Aplicada', 12),
('MPF3006MCC', 'Inglés VI', 6),
('MPPCO2605BT', 'Inglés V', 6),
('MPPHU2906BT', 'Filosofía', 12),
('MPPMT2305BT', 'Matemáticas V', 7),
('MPPMT2706BT', 'Matemáticas VI', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `clave_cursa` int(11) NOT NULL,
  `id_asignatura` varchar(15) DEFAULT NULL,
  `registro` int(11) DEFAULT NULL,
  `periodo` char(11) DEFAULT NULL,
  `calificacion` tinyint(4) DEFAULT NULL,
  `nomina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`clave_cursa`, `id_asignatura`, `registro`, `periodo`, `calificacion`, `nomina`) VALUES
(1, 'MPPHU2906BT', 16100167, 'Ago-Dic 18', 100, 1000),
(2, 'MPF3006MCC', 16100167, 'Ago-Dic 18', 99, 1010),
(3, 'MPPMT2706BT', 16100167, 'Ago-Dic 18', 95, 1020),
(4, 'MPF2106DSO', 16100167, 'Ago-Dic 18', 93, 1030),
(5, 'MPF2206DSO', 16100167, 'Ago-Dic 18', 80, 2222),
(6, 'MPF2306DSO', 16100167, 'Ago-Dic 18', 97, 1040),
(7, 'MPF2406DSO', 16100167, 'Ago-Dic 18', 100, 1050),
(8, 'MPF2506DSO', 16100167, 'Ago-Dic 18', 97, 1060),
(9, 'MPF2806MCC', 16100167, 'Ago-Dic 18', 100, 1070),
(10, 'MBCS2405BT', 16100167, 'Feb-Jul 17', 90, 1080),
(11, 'MPF1605DSO', 16100167, 'Feb-Jul 17', 89, 1090),
(12, 'MPF1705DSO', 16100167, 'Feb-Jul 17', 92, 1100),
(13, 'MPF1805DSO', 16100167, 'Feb-Jul 17', 96, 1110),
(14, 'MPF1905DSO', 16100167, 'Feb-Jul 17', 88, 1120),
(15, 'MPF2005DSO', 16100167, 'Feb-Jul 17', 91, 1090),
(16, 'MPF2505MCC', 16100167, 'Feb-Jul 17', 89, 1130),
(17, 'MPPCO2605BT', 16100167, 'Feb-Jul 17', 75, 1010),
(18, 'MPPMT2305BT', 16100167, 'Feb-Jul 17', 100, 1140),
(19, 'MPPHU2906BT', 15100318, 'Ago-Dic 18', 85, 1000),
(20, 'MPF3006MCC', 15100318, 'Ago-Dic 18', 82, 1010),
(21, 'MPPMT2706BT', 15100318, 'Ago-Dic 18', 70, 1020),
(22, 'MPF2106DSO', 15100318, 'Ago-Dic 18', 35, 1030),
(23, 'MPF2206DSO', 15100318, 'Ago-Dic 18', 44, 2222),
(24, 'MPF2306DSO', 15100318, 'Ago-Dic 18', 81, 1040),
(25, 'MPF2406DSO', 15100318, 'Ago-Dic 18', 60, 1050),
(26, 'MPF2506DSO', 15100318, 'Ago-Dic 18', 70, 1060),
(27, 'MPF2806MCC', 15100318, 'Ago-Dic 18', 85, 1070),
(28, 'MBCS2405BT', 15100318, 'Feb-Jul 17', 91, 1080),
(29, 'MPF1605DSO', 15100318, 'Feb-Jul 17', 81, 1090),
(30, 'MPF1705DSO', 15100318, 'Feb-Jul 17', 89, 1100),
(31, 'MPF1805DSO', 15100318, 'Feb-Jul 17', 95, 1110),
(32, 'MPF1905DSO', 15100318, 'Feb-Jul 17', 75, 1120),
(33, 'MPF2005DSO', 15100318, 'Feb-Jul 17', 73, 1090),
(34, 'MPF2505MCC', 15100318, 'Feb-Jul 17', 72, 1130),
(35, 'MPPCO2605BT', 15100318, 'Feb-Jul 17', 84, 1010),
(36, 'MPPMT2305BT', 15100318, 'Feb-Jul 17', 93, 1140),
(37, 'MPPHU2906BT', 15300203, 'Ago-Dic 18', 77, 1000),
(38, 'MPF3006MCC', 15300203, 'Ago-Dic 18', 97, 1010),
(39, 'MPPMT2706BT', 15300203, 'Ago-Dic 18', 92, 1020),
(40, 'MPF2106DSO', 15300203, 'Ago-Dic 18', 35, 1030),
(41, 'MPF2206DSO', 15300203, 'Ago-Dic 18', 41, 2222),
(42, 'MPF2306DSO', 15300203, 'Ago-Dic 18', 88, 1040),
(43, 'MPF2406DSO', 15300203, 'Ago-Dic 18', 28, 1050),
(44, 'MPF2506DSO', 15300203, 'Ago-Dic 18', 60, 1060),
(45, 'MPF2806MCC', 15300203, 'Ago-Dic 18', 78, 1070),
(46, 'MBCS2405BT', 15300203, 'Feb-Jul 17', 75, 1080),
(47, 'MPF1605DSO', 15300203, 'Feb-Jul 17', 92, 1090),
(48, 'MPF1705DSO', 15300203, 'Feb-Jul 17', 74, 1100),
(49, 'MPF1805DSO', 15300203, 'Feb-Jul 17', 70, 1110),
(50, 'MPF1905DSO', 15300203, 'Feb-Jul 17', 70, 1120),
(51, 'MPF2005DSO', 15300203, 'Feb-Jul 17', 70, 1090),
(52, 'MPF2505MCC', 15300203, 'Feb-Jul 17', 79, 1130),
(53, 'MPPCO2605BT', 15300203, 'Feb-Jul 17', 77, 1010),
(54, 'MPPMT2305BT', 15300203, 'Feb-Jul 17', 92, 1140),
(55, 'MPF2506DSO', 16100181, 'Ago-Dic 18', 100, 1060),
(56, 'MPF2406DSO', 16100181, 'Ago-Dic 18', 92, 1050),
(57, 'MPF2306DSO', 16100181, 'Ago-Dic 18', 97, 1040),
(58, 'MPF2106DSO', 16100181, 'Ago-Dic 18', 92, 1030),
(59, 'MPF2206DSO', 16100181, 'Ago-Dic 18', 73, 2222),
(60, 'MPPMT2706BT', 16100181, 'Ago-Dic 18', 100, 1020),
(61, 'MPPHU2906BT', 16100181, 'Ago-Dic 18', 97, 1000),
(62, 'MPF3006MCC', 16100181, 'Ago-Dic 18', 99, 1010),
(63, 'MPF2806MCC', 16100181, 'Ago-Dic 18', 97, 1070),
(64, 'MBCS2405BT', 16100181, 'Feb-Jul 17', 95, 1080),
(65, 'MPF1605DSO', 16100181, 'Feb-Jul 17', 90, 1090),
(66, 'MPF1705DSO', 16100181, 'Feb-Jul 17', 92, 1100),
(67, 'MPF1805DSO', 16100181, 'Feb-Jul 17', 97, 1110),
(68, 'MPF1905DSO', 16100181, 'Feb-Jul 17', 87, 1120),
(69, 'MPF2005DSO', 16100181, 'Feb-Jul 17', 91, 1090),
(70, 'MPF2505MCC', 16100181, 'Feb-Jul 17', 87, 1130),
(71, 'MPPCO2605BT', 16100181, 'Feb-Jul 17', 72, 1010),
(72, 'MPPMT2305BT', 16100181, 'Feb-Jul 17', 100, 1140),
(73, 'MPF2506DSO', 16100605, 'Ago-Dic 18', 90, 1060),
(74, 'MPF2406DSO', 16100605, 'Ago-Dic 18', 78, 1050),
(75, 'MPF2306DSO', 16100605, 'Ago-Dic 18', 80, 1040),
(76, 'MPF2106DSO', 16100605, 'Ago-Dic 18', 76, 1030),
(77, 'MPF2206DSO', 16100605, 'Ago-Dic 18', 61, 2222),
(78, 'MPPMT2706BT', 16100605, 'Ago-Dic 18', 93, 1020),
(79, 'MPPHU2906BT', 16100605, 'Ago-Dic 18', 100, 1000),
(80, 'MPF3006MCC', 16100605, 'Ago-Dic 18', 94, 1010),
(81, 'MPF2806MCC', 16100605, 'Ago-Dic 18', 100, 1070),
(82, 'MBCS2405BT', 16100605, 'Feb-Jul 17', 98, 1080),
(83, 'MPF1605DSO', 16100605, 'Feb-Jul 17', 96, 1090),
(84, 'MPF1705DSO', 16100605, 'Feb-Jul 17', 100, 1100),
(85, 'MPF1805DSO', 16100605, 'Feb-Jul 17', 86, 1110),
(86, 'MPF1905DSO', 16100605, 'Feb-Jul 17', 95, 1120),
(87, 'MPF2005DSO', 16100605, 'Feb-Jul 17', 89, 1090),
(88, 'MPF2505MCC', 16100605, 'Feb-Jul 17', 95, 1130),
(89, 'MPPCO2605BT', 16100605, 'Feb-Jul 17', 90, 1010),
(90, 'MPPMT2305BT', 16100605, 'Feb-Jul 17', 98, 1140),
(91, 'MPF2506DSO', 16100030, 'Ago-Dic 18', 73, 1060),
(92, 'MPF2406DSO', 16100030, 'Ago-Dic 18', 40, 1050),
(93, 'MPF2306DSO', 16100030, 'Ago-Dic 18', 91, 1040),
(94, 'MPF2106DSO', 16100030, 'Ago-Dic 18', 72, 1030),
(95, 'MPF2206DSO', 16100030, 'Ago-Dic 18', 50, 2222),
(96, 'MPPMT2706BT', 16100030, 'Ago-Dic 18', 97, 1020),
(97, 'MPPHU2906BT', 16100030, 'Ago-Dic 18', 95, 1000),
(98, 'MPF3006MCC', 16100030, 'Ago-Dic 18', 98, 1010),
(99, 'MPF2806MCC', 16100030, 'Ago-Dic 18', 93, 1070),
(100, 'MBCS2405BT', 16100030, 'Feb-Jul 17', 98, 1080),
(101, 'MPF1605DSO', 16100030, 'Feb-Jul 17', 72, 1090),
(102, 'MPF1705DSO', 16100030, 'Feb-Jul 17', 80, 1100),
(103, 'MPF1805DSO', 16100030, 'Feb-Jul 17', 88, 1110),
(104, 'MPF1905DSO', 16100030, 'Feb-Jul 17', 73, 1120),
(105, 'MPF2005DSO', 16100030, 'Feb-Jul 17', 82, 1090),
(106, 'MPF2505MCC', 16100030, 'Feb-Jul 17', 76, 1130),
(107, 'MPPCO2605BT', 16100030, 'Feb-Jul 17', 81, 1010),
(108, 'MPPMT2305BT', 16100030, 'Feb-Jul 17', 96, 1140),
(109, 'MPF2506DSO', 16100261, 'Ago-Dic 18', 90, 1060),
(110, 'MPF2406DSO', 16100261, 'Ago-Dic 18', 72, 1050),
(111, 'MPF2306DSO', 16100261, 'Ago-Dic 18', 94, 1040),
(112, 'MPF2106DSO', 16100261, 'Ago-Dic 18', 62, 1030),
(113, 'MPF2206DSO', 16100261, 'Ago-Dic 18', 60, 2222),
(114, 'MPPMT2706BT', 16100261, 'Ago-Dic 18', 73, 1020),
(115, 'MPPHU2906BT', 16100261, 'Ago-Dic 18', 95, 1000),
(116, 'MPF3006MCC', 16100261, 'Ago-Dic 18', 92, 1010),
(117, 'MPF2806MCC', 16100261, 'Ago-Dic 18', 100, 1070),
(118, 'MBCS2405BT', 16100261, 'Feb-Jul 17', 86, 1080),
(119, 'MPF1605DSO', 16100261, 'Feb-Jul 17', 70, 1090),
(120, 'MPF1705DSO', 16100261, 'Feb-Jul 17', 70, 1100),
(121, 'MPF1805DSO', 16100261, 'Feb-Jul 17', 99, 1110),
(122, 'MPF1905DSO', 16100261, 'Feb-Jul 17', 73, 1120),
(123, 'MPF2005DSO', 16100261, 'Feb-Jul 17', 87, 1090),
(124, 'MPF2505MCC', 16100261, 'Feb-Jul 17', 75, 1130),
(125, 'MPPCO2605BT', 16100261, 'Feb-Jul 17', 70, 1010),
(126, 'MPPMT2305BT', 16100261, 'Feb-Jul 17', 98, 1140),
(127, 'MPF2506DSO', 16100290, 'Ago-Dic 18', 70, 1060),
(128, 'MPF2406DSO', 16100290, 'Ago-Dic 18', 26, 1050),
(129, 'MPF2306DSO', 16100290, 'Ago-Dic 18', 91, 1040),
(130, 'MPF2106DSO', 16100290, 'Ago-Dic 18', 63, 1030),
(131, 'MPF2206DSO', 16100290, 'Ago-Dic 18', 48, 2222),
(132, 'MPPMT2706BT', 16100290, 'Ago-Dic 18', 85, 1020),
(133, 'MPPHU2906BT', 16100290, 'Ago-Dic 18', 85, 1000),
(134, 'MPF3006MCC', 16100290, 'Ago-Dic 18', 83, 1010),
(135, 'MPF2806MCC', 16100290, 'Ago-Dic 18', 87, 1070),
(136, 'MBCS2405BT', 16100290, 'Feb-Jul 17', 86, 1080),
(137, 'MPF1605DSO', 16100290, 'Feb-Jul 17', 74, 1090),
(138, 'MPF1705DSO', 16100290, 'Feb-Jul 17', 83, 1100),
(139, 'MPF1805DSO', 16100290, 'Feb-Jul 17', 97, 1110),
(140, 'MPF1905DSO', 16100290, 'Feb-Jul 17', 83, 1120),
(141, 'MPF2005DSO', 16100290, 'Feb-Jul 17', 79, 1090),
(142, 'MPF2505MCC', 16100290, 'Feb-Jul 17', 72, 1130),
(143, 'MPPCO2605BT', 16100290, 'Feb-Jul 17', 86, 1010),
(144, 'MPPMT2305BT', 16100290, 'Feb-Jul 17', 81, 1140),
(145, 'MPF2506DSO', 16100239, 'Ago-Dic 18', 87, 1060),
(146, 'MPF2406DSO', 16100239, 'Ago-Dic 18', 80, 1050),
(147, 'MPF2306DSO', 16100239, 'Ago-Dic 18', 94, 1040),
(148, 'MPF2106DSO', 16100239, 'Ago-Dic 18', 83, 1030),
(149, 'MPF2206DSO', 16100239, 'Ago-Dic 18', 61, 2222),
(150, 'MPPMT2706BT', 16100239, 'Ago-Dic 18', 100, 1020),
(151, 'MPPHU2906BT', 16100239, 'Ago-Dic 18', 91, 1000),
(152, 'MPF3006MCC', 16100239, 'Ago-Dic 18', 85, 1010),
(153, 'MPF2806MCC', 16100239, 'Ago-Dic 18', 100, 1070),
(154, 'MBCS2405BT', 16100239, 'Feb-Jul 17', 93, 1080),
(155, 'MPF1605DSO', 16100239, 'Feb-Jul 17', 75, 1090),
(156, 'MPF1705DSO', 16100239, 'Feb-Jul 17', 86, 1100),
(157, 'MPF1805DSO', 16100239, 'Feb-Jul 17', 96, 1110),
(158, 'MPF1905DSO', 16100239, 'Feb-Jul 17', 76, 1120),
(159, 'MPF2005DSO', 16100239, 'Feb-Jul 17', 86, 1090),
(160, 'MPF2505MCC', 16100239, 'Feb-Jul 17', 76, 1130),
(161, 'MPPCO2605BT', 16100239, 'Feb-Jul 17', 78, 1010),
(162, 'MPPMT2305BT', 16100239, 'Feb-Jul 17', 83, 1140),
(163, 'MPF2506DSO', 16100066, 'Ago-Dic 18', 74, 1060),
(164, 'MPF2406DSO', 16100066, 'Ago-Dic 18', 64, 1050),
(165, 'MPF2306DSO', 16100066, 'Ago-Dic 18', 81, 1040),
(166, 'MPF2106DSO', 16100066, 'Ago-Dic 18', 68, 1030),
(167, 'MPF2206DSO', 16100066, 'Ago-Dic 18', 60, 2222),
(168, 'MPPMT2706BT', 16100066, 'Ago-Dic 18', 99, 1020),
(169, 'MPPHU2906BT', 16100066, 'Ago-Dic 18', 100, 1000),
(170, 'MPF3006MCC', 16100066, 'Ago-Dic 18', 96, 1010),
(171, 'MPF2806MCC', 16100066, 'Ago-Dic 18', 100, 1070),
(172, 'MBCS2405BT', 16100066, 'Feb-Jul 17', 89, 1080),
(173, 'MPF1605DSO', 16100066, 'Feb-Jul 17', 70, 1090),
(174, 'MPF1705DSO', 16100066, 'Feb-Jul 17', 80, 1100),
(175, 'MPF1805DSO', 16100066, 'Feb-Jul 17', 94, 1110),
(176, 'MPF1905DSO', 16100066, 'Feb-Jul 17', 90, 1120),
(177, 'MPF2005DSO', 16100066, 'Feb-Jul 17', 80, 1090),
(178, 'MPF2505MCC', 16100066, 'Feb-Jul 17', 78, 1130),
(179, 'MPPCO2605BT', 16100066, 'Feb-Jul 17', 80, 1010),
(180, 'MPPMT2305BT', 16100066, 'Feb-Jul 17', 79, 1140),
(181, 'MPF2506DSO', 16100117, 'Ago-Dic 18', 50, 1060),
(182, 'MPF2406DSO', 16100117, 'Ago-Dic 18', 40, 1050),
(183, 'MPF2306DSO', 16100117, 'Ago-Dic 18', 91, 1040),
(184, 'MPF2106DSO', 16100117, 'Ago-Dic 18', 30, 1030),
(185, 'MPF2206DSO', 16100117, 'Ago-Dic 18', 60, 2222),
(186, 'MPPMT2706BT', 16100117, 'Ago-Dic 18', 73, 1020),
(187, 'MPPHU2906BT', 16100117, 'Ago-Dic 18', 100, 1000),
(188, 'MPF3006MCC', 16100117, 'Ago-Dic 18', 66, 1010),
(189, 'MPF2806MCC', 16100117, 'Ago-Dic 18', 0, 1070),
(190, 'MBCS2405BT', 16100117, 'Feb-Jul 17', 80, 1080),
(191, 'MPF1605DSO', 16100117, 'Feb-Jul 17', 70, 1090),
(192, 'MPF1705DSO', 16100117, 'Feb-Jul 17', 85, 1100),
(193, 'MPF1805DSO', 16100117, 'Feb-Jul 17', 80, 1110),
(194, 'MPF1905DSO', 16100117, 'Feb-Jul 17', 80, 1120),
(195, 'MPF2005DSO', 16100117, 'Feb-Jul 17', 80, 1090),
(196, 'MPF2505MCC', 16100117, 'Feb-Jul 17', 78, 1130),
(197, 'MPPCO2605BT', 16100117, 'Feb-Jul 17', 83, 1010),
(198, 'MPPMT2305BT', 16100117, 'Feb-Jul 17', 83, 1140),
(199, 'MPF2506DSO', 16100156, 'Ago-Dic 18', 71, 1060),
(200, 'MPF2406DSO', 16100156, 'Ago-Dic 18', 84, 1050),
(201, 'MPF2306DSO', 16100156, 'Ago-Dic 18', 97, 1040),
(202, 'MPF2106DSO', 16100156, 'Ago-Dic 18', 73, 1030),
(203, 'MPF2206DSO', 16100156, 'Ago-Dic 18', 60, 2222),
(204, 'MPPMT2706BT', 16100156, 'Ago-Dic 18', 96, 1020),
(205, 'MPPHU2906BT', 16100156, 'Ago-Dic 18', 100, 1000),
(206, 'MPF3006MCC', 16100156, 'Ago-Dic 18', 93, 1010),
(207, 'MPF2806MCC', 16100156, 'Ago-Dic 18', 100, 1070),
(208, 'MBCS2405BT', 16100156, 'Feb-Jul 17', 84, 1080),
(209, 'MPF1605DSO', 16100156, 'Feb-Jul 17', 73, 1090),
(210, 'MPF1705DSO', 16100156, 'Feb-Jul 17', 87, 1100),
(211, 'MPF1805DSO', 16100156, 'Feb-Jul 17', 93, 1110),
(212, 'MPF1905DSO', 16100156, 'Feb-Jul 17', 80, 1120),
(213, 'MPF2005DSO', 16100156, 'Feb-Jul 17', 78, 1090),
(214, 'MPF2505MCC', 16100156, 'Feb-Jul 17', 77, 1130),
(215, 'MPPCO2605BT', 16100156, 'Feb-Jul 17', 86, 1010),
(216, 'MPPMT2305BT', 16100156, 'Feb-Jul 17', 99, 1140),
(217, 'MPF2506DSO', 16100288, 'Ago-Dic 18', 98, 1060),
(218, 'MPF2406DSO', 16100288, 'Ago-Dic 18', 100, 1050),
(219, 'MPF2306DSO', 16100288, 'Ago-Dic 18', 94, 1040),
(220, 'MPF2106DSO', 16100288, 'Ago-Dic 18', 95, 1030),
(221, 'MPF2206DSO', 16100288, 'Ago-Dic 18', 65, 2222),
(222, 'MPPMT2706BT', 16100288, 'Ago-Dic 18', 97, 1020),
(223, 'MPPHU2906BT', 16100288, 'Ago-Dic 18', 100, 1000),
(224, 'MPF3006MCC', 16100288, 'Ago-Dic 18', 98, 1010),
(225, 'MPF2806MCC', 16100288, 'Ago-Dic 18', 100, 1070),
(226, 'MBCS2405BT', 16100288, 'Feb-Jul 17', 92, 1080),
(227, 'MPF1605DSO', 16100288, 'Feb-Jul 17', 87, 1090),
(228, 'MPF1705DSO', 16100288, 'Feb-Jul 17', 94, 1100),
(229, 'MPF1805DSO', 16100288, 'Feb-Jul 17', 97, 1110),
(230, 'MPF1905DSO', 16100288, 'Feb-Jul 17', 94, 1120),
(231, 'MPF2005DSO', 16100288, 'Feb-Jul 17', 93, 1090),
(232, 'MPF2505MCC', 16100288, 'Feb-Jul 17', 93, 1130),
(233, 'MPPCO2605BT', 16100288, 'Feb-Jul 17', 89, 1010),
(234, 'MPPMT2305BT', 16100288, 'Feb-Jul 17', 98, 1140),
(235, 'MPF2506DSO', 16100246, 'Ago-Dic 18', 50, 1060),
(236, 'MPF2406DSO', 16100246, 'Ago-Dic 18', 77, 1050),
(237, 'MPF2306DSO', 16100246, 'Ago-Dic 18', 100, 1040),
(238, 'MPF2106DSO', 16100246, 'Ago-Dic 18', 69, 1030),
(239, 'MPF2206DSO', 16100246, 'Ago-Dic 18', 60, 2222),
(240, 'MPPMT2706BT', 16100246, 'Ago-Dic 18', 99, 1020),
(241, 'MPPHU2906BT', 16100246, 'Ago-Dic 18', 90, 1000),
(242, 'MPF3006MCC', 16100246, 'Ago-Dic 18', 92, 1010),
(243, 'MPF2806MCC', 16100246, 'Ago-Dic 18', 97, 1070),
(244, 'MBCS2405BT', 16100246, 'Feb-Jul 17', 89, 1080),
(245, 'MPF1605DSO', 16100246, 'Feb-Jul 17', 70, 1090),
(246, 'MPF1705DSO', 16100246, 'Feb-Jul 17', 84, 1100),
(247, 'MPF1805DSO', 16100246, 'Feb-Jul 17', 80, 1110),
(248, 'MPF1905DSO', 16100246, 'Feb-Jul 17', 88, 1120),
(249, 'MPF2005DSO', 16100246, 'Feb-Jul 17', 79, 1090),
(250, 'MPF2505MCC', 16100246, 'Feb-Jul 17', 72, 1130),
(251, 'MPPCO2605BT', 16100246, 'Feb-Jul 17', 72, 1010),
(252, 'MPPMT2305BT', 16100246, 'Feb-Jul 17', 92, 1140),
(253, 'MPF2506DSO', 16100027, 'Ago-Dic 18', 50, 1060),
(254, 'MPF2406DSO', 16100027, 'Ago-Dic 18', 82, 1050),
(255, 'MPF2306DSO', 16100027, 'Ago-Dic 18', 90, 1040),
(256, 'MPF2106DSO', 16100027, 'Ago-Dic 18', 42, 1030),
(257, 'MPF2206DSO', 16100027, 'Ago-Dic 18', 45, 2222),
(258, 'MPPMT2706BT', 16100027, 'Ago-Dic 18', 83, 1020),
(259, 'MPPHU2906BT', 16100027, 'Ago-Dic 18', 100, 1000),
(260, 'MPF3006MCC', 16100027, 'Ago-Dic 18', 96, 1010),
(261, 'MPF2806MCC', 16100027, 'Ago-Dic 18', 93, 1070),
(262, 'MBCS2405BT', 16100027, 'Feb-Jul 17', 83, 1080),
(263, 'MPF1605DSO', 16100027, 'Feb-Jul 17', 70, 1090),
(264, 'MPF1705DSO', 16100027, 'Feb-Jul 17', 82, 1100),
(265, 'MPF1805DSO', 16100027, 'Feb-Jul 17', 95, 1110),
(266, 'MPF1905DSO', 16100027, 'Feb-Jul 17', 70, 1120),
(267, 'MPF2005DSO', 16100027, 'Feb-Jul 17', 70, 1090),
(268, 'MPF2505MCC', 16100027, 'Feb-Jul 17', 90, 1130),
(269, 'MPPCO2605BT', 16100027, 'Feb-Jul 17', 82, 1010),
(270, 'MPPMT2305BT', 16100027, 'Feb-Jul 17', 77, 1140),
(271, 'MPF2506DSO', 15100363, 'Ago-Dic 18', 70, 1060),
(272, 'MPF2406DSO', 15100363, 'Ago-Dic 18', 81, 1050),
(273, 'MPF2306DSO', 15100363, 'Ago-Dic 18', 80, 1040),
(274, 'MPF2106DSO', 15100363, 'Ago-Dic 18', 35, 1030),
(275, 'MPF2206DSO', 15100363, 'Ago-Dic 18', 55, 2222),
(276, 'MPPMT2706BT', 15100363, 'Ago-Dic 18', 77, 1020),
(277, 'MPPHU2906BT', 15100363, 'Ago-Dic 18', 79, 1000),
(278, 'MPF3006MCC', 15100363, 'Ago-Dic 18', 78, 1010),
(279, 'MPF2806MCC', 15100363, 'Ago-Dic 18', 71, 1070),
(280, 'MBCS2405BT', 15100363, 'Feb-Jul 17', 90, 1080),
(281, 'MPF1605DSO', 15100363, 'Feb-Jul 17', 70, 1090),
(282, 'MPF1705DSO', 15100363, 'Feb-Jul 17', 84, 1100),
(283, 'MPF1805DSO', 15100363, 'Feb-Jul 17', 84, 1110),
(284, 'MPF1905DSO', 15100363, 'Feb-Jul 17', 70, 1120),
(285, 'MPF2005DSO', 15100363, 'Feb-Jul 17', 72, 1090),
(286, 'MPF2505MCC', 15100363, 'Feb-Jul 17', 80, 1130),
(287, 'MPPCO2605BT', 15100363, 'Feb-Jul 17', 80, 1010),
(288, 'MPPMT2305BT', 15100363, 'Feb-Jul 17', 71, 1140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `nombre`) VALUES
(100, 'Desarrollo de Software'),
(300, 'Control Automático e Instrumentación'),
(400, 'Electromecánica'),
(500, 'Mecánica Automotriz'),
(600, 'Máquinas y Herramientas'),
(700, 'Construcción'),
(800, 'Químico en Fármacos'),
(900, 'Tronco Común A'),
(1000, 'Tronco Común B'),
(1100, 'Diseño Electrónico y Sistemas Inteligentes'),
(1200, 'Ing en Desarrollo de Software'),
(1300, 'Industrial'),
(1400, 'Mecatrónica'),
(2000, 'Electronica y Comunicaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL,
  `id_academia` int(11) DEFAULT NULL,
  `apellido_materno` varchar(20) DEFAULT NULL,
  `apellido_paterno` varchar(10) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id_docente`, `id_academia`, `apellido_materno`, `apellido_paterno`, `nombre`, `password`) VALUES
(1000, 12, 'Landell', 'Ramirez', 'Juan Daniel', 'ËÛ Ä[É~Ya\'ÝëÏšÊ'),
(1010, 6, 'Martinez', 'Ramos', 'Jose Victor', '±Í5úüÕ’QXè{¿Ù¥'),
(1020, 7, 'Perez', 'Bentancour', 'Teresita', ' nFü{t¡Ç9Õ\n.È'),
(1030, 5, 'Gonzalez', 'Lozano', 'Antonio', '§ž¿…”ý$­\ZEè`läz'),
(1040, 1, 'Campa', 'Pamplona ', 'Jorge ', 'ÜÎÔÒùï!³-%q/B’-¤'),
(1050, 2, 'Coronel', 'Lupercio', 'Ramiro', '½°Nåõte7VÄ7› Dar'),
(1060, 4, 'Flores ', 'Figueroa ', 'Diana Marisol ', 'iJªGp²HBÄŠ·<¹'),
(1070, 12, 'Guzman', 'Loredo', 'Maricela Alicia', 'Ž5TQEjo%mGÕà4$'),
(1080, 12, 'Cortes', 'Rivera', 'Misael', '	7ó†T/Éæz*ÕŸ´'),
(1090, 4, 'Garcia', 'Ramirez', 'Carlos Alberto', ';Æ kf7\\ç›¶4qªù'),
(1100, 1, 'Hernandez', 'Duran', 'Luis Rene', 'B’ì@WötÓÅòQ\0é'),
(1110, 3, 'Cardenas', 'Vazquez', 'Rodolfo Ulyses', '-YŽE_˜úT½ùÚÒÉÿ~'),
(1120, 2, 'Hernandez', 'Ferrer', 'Susana Elizabeth', 'È63Ôy›TkiA­þ¢’ð'),
(1130, 12, 'Rosales', 'Pardo', 'Claudia Bethzabel', 'I«1OY)Ñ3òû‰Vð'),
(1140, 7, 'Colmenares', 'Duran', 'Azucena Hermelinda', 'áMLÖoSÜ||œH’Ýø'),
(2222, 1, 'Rodriguez', 'Isaac', 'Karla Areli', '‡üÛ\Z	—•L+ÈR}(lîH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `clave_municipio` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`clave_municipio`, `nombre`) VALUES
(1, 'Acatic'),
(2, 'Acatlán de Juárez'),
(3, 'Ahualulco de Mercado'),
(4, 'Amacueca'),
(5, 'Amatitán'),
(6, 'Ameca'),
(7, 'Arandas'),
(8, 'Atemajac de Brizuela'),
(9, 'Atengo'),
(10, 'Atenguillo'),
(11, 'Atotonilco el Alto'),
(12, 'Atoyac'),
(13, 'Autlán de Navarro'),
(14, 'Ayotlán'),
(15, 'Ayutla'),
(16, 'Bolaños'),
(17, 'Cabo Corrientes'),
(18, 'Cañadas de Obregón'),
(19, 'Casimiro Castillo'),
(20, 'Chapala'),
(21, 'Chimaltitán'),
(22, 'Chiquilistlán'),
(23, 'Cihuatlán'),
(24, 'Cocula'),
(25, 'Colotlán'),
(26, 'Concepción de Buenos Aires'),
(27, 'Cuautitlán de García Barragán'),
(28, 'Cuautla'),
(29, 'Cuquío'),
(30, 'Degollado'),
(31, 'Ejutla'),
(32, 'El Arenal'),
(33, 'El Grullo'),
(34, 'El Limón'),
(35, 'El Salto'),
(36, 'Encarnación de Díaz'),
(37, 'Etzatlán'),
(38, 'Gómez Farías'),
(39, 'Guachinango'),
(40, 'Guadalajara'),
(41, 'Hostotipaquillo'),
(42, 'Huejúcar'),
(43, 'Huejuquilla el Alto'),
(44, 'Ixtlahuacán de los Membrillos'),
(45, 'Ixtlahuacán del Río'),
(46, 'Jalostotitlán'),
(47, 'Jamay'),
(48, 'Jesús María'),
(49, 'Jilotlán de los Dolores'),
(50, 'Jocotepec'),
(51, 'Juanacatlán'),
(52, 'Juchitlán'),
(53, 'La Barca'),
(54, 'La Huerta'),
(55, 'La Manzanilla de la Paz'),
(56, 'Lagos de Moreno'),
(57, 'Magdalena'),
(58, 'Mascota'),
(59, 'Mazamitla'),
(60, 'Mexticacán'),
(61, 'Mezquitic'),
(62, 'Mixtlán'),
(63, 'Ocotlán'),
(64, 'Ojuelos de Jalisco'),
(65, 'Pihuamo'),
(66, 'Poncitlán'),
(67, 'Puerto Vallarta'),
(68, 'Quitupan'),
(69, 'San Cristóbal de la Barranca'),
(70, 'San Diego de Alejandría'),
(71, 'San Gabriel'),
(72, 'San Ignacio Cerro Gordo'),
(73, 'San Juan de los Lagos'),
(74, 'San Juanito de Escobedo'),
(75, 'San Julián'),
(76, 'San Marcos'),
(77, 'San Martín de Bolaños'),
(78, 'San Martín Hidalgo'),
(79, 'San Miguel el Alto'),
(80, 'San Pedro Tlaquepaque'),
(81, 'San Sebastián del Oeste'),
(82, 'Santa María de los Ángeles'),
(83, 'Santa María del Oro'),
(84, 'Sayula'),
(85, 'Tala'),
(86, 'Talpa de Allende'),
(87, 'Tamazula de Gordiano'),
(88, 'Tapalpa'),
(89, 'Tecalitlán'),
(90, 'Techaluta de Montenegro'),
(91, 'Tecolotlán'),
(92, 'Tenamaxtlán'),
(93, 'Teocaltiche'),
(94, 'Teocuitatlán de Corona'),
(95, 'Tepatitlán de Morelos'),
(96, 'Tequila'),
(97, 'Teuchitlán'),
(98, 'Tizapán el Alto'),
(99, 'Tlajomulco de Zúñiga'),
(100, 'Tolimán'),
(101, 'Tomatlán'),
(102, 'Tonalá'),
(103, 'Tonaya'),
(104, 'Tonila'),
(105, 'Totatiche'),
(106, 'Tototlán'),
(107, 'Tuxcacuesco'),
(108, 'Tuxcueca'),
(109, 'Tuxpan'),
(110, 'Unión de San Antonio'),
(111, 'Unión de Tula'),
(112, 'Valle de Guadalupe'),
(113, 'Valle de Juárez'),
(114, 'Villa Corona'),
(115, 'Villa Guerrero'),
(116, 'Villa Hidalgo'),
(117, 'Villa Purificación'),
(118, 'Yahualica de González Gallo'),
(119, 'Zacoalco de Torres'),
(120, 'Zapopan'),
(121, 'Zapotiltic'),
(122, 'Zapotitlán de Vadillo'),
(123, 'Zapotlán del Rey'),
(124, 'Zapotlán el Grande'),
(125, 'Zapotlanejo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r`
--

CREATE TABLE `r` (
  `registro` int(11) NOT NULL,
  `id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `r`
--

INSERT INTO `r` (`registro`, `id`) VALUES
(12345, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `password` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nickname`, `password`, `type`) VALUES
(1, 'Root', 'PïÄ??!Rœ', 'Admin'),
(2, '15100026', 'zIÆî¹mù‰', 'Alumno'),
(3, '15100318', '²¤UÂ/P/N¥‹', 'Alumno'),
(4, '15100363', '²¤UÂ/P/N¥‹', 'Alumno'),
(5, '15300203', 'åü´®DLŠé', 'Alumno'),
(6, '16100027', '–%Ø“mBËD˜', 'Alumno'),
(7, '16100030', '1ó–áó;•*Ó', 'Alumno'),
(8, '16100066', '²ôd­Fƒ³é', 'Alumno'),
(9, '16100117', '@V×^ ÒFú', 'Alumno'),
(10, '16100156', 'o…³\\Åíœ.Î', 'Alumno'),
(11, '16100167', 'ˆ[ë¹]öž-', 'Alumno'),
(12, '16100181', 'ã>—®¬gŽË×\'', 'Alumno'),
(13, '16100239', '<|lqQYv*#', 'Alumno'),
(14, '16100246', 'Íj™\0ìô.>', 'Alumno'),
(15, '16100261', 'Òïv\Zeîªj¯', 'Alumno'),
(16, '16100288', 'Ç’NfÌ©Ÿ	ë', 'Alumno'),
(17, '16100290', '†‹@8ÏnÁµ', 'Alumno'),
(18, '16100605', 'ÛK\r6Îms(Vg', 'Alumno'),
(19, '1000', 'ËÛ Ä[É~Ya', 'Docente'),
(20, '1010', '±Í5úüÕ’Q', 'Docente'),
(21, '1020', ' nFü{t¡Ç', 'Docente'),
(22, '1030', '§ž¿…”ý$­\Z', 'Docente'),
(23, '1040', 'ÜÎÔÒùï!³-%', 'Docente'),
(24, '1050', '½°Nåõte7VÄ', 'Docente'),
(25, '1060', 'iJªGp²HBÄ', 'Docente'),
(26, '1070', 'Ž5TQEjo%m', 'Docente'),
(27, '1080', '	7ó†T/Éæ', 'Docente'),
(28, '1090', ';Æ kf7\\ç', 'Docente'),
(29, '1100', 'B’ì@WötÓÅ', 'Docente'),
(30, '1110', '-YŽE_˜úT½ù', 'Docente'),
(31, '1120', 'È63Ôy›Tki', 'Docente'),
(32, '1130', 'I«1OY)Ñ3', 'Docente'),
(33, '1140', 'áMLÖoSÜ|', 'Docente'),
(34, '2222', '‡üÛ\Z	—•L+È', 'Docente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academia`
--
ALTER TABLE `academia`
  ADD PRIMARY KEY (`id_academia`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`REGISTRO`),
  ADD KEY `CLAVE_MUNICIPIO` (`CLAVE_MUNICIPIO`),
  ADD KEY `ID_CARRERA` (`ID_CARRERA`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`Id_Asignatura`),
  ADD KEY `id_academia` (`id_academia`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`clave_cursa`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `registro` (`registro`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `id_academia` (`id_academia`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`clave_municipio`);

--
-- Indices de la tabla `r`
--
ALTER TABLE `r`
  ADD PRIMARY KEY (`registro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `clave_cursa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `academia`
--
ALTER TABLE `academia`
  ADD CONSTRAINT `academia_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`CLAVE_MUNICIPIO`) REFERENCES `municipio` (`clave_municipio`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`ID_CARRERA`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_academia`) REFERENCES `academia` (`id_academia`);

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`Id_Asignatura`),
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`registro`) REFERENCES `alumno` (`REGISTRO`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`id_academia`) REFERENCES `academia` (`id_academia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
