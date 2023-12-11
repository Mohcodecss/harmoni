-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 12 oct. 2023 à 14:33
-- Version du serveur : 5.7.33
-- Version de PHP : 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `harmonia`
--
CREATE DATABASE IF NOT EXISTS `harmonia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER IF NOT EXISTS 'harmonia-web'@'localhost' IDENTIFIED BY 'p@ssw0rd';
GRANT ALL PRIVILEGES ON `harmonia`.* TO 'harmonia-web'@'localhost';
FLUSH PRIVILEGES;

USE `harmonia`;

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `libelleCours` varchar(50) NOT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `ageMini` int(11) NOT NULL,
  `ageMaxi` int(11) NOT NULL,
  `nbPlaces` int(11) NOT NULL,
  `idInstrument` int(11) NOT NULL,
  `idTypeCours` int(11) NOT NULL,
  `idNiveauCours` int(11) NOT NULL,
  `idEnseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `libelleCours`, `dateDebut`, `dateFin`, `ageMini`, `ageMaxi`, `nbPlaces`, `idInstrument`, `idTypeCours`, `idNiveauCours`, `idEnseignant`) VALUES
(1, 'Cours de Guitare', '2023-09-01', '2023-12-15', 7, 99, 10, 1, 1, 1, 1),
(2, 'Cours de Flûte', '2023-09-10', '2023-12-20', 10, 99, 8, 2, 2, 1, 2),
(3, 'Cours de Piano', '2023-09-05', '2023-12-18', 7, 99, 12, 3, 1, 1, 1),
(4, 'Cours de Violoncelle', '2023-09-08', '2023-12-22', 8, 99, 8, 4, 2, 4, 3),
(5, 'Cours de Batterie', '2023-09-12', '2023-12-17', 12, 99, 6, 6, 3, 2, 4),
(6, 'Atelier de Saxophone', '2023-09-03', '2023-12-18', 10, 99, 10, 5, 3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cours_inscriptions`
--

CREATE TABLE `cours_inscriptions` (
  `idEleve` int(11) NOT NULL,
  `idCours` int(11) NOT NULL,
  `dateInscription` date NOT NULL,
  `nbPaiement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cours_inscriptions`
--

INSERT INTO `cours_inscriptions` (`idEleve`, `idCours`, `dateInscription`, `nbPaiement`) VALUES
(1, 1, '2023-08-25', 1),
(2, 1, '2023-08-28', 1),
(2, 2, '2023-08-28', 1),
(3, 4, '2023-08-30', 1),
(4, 6, '2023-08-22', 1);

-- --------------------------------------------------------

--
-- Structure de la table `cours_niveaux`
--

CREATE TABLE `cours_niveaux` (
  `id` int(11) NOT NULL DEFAULT '0',
  `libelle` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours_niveaux`
--

INSERT INTO `cours_niveaux` (`id`, `libelle`) VALUES
(1, 'Débutant'),
(2, 'Intermédiaire'),
(3, 'Avancé'),
(4, 'Expert'),
(5, 'Avancé 2');

-- --------------------------------------------------------

--
-- Structure de la table `cours_types`
--

CREATE TABLE `cours_types` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cours_types`
--

INSERT INTO `cours_types` (`id`, `libelle`) VALUES
(1, 'Cours individuel'),
(2, 'Cours collectif'),
(3, 'Atelier de groupe'),
(4, 'Cours en ligne');

-- --------------------------------------------------------

--
-- Structure de la table `cours_types_tarifs`
--

CREATE TABLE `cours_types_tarifs` (
  `idTypeCours` int(11) NOT NULL,
  `idNiveauCours` int(11) NOT NULL,
  `montant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cours_types_tarifs`
--

INSERT INTO `cours_types_tarifs` (`idTypeCours`, `idNiveauCours`, `montant`) VALUES
(1, 1, 250),
(1, 2, 250),
(1, 3, 280),
(1, 4, 300),
(2, 1, 200),
(2, 2, 220),
(2, 3, 250),
(2, 4, 280),
(3, 1, 180),
(3, 2, 200),
(3, 3, 220),
(3, 4, 240),
(4, 1, 220),
(4, 2, 240),
(4, 3, 260),
(4, 4, 280);

-- --------------------------------------------------------

--
-- Structure de la table `ecole_departements`
--

CREATE TABLE `ecole_departements` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ecole_departements`
--

INSERT INTO `ecole_departements` (`id`, `nom`) VALUES
(1, 'Cordes'),
(2, 'Percussions'),
(3, 'Claviers'),
(4, 'Bois'),
(5, 'Cuivres'),
(6, 'Voix et direction de chœurs'),
(7, 'Musique de chambre'),
(8, 'Musique ancienne');

-- --------------------------------------------------------

--
-- Structure de la table `ecole_enseignants`
--

CREATE TABLE `ecole_enseignants` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ecole_enseignants`
--

INSERT INTO `ecole_enseignants` (`id`, `nom`, `prenom`, `photo`) VALUES
(1, 'Martin', 'Sophie', 'sophie.jpg'),
(2, 'Lefebvre', 'Marc', 'marc.jpg'),
(3, 'Lefort', 'Marie', 'marie.jpg'),
(4, 'Dupuis', 'Paul', 'paul.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `dateNaissance` date NOT NULL,
  `idResponsable` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` char(10) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `codePostal` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id`, `nom`, `prenom`, `dateNaissance`, `idResponsable`, `email`, `telephone`, `adresse`, `ville`, `codePostal`) VALUES
(1, 'Tremblay', 'Sophie', '2010-06-15', 1, NULL, NULL, NULL, NULL, NULL),
(2, 'Lavoie', 'Marc', '2008-03-21', 1, NULL, NULL, NULL, NULL, NULL),
(3, 'Gagnon', 'Pierre', '2012-04-30', 2, NULL, NULL, NULL, NULL, NULL),
(4, 'Martin', 'Sophie', '2002-10-09', NULL, 'sosos1452@email.com', NULL, 'apt 32, residence les Boulins', 'MusicVillle', '99999'),
(5, 'Dupont', 'Marie', '2012-03-12', 3, 'marie.dupont@email.com', '1234567890', '456 Rue D', 'Ville D', '67890'),
(6, 'Dupont', 'Luc', '2009-08-21', 3, NULL, NULL, NULL, NULL, NULL),
(7, 'Lefebvre', 'Sophie', '2003-05-15', NULL, 'sophie.lefebvre@email.com', '9876542310', '123 Rue F', 'Ville F', '54321'),
(8, 'Dubois', 'Pierre', '2002-11-30', NULL, 'pierre.dubois@email.com', '5555555555', '456 Rue G', 'Ville G', '45678');

-- --------------------------------------------------------

--
-- Structure de la table `eleves_responsables`
--

CREATE TABLE `eleves_responsables` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `codePostal` char(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel1` char(10) NOT NULL,
  `tel2` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `eleves_responsables`
--

INSERT INTO `eleves_responsables` (`id`, `nom`, `prenom`, `adresse`, `ville`, `codePostal`, `email`, `tel1`, `tel2`) VALUES
(1, 'Durand', 'Jean', '123 Rue de la Musique', 'Villeville', '12345', 'jeandurand14@email.com', '1234567890', '9876543210'),
(2, 'Lapierre', 'Claire', '456 Avenue de la Musique', 'Musiqueville', '54321', 'famille_lapierre@email.com', '9876543210', '1234567890'),
(3, 'Dupont', 'Jean', '123 Rue A', 'Ville A', '12345', 'jean.dupont@email.com', '1234567890', '9876543210');

-- --------------------------------------------------------

--
-- Structure de la table `instruments_familles`
--

CREATE TABLE `instruments_familles` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `instruments_familles`
--

INSERT INTO `instruments_familles` (`id`, `libelle`) VALUES
(1, 'Cordes'),
(2, 'Vents'),
(3, 'Percussions'),
(4, 'Claviers'),
(5, 'Percussions'),
(6, 'Cuivres');

-- --------------------------------------------------------

--
-- Structure de la table `instruments_types`
--

CREATE TABLE `instruments_types` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `idFamilleInstrument` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `instruments_types`
--

INSERT INTO `instruments_types` (`id`, `libelle`, `idFamilleInstrument`, `photo`) VALUES
(1, 'Guitare', 1, 'guitare.png'),
(2, 'Flûte traversière', 2, 'flute.png'),
(3, 'Piano', 4, 'piano.png'),
(4, 'Violoncelle', 1, 'violoncelle.png'),
(5, 'Saxophone', 6, 'saxophone.png'),
(6, 'Batterie', 5, 'batterie.png'),
(7, 'accordéon', 4, 'accordeon.png'),
(8, 'Harpe', 1, 'harpe.png'),
(9, 'Trompette', 6, 'trompette.png'),
(10, 'Violon', 1, 'violon.png'),
(11, 'Luth', 1, 'luth.png'),
(12, 'contrebasse', 1, ''),
(13, 'trombone', 6, ''),
(14, 'tuba', 6, '');

-- --------------------------------------------------------

--
-- Structure de la table `locations_instruments`
--

CREATE TABLE `locations_instruments` (
  `id` int(11) NOT NULL,
  `dateFabrication` date DEFAULT NULL,
  `fabricant` varchar(20) DEFAULT NULL,
  `etat` enum('Excellent','Très bon','Bon','Moyen','Usage') NOT NULL,
  `idDepartement` int(11) DEFAULT NULL,
  `idTypeInstrument` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `locations_instruments`
--

INSERT INTO `locations_instruments` (`id`, `dateFabrication`, `fabricant`, `etat`, `idDepartement`, `idTypeInstrument`) VALUES
(1, '2004-05-10', 'Matthias Weiken', 'Bon', 1, 10),
(2, '2004-05-10', 'Matthias Weiken', 'Bon', 1, 10),
(3, '2008-10-12', 'Despiau Chevalets', 'Très bon', 1, 10),
(4, '1994-09-15', 'Despiau Chevalets', 'Moyen', 1, 10),
(5, '2012-05-04', 'Despiau Chevalets', 'Excellent', 1, 10),
(6, '2007-06-10', 'Despiau Chevalets', 'Bon', 1, 10),
(7, '2004-02-20', 'Paul Beley', 'Très bon', 1, 4),
(8, '2004-02-20', 'Paul Beley', 'Bon', 1, 4),
(9, '2012-10-23', 'Paul Beley', 'Excellent', 1, 4),
(10, '2013-02-20', 'Christian Laborie', 'Excellent', 1, 12),
(11, '2009-02-15', 'Christian Laborie', 'Très bon', 1, 12),
(14, '2019-01-07', 'Lechgold', 'Excellent', 5, 13),
(15, '2018-07-10', 'Thomann', 'Très bon', 5, 9),
(16, '2020-08-04', 'Carol Brass', 'Excellent', 5, 9),
(17, '2019-10-14', 'Thomann', 'Bon', 5, 14);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_instruments_FK` (`idInstrument`),
  ADD KEY `cours_type_cour0_FK` (`idTypeCours`),
  ADD KEY `idEnseignant` (`idEnseignant`),
  ADD KEY `idNiveauCours` (`idNiveauCours`);

--
-- Index pour la table `cours_inscriptions`
--
ALTER TABLE `cours_inscriptions`
  ADD PRIMARY KEY (`idEleve`,`idCours`),
  ADD KEY `inscriptions_eleves_FK` (`idEleve`),
  ADD KEY `inscriptions_cours0_FK` (`idCours`);

--
-- Index pour la table `cours_niveaux`
--
ALTER TABLE `cours_niveaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cours_types`
--
ALTER TABLE `cours_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cours_types_tarifs`
--
ALTER TABLE `cours_types_tarifs`
  ADD PRIMARY KEY (`idTypeCours`,`idNiveauCours`),
  ADD KEY `idNiveauCours` (`idNiveauCours`);

--
-- Index pour la table `ecole_departements`
--
ALTER TABLE `ecole_departements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ecole_enseignants`
--
ALTER TABLE `ecole_enseignants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eleves_responsables_FK` (`idResponsable`);

--
-- Index pour la table `eleves_responsables`
--
ALTER TABLE `eleves_responsables`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instruments_familles`
--
ALTER TABLE `instruments_familles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instruments_types`
--
ALTER TABLE `instruments_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTypeInstrument` (`idFamilleInstrument`);

--
-- Index pour la table `locations_instruments`
--
ALTER TABLE `locations_instruments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Departement` (`idDepartement`),
  ADD KEY `FK_TypeInstrument` (`idTypeInstrument`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `cours_types`
--
ALTER TABLE `cours_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ecole_departements`
--
ALTER TABLE `ecole_departements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `ecole_enseignants`
--
ALTER TABLE `ecole_enseignants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `eleves_responsables`
--
ALTER TABLE `eleves_responsables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `instruments_familles`
--
ALTER TABLE `instruments_familles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `instruments_types`
--
ALTER TABLE `instruments_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `locations_instruments`
--
ALTER TABLE `locations_instruments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`idEnseignant`) REFERENCES `ecole_enseignants` (`id`),
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`idNiveauCours`) REFERENCES `cours_niveaux` (`id`),
  ADD CONSTRAINT `cours_instruments_FK` FOREIGN KEY (`idInstrument`) REFERENCES `instruments_types` (`id`),
  ADD CONSTRAINT `cours_type_cour0_FK` FOREIGN KEY (`idTypeCours`) REFERENCES `cours_types` (`id`);

--
-- Contraintes pour la table `cours_inscriptions`
--
ALTER TABLE `cours_inscriptions`
  ADD CONSTRAINT `inscriptions_cours0_FK` FOREIGN KEY (`idCours`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `inscriptions_eleves_FK` FOREIGN KEY (`idEleve`) REFERENCES `eleves` (`id`);

--
-- Contraintes pour la table `cours_types_tarifs`
--
ALTER TABLE `cours_types_tarifs`
  ADD CONSTRAINT `cours_types_tarifs_ibfk_1` FOREIGN KEY (`idNiveauCours`) REFERENCES `cours_niveaux` (`id`),
  ADD CONSTRAINT `couter_type_cour_FK` FOREIGN KEY (`idTypeCours`) REFERENCES `cours_types` (`id`);

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_responsables_FK` FOREIGN KEY (`idResponsable`) REFERENCES `eleves_responsables` (`id`);

--
-- Contraintes pour la table `instruments_types`
--
ALTER TABLE `instruments_types`
  ADD CONSTRAINT `instruments_types_ibfk_1` FOREIGN KEY (`idFamilleInstrument`) REFERENCES `instruments_familles` (`id`);

--
-- Contraintes pour la table `locations_instruments`
--
ALTER TABLE `locations_instruments`
  ADD CONSTRAINT `locations_instruments_ibfk_1` FOREIGN KEY (`idDepartement`) REFERENCES `ecole_departements` (`id`),
  ADD CONSTRAINT `locations_instruments_ibfk_2` FOREIGN KEY (`idTypeInstrument`) REFERENCES `instruments_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
