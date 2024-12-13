-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 13 déc. 2024 à 09:20
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
(24, 'Londen', 6, 6);

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
(6, 'In welke stad was in 2018 het hoofdkantoor van Microsoft ?', 24, 6, 6);

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
(31, 'Système exploitation', 1, 1, 1),
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
(54, 'Oprichtingsjaar van Microsoft Corporation', 1, 6, 6);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `langue_id` (`langue_id`);

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
-- AUTO_INCREMENT pour la table `Proposition`
--
ALTER TABLE `Proposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `Question`
--
ALTER TABLE `Question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Quiz`
--
ALTER TABLE `Quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
-- Contraintes pour la table `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `Quiz` (`id`),
  ADD CONSTRAINT `Question_ibfk_2` FOREIGN KEY (`langue_id`) REFERENCES `Language` (`id`),
  ADD CONSTRAINT `Question_ibfk_3` FOREIGN KEY (`reponse_id`) REFERENCES `Proposition` (`id`);

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
