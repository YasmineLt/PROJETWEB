-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 14 mai 2022 à 01:00
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gym_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `member_id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `members`
--

INSERT INTO `members` (`id`, `member_id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `date_created`) VALUES
(7, 103197, 'Mohamed', 'R', 'Loueti', 'Male', '132456798', 'Bacolod', 'med@gmail.com', '2022-03-31 11:41:06'),
(10, 199087, 'Dali', 'A', 'bennaceur', 'Male', '123456798', 'Secret', 'dali@gmail.com', '2022-03-31 11:41:06'),
(11, 199233, 'Rayen', 'A', 'ben othmen', 'Male', '123456789', 'Secret', 'rayen@gmail.com', '2022-03-31 11:41:06');

-- --------------------------------------------------------

--
-- Structure de la table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `package` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `packages`
--

INSERT INTO `packages` (`id`, `package`, `description`, `amount`) VALUES
(4, 'Premium Package', 'Sample Package', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `registration_id` int(30) NOT NULL,
  `amount` int(30) NOT NULL,
  `remarks` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=registration, 2= monthly payment',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `registration_id`, `amount`, `remarks`, `type`, `date_created`) VALUES
(1, 2, 4500, 'First payment', 2, '2022-10-13 14:39:26'),
(2, 2, 3500, 'payment for november', 2, '2022-10-19 14:39:52'),
(3, 6, 5000, '', 2, '2022-05-11 01:41:08');

-- --------------------------------------------------------

--
-- Structure de la table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `plan` int(30) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `registration_info`
--

DROP TABLE IF EXISTS `registration_info`;
CREATE TABLE IF NOT EXISTS `registration_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `member_id` int(30) NOT NULL,
  `plan_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `trainer_id` tinyint(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1= Active',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `registration_info`
--

INSERT INTO `registration_info` (`id`, `member_id`, `plan_id`, `package_id`, `start_date`, `end_date`, `trainer_id`, `status`, `date_created`) VALUES
(5, 6, 1, 2, '2020-10-21', '2021-10-21', 0, 1, '2020-10-21 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `member_id` int(30) NOT NULL,
  `dow` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `schedules`
--

INSERT INTO `schedules` (`id`, `member_id`, `dow`, `date_from`, `date_to`, `time_from`, `time_to`) VALUES
(2, 10, '1,3', '2022-05-01', '2022-07-31', '15:10:00', '17:50:00');

-- --------------------------------------------------------

--
-- Structure de la table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
CREATE TABLE IF NOT EXISTS `trainers` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rate` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `trainers`
--

INSERT INTO `trainers` (`id`, `name`, `contact`, `email`, `rate`) VALUES
(2, 'Yass', '23232323', 'Yas@gmail.com', 500);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1=Admin,2=Staff, 3= subscriber',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(2, 'Yasmine Loueti', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
