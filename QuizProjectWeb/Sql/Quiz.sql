-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 06 déc. 2024 à 13:30
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

-- --------------------------------------------------------

--
-- Structure de la table `Information`
--

CREATE TABLE `Information` (
  `id` int(11) NOT NULL,
  `anecdote` text DEFAULT NULL,
  `wiki` text DEFAULT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Question`
--

CREATE TABLE `Question` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `answerNumber` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `Score`
--

CREATE TABLE `Score` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `scoreDate` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Theme`
--

CREATE TABLE `Theme` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Index pour les tables déchargées
--

--
-- Index pour la table `Information`
--
ALTER TABLE `Information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

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
  ADD KEY `question_id` (`question_id`);

--
-- Index pour la table `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Language`
--
ALTER TABLE `Language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Proposition`
--
ALTER TABLE `Proposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Question`
--
ALTER TABLE `Question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Quiz`
--
ALTER TABLE `Quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Score`
--
ALTER TABLE `Score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Theme`
--
ALTER TABLE `Theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Information`
--
ALTER TABLE `Information`
  ADD CONSTRAINT `Information_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`);

--
-- Contraintes pour la table `Proposition`
--
ALTER TABLE `Proposition`
  ADD CONSTRAINT `Proposition_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`);

--
-- Contraintes pour la table `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `Quiz` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
