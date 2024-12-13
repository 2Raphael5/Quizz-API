-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 06 déc. 2024 à 16:05
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
(1, 'Cette ville de l\'État de Washington abrite le siège social de l\'éditeur de logiciels Microsoft et de la branche américaine de Nintendo', 'https://fr.wikipedia.org/wiki/Redmond_(Washington)', 1, 1);

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
  `creationDate` date NOT NULL,
  `language_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Quiz`
--

INSERT INTO `Quiz` (`id`, `title`, `level`, `creationDate`, `language_id`, `theme_id`) VALUES
(1, 'Emplacement Microsoft', 1, '2024-12-06', 1, 1),
(2, 'Microsoft location', 1, '2024-12-06', 2, 2),
(3, 'Microsoft-Standort', 1, '2024-12-06', 3, 3),
(4, 'Ubicación de Microsoft', 1, '2024-12-06', 4, 4),
(5, 'Sede Microsoft', 1, '2024-12-06', 5, 5),
(6, 'Microsoft-locatie', 1, '2024-12-06', 6, 6);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
