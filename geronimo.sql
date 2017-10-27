-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 27 oct. 2017 à 15:30
-- Version du serveur :  10.1.26-MariaDB
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `geronimo`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `IdComments` int(20) NOT NULL,
  `Pseudo` varchar(25) DEFAULT NULL,
  `Commentaires` varchar(25) DEFAULT NULL,
  `DateCommentaire` datetime DEFAULT NULL,
  `IdArticle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `idLike` int(100) NOT NULL,
  `pseudo` varchar(250) NOT NULL,
  `idarticle` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `idnews` int(20) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `likes` int(100) NOT NULL,
  `comments` int(100) NOT NULL,
  `title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`idnews`, `photo`, `text`, `likes`, `comments`, `title`) VALUES
(1, 'image1', 'La deuxième saison de Stranger Things approche à grands pas. Netflix dévoile donc...', 20, 10, 'Stranger Things 2 Amazing New Posters'),
(2, 'image2', 'Le photographe Akos Major armé de son Mamiya7, chargé de pellicules Kodak Portra 400...', 65, 22, 'Beautiful Series Across the USA'),
(3, 'image3', 'Dans cette série de tableaux, l’artiste Dries Ketels se penche sur la célèbre...', 30, 15, 'Game of Thrones Crystal Made Artworks by Dries Ketels'),
(4, 'image4', 'Passionné par l’art et le design, Al Power est un illustrateur irlandais installé à...', 16, 10, 'Colorful Doors of Dublin Illustrations'),
(5, 'image5', 'Alexander Semenov est un photographe marin et biologiste qui est en train de conduire...', 32, 14, 'Alexander Semenov Expedition to Shoot...'),
(6, 'image6', 'Edoardo Tresoldi explore le concept de « fantôme » à travers ses incroyables...', 25, 0, 'Ghostly Floating Installation by Edoardo...');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`IdComments`),
  ADD KEY `IdArticle` (`IdArticle`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`idLike`),
  ADD KEY `idarticle` (`idarticle`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`idnews`),
  ADD KEY `comments` (`comments`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `IdComments` int(20) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`IdArticle`) REFERENCES `news` (`idnews`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`idarticle`) REFERENCES `news` (`idnews`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
