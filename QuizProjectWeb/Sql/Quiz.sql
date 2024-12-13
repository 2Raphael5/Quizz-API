-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 13 déc. 2024 à 15:44
-- Version du serveur : 10.6.18-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Quiz`
--
CREATE DATABASE IF NOT EXISTS `Quiz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Quiz`;

-- --------------------------------------------------------

--
-- Structure de la table `Information`
--

CREATE TABLE `Information` (
  `id` int(11) NOT NULL,
  `anecdote` text DEFAULT NULL,
  `wiki` text DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `langue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Information`
--

INSERT INTO `Information` (`id`, `anecdote`, `wiki`, `question_id`, `langue_id`) VALUES
(1, 'Cette ville de l\'État de Washington abrite le siège social de l\'éditeur de logiciels Microsoft et de la branche américaine de Nintendo', 'https://fr.wikipedia.org/wiki/Redmond_(Washington)', 1, 1),
(2, 'This Washington state town is home to the headquarters of the Microsoft software publisher and the American branch of Nintendo.', 'https://en.wikipedia.org/wiki/Redmond,_Washington', 2, 2),
(3, 'In dieser Stadt im US-Bundesstaat Washington befinden sich der Hauptsitz des Microsoft-Softwareherstellers und die amerikanische Niederlassung von Nintendo.', 'https://de.wikipedia.org/wiki/Redmond_(Washington)', 3, 3),
(4, 'Esta ciudad del estado de Washington alberga la sede del editor de software de Microsoft y la sucursal estadounidense de Nintendo.', 'https://es.wikipedia.org/wiki/Redmond_(Washington)', 4, 4),
(5, 'Questa città dello stato di Washington ospita la sede del produttore di software Microsoft e la filiale americana di Nintendo.', 'https://it.wikipedia.org/wiki/Redmond_(Washington)', 5, 5),
(6, 'Deze staat in de staat Washington is de thuisbasis van het hoofdkantoor van de Microsoft software-uitgever en de Amerikaanse tak van Nintendo.', 'https://nl.wikipedia.org/wiki/Redmond_(Washington)', 6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Language`
--

CREATE TABLE `Language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Language`
--

INSERT INTO `Language` (`id`, `name`) VALUES
(1, 'FR'),
(2, 'EN'),
(3, 'DE'),
(4, 'ES'),
(5, 'IT'),
(6, 'NL');

-- --------------------------------------------------------

--
-- Structure de la table `Proposition`
--

CREATE TABLE `Proposition` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `question_id` int(11) NOT NULL,
  `langue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Proposition`
--

INSERT INTO `Proposition` (`id`, `name`, `question_id`, `langue_id`) VALUES
(1, 'Redmond', 1, 1),
(2, 'New-York', 1, 1),
(3, 'Paris', 1, 1),
(4, 'Londres', 1, 1),
(5, 'Redmond', 2, 2),
(6, 'New York', 2, 2),
(7, 'Paris', 2, 2),
(8, 'London', 2, 2),
(9, 'Redmond', 3, 3),
(10, 'New York', 3, 3),
(11, 'Paris', 3, 3),
(12, 'London', 3, 3),
(13, 'Redmond', 4, 4),
(14, 'Nueva york', 4, 4),
(15, 'Paris', 4, 4),
(16, 'Londres', 4, 4),
(17, 'Redmond', 5, 5),
(18, 'New York', 5, 5),
(19, 'Parigi', 5, 5),
(20, 'Londra', 5, 5),
(21, 'Redmond', 6, 6),
(22, 'New York', 6, 6),
(23, 'Parijs', 6, 6),
(24, 'Londen', 6, 6),
(25, 'Xbox', 7, 1),
(26, 'X Window', 7, 1),
(27, 'Xerxès', 7, 1),
(28, 'Xfinity', 7, 1),
(29, 'Xbox', 8, 2),
(30, 'Wii', 8, 2),
(31, 'PlayStation', 8, 2),
(32, 'Game Gear', 8, 2),
(33, 'Xbox', 9, 3),
(34, 'Wii', 9, 3),
(35, 'PlayStation', 9, 3),
(36, 'Game Gear', 9, 3),
(37, 'Xbox', 10, 4),
(38, 'Wii', 10, 4),
(39, 'PlayStation', 10, 4),
(40, 'Game Gear', 10, 4),
(41, 'Xbox', 11, 5),
(42, 'Wii', 11, 5),
(43, 'PlayStation', 11, 5),
(44, 'Game Gear', 11, 5),
(45, 'Xbox', 12, 6),
(46, 'Wii', 12, 6),
(47, 'PlayStation', 12, 6),
(48, 'Game Gear', 12, 6),
(49, 'Paul Allen', 13, 1),
(50, 'Larry Ellison', 13, 1),
(51, 'Elon Musk', 13, 1),
(51, 'Alex Spanos', 13, 1),
(53, 'Paul Allen', 14, 2),
(54, 'Larry Ellison', 14, 2),
(55, 'Elon Musk', 14, 2),
(56, 'Alex Spanos', 14, 2),
(57, 'Paul Allen', 15, 3),
(58, 'Larry Ellison', 15, 3),
(59, 'Elon Musk', 15, 3),
(60, 'Alex Spanos', 15, 3),
(61, 'Paul Allen', 16, 4),
(62, 'Larry Ellison', 16, 4),
(63, 'Elon Musk', 16, 4),
(64, 'Alex Spanos', 16, 4),
(65, 'Paul Allen', 17, 5),
(66, 'Larry Ellison', 17, 5),
(67, 'Elon Musk', 17, 5),
(68, 'Alex Spanos', 17, 5),
(69, 'Paul Allen', 18, 6),
(70, 'Larry Ellison', 18, 6),
(71, 'Elon Musk', 18, 6),
(72, 'Alex Spanos', 18, 6),
(73, 'Flight Simulator', 19, 1),
(74, 'Fight Simulator', 19, 1),
(75, 'Freight Simulator', 19, 1),
(76, 'Fog Simulator', 19, 1),
(77, 'Flight Simulator', 20, 2),
(78, 'Fight Simulator', 20, 2),
(79, 'Freight Simulator', 20, 2),
(80, 'Fog Simulator', 20, 2),
(81, 'Flight Simulator', 21, 3),
(82, 'Fight Simulator', 21, 3),
(83, 'Freight Simulator', 21, 3),
(84, 'Fog Simulator', 21, 3),
(85, 'Flight Simulator', 22, 4),
(86, 'Fight Simulator', 22, 4),
(87, 'Freight Simulator', 22, 4),
(88, 'Fog Simulator', 22, 4),
(89, 'Flight Simulator', 23, 5),
(90, 'Fight Simulator', 23, 5),
(91, 'Freight Simulator', 23, 5),
(92, 'Fog Simulator', 23, 5),
(93, 'Flight Simulator', 24, 6),
(94, 'Fight Simulator', 24, 6),
(95, 'Freight Simulator', 24, 6),
(96, 'Fog Simulator', 24, 6),
(97, 'Lumia', 25, 1),
(98, 'Loumnia', 25, 1),
(99, 'Lomna', 25, 1),
(100, 'Loubna', 25, 1),
(101, 'Lumia', 26, 2),
(102, 'Loumnia', 26, 2),
(103, 'Lomna', 26, 2),
(104, 'Loubna', 26, 2),
(105, 'Lumia', 27, 3),
(106, 'Loumnia', 27, 3),
(107, 'Lomna', 27, 3),
(108, 'Loubna', 27, 3),
(109, 'Lumia', 28, 4),
(110, 'Loumnia', 28, 4),
(111, 'Lomna', 28, 4),
(112, 'Loubna', 28, 4),
(113, 'Lumia', 29, 5),
(114, 'Loumnia', 29, 5),
(115, 'Lomna', 29, 5),
(116, 'Loubna', 29, 5),
(117, 'Lumia', 30, 6),
(118, 'Loumnia', 30, 6),
(119, 'Lomna', 30, 6),
(120, 'Loubna', 30, 6),
(121, 'Windows ME', 31, 1),
(122, 'Windows TE', 31, 1),
(123, 'Windows RE', 31, 1),
(124, 'Windows VE', 31, 1),
(125, 'Windows ME', 32, 2),
(126, 'Windows TE', 32, 2),
(127, 'Windows RE', 32, 2),
(128, 'Windows VE', 32, 2),
(129, 'Windows ME', 33, 3),
(130, 'Windows TE', 33, 3),
(131, 'Windows RE', 33, 3),
(132, 'Windows VE', 33, 3),
(133, 'Windows ME', 34, 4),
(134, 'Windows TE', 34, 4),
(135, 'Windows RE', 34, 4),
(136, 'Windows VE', 34, 4),
(137, 'Windows ME', 35, 5),
(138, 'Windows TE', 35, 5),
(139, 'Windows RE', 35, 5),
(140, 'Windows VE', 35, 5),
(141, 'Windows ME', 36, 6),
(143, 'Windows TE', 36, 6),
(144, 'Windows RE', 36, 6),
(145, 'Windows VE', 36, 6),
(146, 'OneDrive', 37, 1),
(147, 'Operator', 37, 1),
(148, 'Omega', 37, 1),
(149, 'Oracle', 37, 1),
(150, 'OneDrive', 38, 2),
(151, 'TwoDrive', 38, 2),
(152, 'ThreeDrive', 38, 2),
(153, 'FourDrive', 38, 2),
(154, 'OneDrive', 39, 3),
(155, 'TwoDrive', 39, 3),
(156, 'ThreeDrive', 39, 3),
(157, 'FourDrive', 39, 3),
(158, 'OneDrive', 40, 4),
(159, 'TwoDrive', 40, 4),
(160, 'ThreeDrive', 40, 4),
(161, 'FourDrive', 40, 4),
(162, 'OneDrive', 41, 5),
(163, 'TwoDrive', 41, 5),
(164, 'ThreeDrive', 41, 5),
(165, 'FourDrive', 41, 5),
(165, 'OneDrive', 42, 6),
(166, 'TwoDrive', 42, 6),
(167, 'ThreeDri', 42, 6),
(168, 'FourDriv', 42, 6),
(169, 'Surface', 43, 1),
(170, 'Hurricane', 43, 1),
(171, 'Storm', 43, 1),
(172, 'Tabsoft', 43, 1),
(173, 'Surface', 44, 2),
(174, 'Hurricane', 44, 2),
(175, 'Storm', 44, 2),
(176, 'Tabsoft', 44, 2),
(177, 'Oberfläche', 45, 3),
(178, 'Hurrikan', 45, 3),
(179, 'Sturm', 45, 3),
(180, 'Tabsoft', 45, 3),
(181, 'Superficie', 46, 4),
(182, 'Huracán', 46, 4),
(183, 'Tormenta', 46, 4),
(184, 'Tabsoft', 46, 4),
(185, 'Superficie', 47, 5),
(186, 'Uragano', 47, 5),
(187, 'Tempesta', 47, 5),
(188, 'Tabsoft', 47, 5),
(189, 'Oppervlakte', 48, 6),
(190, 'Orkaan', 48, 6),
(191, 'Storm', 48, 6),
(192, 'Tabsoft', 48, 6),
(193, '1975', 49, 1),
(194, '1985', 49, 1),
(195, '1995', 49, 1),
(196, '2005', 49, 1),
(197, '1975', 50, 2),
(198, '1985', 50, 2),
(199, '1995', 50, 2),
(200, '2005', 50, 2),
(201, '1975', 51, 3),
(202, '1985', 51, 3),
(203, '1995', 51, 3),
(204, '2005', 51, 3),
(205, '1975', 52, 4),
(206, '1985', 52, 4),
(207, '1995', 52, 4),
(208, '2005', 52, 4),
(209, '1975', 53, 5),
(210, '1985', 53, 5),
(211, '1995', 53, 5),
(212, '2005', 53, 5),
(213, '1975', 54, 6),
(214, '1985', 54, 6),
(215, '1995', 54, 6),
(216, '2005', 54, 6),
(217, 'Operating', 55, 1),
(218, 'Operator', 55, 1),
(219, 'Opera', 55, 1),
(220, 'Opale', 55, 1),
(221, 'Operating', 56, 2),
(222, 'Operator', 56, 2),
(223, 'Opera', 56, 2),
(224, 'Opal', 56, 2),
(225, 'Betrieb', 57, 3),
(226, 'Betreiber', 57, 3),
(227, 'Opera', 57, 3),
(228, 'Opal', 57, 3),
(229, 'Operando', 58, 4),
(230, 'Operador', 58, 4),
(231, 'Ópera', 58, 4),
(232, 'Ópalo', 58, 4),
(233, 'Operativo', 59, 5),
(234, 'Operatore', 59, 5),
(235, 'Opera', 59, 5),
(236, 'Opale', 59, 5),
(237, 'Bediening', 60, 6),
(238, 'Operator', 60, 6),
(239, 'Opera', 60, 6),
(240, 'Opaal', 60, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Question`
--

CREATE TABLE `Question` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `reponse_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `langue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Question`
--

INSERT INTO `Question` (`id`, `name`, `reponse_id`, `quiz_id`, `langue_id`) VALUES
(1, 'Dans quelle ville se situait en 2018 le siège social de Microsoft ?', 4, 1, 1),
(2, 'In which city was in 2018 the headquarters of Microsoft ?', 8, 2, 2),
(3, 'In welcher Stadt befand sich 2018 der Hauptsitz von Microsoft ?', 12, 3, 3),
(4, '¿En qué ciudad se encontraba, en 2018, la sede de Microsoft ?', 16, 4, 4),
(5, 'In quale città era nel 2018 la sede di Microsoft ?', 20, 5, 5),
(6, 'In welke stad was in 2018 het hoofdkantoor van Microsoft ?', 24, 6, 6),
(7, 'Quel nom porte la console de jeux vidéo conçue par Microsoft ?', 25, 7, 1),
(8, 'What name is the video game console designed by Microsoft ?', 29, 8, 2),
(9, 'Wie heisst die von Microsoft entwickelte Videospielkonsole ?', 33, 9, 3),
(10, '¿Cuál es el nombre de la consola de videojuegos diseñada por Microsoft ?', 37, 10, 4),
(11, 'Quale nome è la console per videogiochi progettata da Microsoft ?', 41, 11, 5),
(12, 'Welke naam is de videogameconsole ontworpen door Microsoft ?', 45, 12, 6),
(13, 'Qui est, avec Bill Gates, le cofondateur de la société Microsoft ?', 49, 13, 1),
(14, 'Who, with Bill Gates, is the co-founder of Microsoft ?', 53, 14, 2),
(15, 'Wer ist mit Bill Gates der Mitbegründer von Microsoft ?', 57, 15, 3),
(16, '¿Quién, con Bill Gates, es el co-fundador de Microsoft ?', 61, 16, 4),
(17, 'Chi, con Bill Gates, è il co-fondatore di Microsoft ?', 65, 17, 5),
(18, 'Wie, met Bill Gates, is de mede-oprichter van Microsoft ?', 69, 18, 6),
(19, 'Quel célèbre simulateur de vol pour PC a été conçu par Microsoft ?', 73, 19, 1),
(20, 'Which famous flight simulator for PC has been designed by Microsoft ?', 77, 20, 2),
(21, 'Welcher berühmte Flugsimulator für PC wurde von Microsoft entwickelt ?', 81, 21, 3),
(22, '¿Qué famoso simulador de vuelo para PC ha sido diseñado por Microsoft ?', 85, 22, 4),
(23, 'Quale famoso simulatore di volo per PC è stato progettato da Microsoft ?', 89, 23, 5),
(24, 'Welke beroemde vluchtsimulator voor pc is ontworpen door Microsoft ?', 93, 24, 6),
(25, 'Quel nom a été choisi par Microsoft pour la commercialisation de son smartphone ?', 97, 25, 1),
(26, 'Which name was chosen by Microsoft for the marketing of its smartphone ?', 101, 26, 2),
(27, 'Welchen Namen hat Microsoft für die Vermarktung seines Smartphones gewählt ?', 105, 27, 3),
(28, '¿Qué nombre eligió Microsoft para la comercialización de su teléfono inteligente ?', 109, 28, 4),
(29, 'Quale nome è stato scelto da Microsoft per la commercializzazione del suo smartphone ?', 113, 29, 5),
(30, 'Welke naam werd door Microsoft gekozen voor de marketing van zijn smartphone ?', 117, 30, 6),
(31, 'Quel système d\'exploitation fut commercialisé entre Windows 98 et Windows XP ?', 121, 31, 1),
(32, 'Which operating system was marketed between Windows 98 and Windows XP ?', 125, 32, 2),
(33, 'Welches Betriebssystem wurde zwischen Windows 98 und Windows XP vermarktet ?', 129, 33, 3),
(34, '¿Qué sistema operativo se comercializó entre Windows 98 y Windows XP ?', 133, 34, 4),
(35, 'Quale sistema operativo è stato commercializzato tra Windows 98 e Windows XP ?', 137, 35, 5),
(36, 'Welk besturingssysteem werd op de markt gebracht tussen Windows 98 en Windows XP ?', 141, 36, 6),
(37, 'Quel service de stockage en ligne a été inventé par la société Microsoft ?', 146, 37, 1),
(38, 'Which online storage service was invented by Microsoft ?', 150, 38, 2),
(39, 'Welcher Online-Speicherdienst wurde von Microsoft erfunden ?', 154, 39, 3),
(40, '¿Qué servicio de almacenamiento en línea fue inventado por Microsoft ?', 158, 40, 4),
(41, 'Quale servizio di archiviazione online è stato inventato da Microsoft ?', 162, 41, 5),
(42, 'Welke online opslagdienst is door Microsoft bedacht ?', 165, 42, 6),
(43, 'Quel est le nom de la tablette conçue par les designers de chez Microsoft ?', 169, 43, 1),
(44, 'What is the name of the tablet designed by Microsoft designers ?', 173, 44, 2),
(45, 'Wie heisst das von Microsoft-Designern entworfene Tablet ?', 177, 45, 3),
(46, '¿Cuál es el nombre de la tableta diseñada por los diseñadores de Microsoft ?', 181, 46, 4),
(47, 'Qual è il nome del tablet progettato dai designer Microsoft ?', 185, 47, 5),
(48, 'Hoe heet de tablet ontworpen door Microsoft-ontwerpers ?', 189, 48, 6),
(49, 'En quelle année la multinationale Microsoft Corporation a-t-elle été fondée ?', 193, 49, 1),
(50, 'In which year was the multinational corporation Microsoft Corporation founded ?', 197, 50, 2),
(51, 'In welchem Jahr wurde das multinationale Unternehmen Microsoft Corporation gegründet ?', 201, 51, 3),
(52, '¿En qué año se fundó la corporación multinacional Microsoft Corporation ?', 205, 52, 4),
(53, 'In quale anno è stata fondata la società multinazionale Microsoft Corporation ?', 209, 53, 5),
(54, 'In welk jaar werd de multinational Corporation Microsoft Corporation opgericht ?', 213, 54, 6),
(55, 'Quel mot se cache derrière la lettre O du système d\'exploitation MS-DOS ?', 217, 55, 1),
(56, 'What word is behind the letter O of the MS-DOS operating system ?', 221, 56, 2),
(57, 'Welches Wort steckt hinter dem Buchstaben O des MS-DOS-Betriebssystems ?', 225, 57, 3),
(58, '¿Qué palabra está detrás de la letra O del sistema operativo MS-DOS ?', 229, 58, 4),
(59, 'Qual è la parola dietro la lettera O del sistema operativo MS-DOS ?', 233, 59, 5),
(60, 'Welk woord staat achter de letter O van het MS-DOS-besturingssysteem ?', 237, 60, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Quiz`
--

CREATE TABLE `Quiz` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Quiz`
--

INSERT INTO `Quiz` (`id`, `title`, `level`, `language_id`, `theme_id`) VALUES
(1, 'Emplacement Microsoft', 1, 1, 1),
(2, 'Microsoft location', 1, 2, 2),
(3, 'Microsoft-Standort', 1, 3, 3),
(4, 'Ubicación de Microsoft', 1, 4, 4),
(5, 'Sede Microsoft', 1, 5, 5),
(6, 'Microsoft-locatie', 1, 6, 6),
(7, 'Console de jeux de Microsoft', 1, 1, 1),
(8, 'Microsoft game console', 1, 2, 2),
(9, 'Spielkonsole von Microsoft', 1, 3, 3),
(10, 'Consola de juegos de Microsoft', 1, 4, 4),
(11, 'Console di gioco di Microsoft', 1, 5, 5),
(12, 'Microsoft Game Console', 1, 6, 6),
(13, 'Cofondateur de la société Microsoft', 1, 1, 1),
(14, 'Co-founder of Microsoft Corporation', 1, 2, 2),
(15, 'Mitgründer der Microsoft Corporation', 1, 3, 3),
(16, 'Cofundador de Microsoft Corporation', 1, 4, 4),
(17, 'Co-fondatore di Microsoft Corporation', 1, 5, 5),
(18, 'Mede-oprichter van Microsoft Corporation', 1, 6, 6),
(19, 'Simulateur de vol conçu par Microsoft', 1, 1, 1),
(20, 'Flight simulator developed by Microsoft', 1, 2, 2),
(21, 'Flugsimulator entwickelt von Microsoft', 1, 3, 3),
(22, 'Simulador de vuelo desarrollado por Microsoft', 1, 4, 4),
(23, 'Simulatori di volo sviluppati da Microsoft', 1, 5, 5),
(24, 'Vliegtuigsimulator ontwikkeld door Microsoft', 1, 6, 6),
(25, 'Téléphone Microsoft', 1, 1, 1),
(26, 'Microsoft smartphone', 1, 2, 2),
(27, 'Microsoft-Smartphone', 1, 3, 3),
(28, 'Smartphone de Microsoft', 1, 4, 4),
(29, 'Smartphone di Microsoft', 1, 5, 5),
(30, 'Microsoft-smartphone', 1, 6, 6),
(31, 'Système dexploitation', 1, 1, 1),
(32, 'Operating system', 1, 2, 2),
(33, 'Betriebssystem', 1, 3, 3),
(34, 'Sistema operativo', 1, 4, 4),
(35, 'Sistema operativo', 1, 5, 5),
(36, 'Besturingssysteem', 1, 6, 6),
(37, 'Service de stockage en ligne de Microsoft', 1, 1, 1),
(38, 'Microsoft online storage service', 1, 2, 2),
(39, 'Microsoft Online-Speicherdienst', 1, 3, 3),
(40, 'Servicio de almacenamiento en línea de Microsoft', 1, 4, 4),
(41, 'Servizio di archiviazione online di Microsoft', 1, 5, 5),
(42, 'Microsoft online opslagservice', 1, 6, 6),
(43, 'Nom de la tablette de Microsoft', 1, 1, 1),
(44, 'Microsoft tablet name', 1, 2, 2),
(45, 'Name des Microsoft-Tablets', 1, 3, 3),
(46, 'Nombre de la tableta de Microsoft', 1, 4, 4),
(47, 'Nome del tablet Microsoft', 1, 5, 5),
(48, 'Naam van de Microsoft-tablet', 1, 6, 6),
(49, 'Année de création de Microsoft Corporation', 1, 1, 1),
(50, 'Year of creation of Microsoft Corporation', 1, 2, 2),
(51, 'Gründungsjahr der Microsoft Corporation', 1, 3, 3),
(52, 'Año de creación de Microsoft Corporation', 1, 4, 4),
(53, 'Anno di fondazione della Microsoft Corporation', 1, 5, 5),
(54, 'Oprichtingsjaar van Microsoft Corporation', 1, 6, 6),
(55, 'O dans MS-DOS', 1, 1, 1),
(56, 'O in MS-DOS', 1, 2, 2),
(57, 'O in MS-DOS', 1, 3, 3),
(58, 'O en MS-DOS', 1, 4, 4),
(59, 'O in MS-DOS', 1, 5, 5),
(60, 'O in MS-DOS', 1, 6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `Score`
--

CREATE TABLE `Score` (
  `id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `scoreDate` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Score`
--

INSERT INTO `Score` (`id`, `score`, `scoreDate`, `user_id`, `quiz_id`) VALUES
(1, NULL, '2024-12-06', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Theme`
--

CREATE TABLE `Theme` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `langue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Theme`
--

INSERT INTO `Theme` (`id`, `name`, `langue_id`) VALUES
(1, 'Microsoft', 1),
(2, 'Microsoft', 2),
(3, 'Microsoft', 3),
(4, 'Microsoft', 4),
(5, 'Microsoft', 5),
(6, 'Microsoft', 6);

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`id`, `username`, `email`, `password`, `createdAt`) VALUES
(1, 'TestUser', 'Test@gmail.com', 'Test', '2024-12-06');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Information`
--
ALTER TABLE `Information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `langue_id` (`langue_id`);

--
-- Index pour la table `Language`
--
ALTER TABLE `Language`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Proposition`
--
ALTER TABLE `Proposition`
  ADD KEY `Proposition_ibfk_1` (`question_id`),
  ADD KEY `Proposition_ibfk_2` (`langue_id`);

--
-- Index pour la table `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `langue_id` (`langue_id`),
  ADD KEY `reponse_id` (`reponse_id`);

--
-- Index pour la table `Quiz`
--
ALTER TABLE `Quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `theme_id` (`theme_id`);

--
-- Index pour la table `Score`
--
ALTER TABLE `Score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Index pour la table `Theme`
--
ALTER TABLE `Theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `langue_id` (`langue_id`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Information`
--
ALTER TABLE `Information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Language`
--
ALTER TABLE `Language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Question`
--
ALTER TABLE `Question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `Quiz`
--
ALTER TABLE `Quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `Score`
--
ALTER TABLE `Score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Theme`
--
ALTER TABLE `Theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Information`
--
ALTER TABLE `Information`
  ADD CONSTRAINT `Information_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`),
  ADD CONSTRAINT `Inscription_ibfk_2` FOREIGN KEY (`langue_id`) REFERENCES `Language` (`id`);

--
-- Contraintes pour la table `Proposition`
--
ALTER TABLE `Proposition`
  ADD CONSTRAINT `Proposition_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`),
  ADD CONSTRAINT `Proposition_ibfk_2` FOREIGN KEY (`langue_id`) REFERENCES `Language` (`id`);

--
-- Contraintes pour la table `Quiz`
--
ALTER TABLE `Quiz`
  ADD CONSTRAINT `Quiz_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `Language` (`id`),
  ADD CONSTRAINT `Quiz_ibfk_2` FOREIGN KEY (`theme_id`) REFERENCES `Theme` (`id`);

--
-- Contraintes pour la table `Score`
--
ALTER TABLE `Score`
  ADD CONSTRAINT `Score_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `Score_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `Quiz` (`id`);

--
-- Contraintes pour la table `Theme`
--
ALTER TABLE `Theme`
  ADD CONSTRAINT `Theme_ibfk_1` FOREIGN KEY (`langue_id`) REFERENCES `Language` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
