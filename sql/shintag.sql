-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июн 11 2013 г., 19:23
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `shintag`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auto_type`
--

CREATE TABLE IF NOT EXISTS `auto_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `auto_type`
--

INSERT INTO `auto_type` (`id`, `name`) VALUES
(3, '4х4'),
(2, 'Грузовой'),
(6, 'Квадроцикл'),
(1, 'Легковой'),
(4, 'Микроавтобус'),
(5, 'Мотоцикл'),
(7, 'Спец-техника');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `ad_id`) VALUES
(58, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `main_ads`
--

CREATE TABLE IF NOT EXISTS `main_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `date` date DEFAULT NULL,
  `time` int(11) NOT NULL,
  `contacts` text,
  `mail` varchar(100) DEFAULT NULL,
  `reffer` int(11) NOT NULL,
  `ad_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reffer` (`reffer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `main_ads`
--

INSERT INTO `main_ads` (`id`, `name`, `text`, `date`, `time`, `contacts`, `mail`, `reffer`, `ad_type`, `user_id`) VALUES
(15, 'FUCK THERE', 'f dsfs dfsdf sdf sdf sdf dsff dsfs dfsdf sdf sdf sdf dsff dsfs dfsdf sdf sdf sdf dsff dsfs dfsdf sdf sdf sdf dsf', '2013-06-10', 1, '79147016320\r\n+478596587', 'abramin@mail.ru', 58, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `product_state`
--

CREATE TABLE IF NOT EXISTS `product_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `product_state`
--

INSERT INTO `product_state` (`id`, `name`) VALUES
(2, 'Б/У'),
(1, 'Новое');

-- --------------------------------------------------------

--
-- Структура таблицы `tyres_ads`
--

CREATE TABLE IF NOT EXISTS `tyres_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `radius` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `brand` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `count` int(4) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Дамп данных таблицы `tyres_ads`
--

INSERT INTO `tyres_ads` (`id`, `width`, `height`, `radius`, `season`, `year`, `brand`, `state`, `count`, `price`) VALUES
(58, 2, 2, 5, 2, 12, 1, 1, 43, 35453);

-- --------------------------------------------------------

--
-- Структура таблицы `tyres_brand`
--

CREATE TABLE IF NOT EXISTS `tyres_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `tyres_brand`
--

INSERT INTO `tyres_brand` (`id`, `name`) VALUES
(1, 'fafafafafaf');

-- --------------------------------------------------------

--
-- Структура таблицы `tyres_height`
--

CREATE TABLE IF NOT EXISTS `tyres_height` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `tyres_height`
--

INSERT INTO `tyres_height` (`id`, `name`) VALUES
(2, '10.5'),
(18, '100'),
(3, '11.5'),
(4, '12.5'),
(5, '25'),
(6, '30'),
(7, '35'),
(8, '40'),
(9, '45'),
(10, '50'),
(11, '55'),
(12, '60'),
(13, '65'),
(14, '70'),
(15, '75'),
(16, '80'),
(17, '85'),
(1, '9.5');

-- --------------------------------------------------------

--
-- Структура таблицы `tyres_radius`
--

CREATE TABLE IF NOT EXISTS `tyres_radius` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `tyres_radius`
--

INSERT INTO `tyres_radius` (`id`, `name`) VALUES
(5, '12'),
(6, '13'),
(7, '14'),
(8, '15'),
(9, '15C'),
(10, '16'),
(11, '16С'),
(12, '17'),
(13, '18'),
(14, '19'),
(15, '20'),
(16, '21'),
(17, '22'),
(18, '23'),
(19, '24');

-- --------------------------------------------------------

--
-- Структура таблицы `tyres_season`
--

CREATE TABLE IF NOT EXISTS `tyres_season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `tyres_season`
--

INSERT INTO `tyres_season` (`id`, `name`) VALUES
(4, 'Всесезонные'),
(2, 'Зима'),
(3, 'Зима-Ш'),
(1, 'Лето');

-- --------------------------------------------------------

--
-- Структура таблицы `tyres_width`
--

CREATE TABLE IF NOT EXISTS `tyres_width` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `tyres_width`
--

INSERT INTO `tyres_width` (`id`, `name`) VALUES
(6, '135'),
(7, '145'),
(8, '155'),
(9, '165'),
(10, '175'),
(11, '185'),
(12, '195'),
(13, '205'),
(14, '215'),
(15, '225'),
(16, '235'),
(17, '245'),
(18, '255'),
(19, '265'),
(20, '275'),
(21, '285'),
(22, '295'),
(1, '30'),
(23, '305'),
(2, '31'),
(24, '315'),
(3, '32'),
(25, '325'),
(4, '33'),
(26, '335'),
(5, '35');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(70) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` char(40) NOT NULL,
  `verification` tinyint(1) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_id` int(11) DEFAULT '0',
  `region_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `skype` varchar(30) DEFAULT NULL,
  `other_info` varchar(70) DEFAULT NULL,
  `adress` varchar(70) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `login`, `password`, `verification`, `salt`, `register_date`, `country_id`, `region_id`, `city_id`, `phone`, `skype`, `other_info`, `adress`, `about`) VALUES
(2, 'abramin@mail.ru', 'smite1', '289e9407958d312eafe924609b0eb3ec', 1, '9ACM85W', '2013-06-06 16:55:07', 0, 0, 0, '534636546', 'fdfhgh', 'dfgdfgf', '4545tr', 'gdfgdfgdg');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_brand`
--

CREATE TABLE IF NOT EXISTS `wheels_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `wheels_brand`
--

INSERT INTO `wheels_brand` (`id`, `name`) VALUES
(1, 'some_brand');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_color`
--

CREATE TABLE IF NOT EXISTS `wheels_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `wheels_color`
--

INSERT INTO `wheels_color` (`id`, `name`) VALUES
(2, 'Белый'),
(4, 'Другой'),
(1, 'Металик'),
(3, 'Черный');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_et`
--

CREATE TABLE IF NOT EXISTS `wheels_et` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Дамп данных таблицы `wheels_et`
--

INSERT INTO `wheels_et` (`id`, `name`) VALUES
(48, '-1'),
(39, '-10'),
(38, '-11'),
(37, '-12'),
(36, '-13'),
(35, '-14'),
(34, '-15'),
(33, '-16'),
(32, '-17'),
(31, '-18'),
(30, '-19'),
(47, '-2'),
(29, '-20'),
(28, '-21'),
(27, '-22'),
(26, '-23'),
(25, '-24'),
(24, '-25'),
(23, '-26'),
(22, '-27'),
(21, '-28'),
(20, '-29'),
(46, '-3'),
(19, '-30'),
(18, '-31'),
(17, '-32'),
(16, '-33'),
(15, '-34'),
(14, '-35'),
(13, '-36'),
(12, '-37'),
(11, '-38'),
(10, '-39'),
(45, '-4'),
(9, '-40'),
(8, '-41'),
(7, '-42'),
(6, '-43'),
(5, '-44'),
(4, '-45'),
(3, '-46'),
(2, '-47'),
(1, '-48'),
(44, '-5'),
(43, '-6'),
(42, '-7'),
(41, '-8'),
(40, '-9'),
(49, '0'),
(50, '1'),
(59, '10'),
(60, '11'),
(61, '12'),
(62, '13'),
(63, '14'),
(64, '15'),
(65, '16'),
(66, '17'),
(67, '18'),
(68, '19'),
(51, '2'),
(69, '20'),
(70, '21'),
(71, '22'),
(72, '23'),
(73, '24'),
(74, '25'),
(75, '26'),
(76, '27'),
(77, '28'),
(78, '29'),
(52, '3'),
(79, '30'),
(80, '31'),
(81, '32'),
(82, '33'),
(83, '34'),
(84, '35'),
(85, '36'),
(86, '37'),
(87, '38'),
(88, '39'),
(53, '4'),
(89, '40'),
(90, '41'),
(91, '42'),
(92, '43'),
(93, '44'),
(94, '45'),
(95, '46'),
(96, '47'),
(97, '48'),
(98, '49'),
(54, '5'),
(99, '50'),
(100, '51'),
(101, '52'),
(102, '52.5'),
(103, '53'),
(104, '54'),
(105, '55'),
(106, '56'),
(107, '57'),
(108, '58'),
(109, '59'),
(55, '6'),
(110, '60'),
(56, '7'),
(57, '8'),
(58, '9');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_pcd`
--

CREATE TABLE IF NOT EXISTS `wheels_pcd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `wheels_pcd`
--

INSERT INTO `wheels_pcd` (`id`, `name`) VALUES
(2, '4x100'),
(3, '4x108'),
(4, '4x114.3'),
(1, '4x98'),
(6, '5x100'),
(7, '5x105'),
(8, '5x108'),
(9, '5x110'),
(10, '5x112'),
(11, '5x114.3'),
(12, '5x115'),
(13, '5x118'),
(14, '5x120'),
(15, '5x120.65'),
(16, '5x127'),
(17, '5x130'),
(18, '5x135'),
(19, '5x139.7'),
(20, '5x150'),
(21, '5x160'),
(22, '5x165.1'),
(5, '5x98'),
(23, '6x114.3'),
(24, '6x127'),
(25, '6x135'),
(26, '6x139.7'),
(27, '6x170'),
(28, '6x180'),
(29, '6x205'),
(30, '8x165.1'),
(31, '8x169'),
(32, 'HolesxPCD');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_radius`
--

CREATE TABLE IF NOT EXISTS `wheels_radius` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `wheels_radius`
--

INSERT INTO `wheels_radius` (`id`, `name`) VALUES
(1, '12'),
(2, '13'),
(3, '14'),
(4, '15'),
(5, '16'),
(6, '17'),
(7, '18'),
(8, '19'),
(9, '20'),
(10, '21'),
(11, '22'),
(12, '23'),
(13, '24');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_type`
--

CREATE TABLE IF NOT EXISTS `wheels_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `wheels_type`
--

INSERT INTO `wheels_type` (`id`, `name`) VALUES
(3, 'Кованый'),
(1, 'Литой'),
(4, 'Оригинальный'),
(2, 'Штампованный');

-- --------------------------------------------------------

--
-- Структура таблицы `wheels_width`
--

CREATE TABLE IF NOT EXISTS `wheels_width` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `wheels_width`
--

INSERT INTO `wheels_width` (`id`, `name`) VALUES
(10, '10'),
(11, '10.5'),
(12, '11'),
(13, '11.5'),
(14, '12'),
(1, '5.5'),
(2, '6'),
(3, '6.5'),
(4, '7'),
(5, '7.5'),
(6, '8'),
(7, '8.5'),
(8, '9'),
(9, '9.5');

-- --------------------------------------------------------

--
-- Структура таблицы `years`
--

CREATE TABLE IF NOT EXISTS `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `years`
--

INSERT INTO `years` (`id`, `name`) VALUES
(1, 2000),
(2, 2001),
(3, 2002),
(4, 2003),
(5, 2004),
(6, 2005),
(7, 2006),
(8, 2007),
(9, 2008),
(10, 2009),
(11, 2010),
(12, 2011),
(13, 2012),
(14, 2013);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
