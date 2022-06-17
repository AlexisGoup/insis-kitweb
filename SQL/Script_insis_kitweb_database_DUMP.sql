-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 17 juin 2022 à 09:00
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `insis_kitweb_database`
--

-- --------------------------------------------------------

--
-- Structure de la table `Categories_eqt`
--

CREATE TABLE `Categories_eqt` (
  `id_categorie_eqt` int(6) UNSIGNED NOT NULL,
  `nom_categorie_eqt` varchar(50) NOT NULL,
  `description_categorie_eqt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Categories_eqt`
--

INSERT INTO `Categories_eqt` (`id_categorie_eqt`, `nom_categorie_eqt`, `description_categorie_eqt`) VALUES
(1, 'Categorie n1', 'description');

-- --------------------------------------------------------

--
-- Structure de la table `Equipements`
--

CREATE TABLE `Equipements` (
  `id_equipement` int(6) UNSIGNED NOT NULL,
  `nom_1_equipement` varchar(50) NOT NULL,
  `nom_2_equipement` varchar(50) DEFAULT NULL,
  `url_img_equipement` varchar(200) DEFAULT NULL,
  `constructeur_equipement` varchar(50) NOT NULL,
  `modele_equipement` varchar(50) NOT NULL,
  `lieu_stockage_equipement` varchar(50) DEFAULT NULL,
  `description_equipement` text NOT NULL,
  `niv_utilisation_equipement` enum('debutant','intermediaire','expert') DEFAULT NULL,
  `habilitations_equipement` varchar(255) DEFAULT NULL,
  `is_transportable_equipement` tinyint(1) DEFAULT NULL,
  `id_user` int(6) UNSIGNED DEFAULT NULL,
  `id_plateforme` int(6) UNSIGNED DEFAULT NULL,
  `id_sous_categorie_eqt` int(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Equipements`
--

INSERT INTO `Equipements` (`id_equipement`, `nom_1_equipement`, `nom_2_equipement`, `url_img_equipement`, `constructeur_equipement`, `modele_equipement`, `lieu_stockage_equipement`, `description_equipement`, `niv_utilisation_equipement`, `habilitations_equipement`, `is_transportable_equipement`, `id_user`, `id_plateforme`, `id_sous_categorie_eqt`) VALUES
(1, 'nom equipement 1', ' ', 'url_img', 'constructeur', 'modele', 'lieu_stockage', 'description bla bla', 'debutant', 'Habilitation 1, Habilitation 2', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Financeurs`
--

CREATE TABLE `Financeurs` (
  `id_financeur` int(6) UNSIGNED NOT NULL,
  `nom_financeur` varchar(50) NOT NULL,
  `url_logo_financeur` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Financeurs`
--

INSERT INTO `Financeurs` (`id_financeur`, `nom_financeur`, `url_logo_financeur`) VALUES
(1, 'financeur_1', 'url_logo');

-- --------------------------------------------------------

--
-- Structure de la table `Financeurs_eqt`
--

CREATE TABLE `Financeurs_eqt` (
  `id_financeur_eqt` int(6) UNSIGNED NOT NULL,
  `id_financeur` int(6) UNSIGNED NOT NULL,
  `id_equipement` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Financeurs_eqt`
--

INSERT INTO `Financeurs_eqt` (`id_financeur_eqt`, `id_financeur`, `id_equipement`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Financeurs_plateforme`
--

CREATE TABLE `Financeurs_plateforme` (
  `id_financeur_plateforme` int(6) UNSIGNED NOT NULL,
  `id_financeur` int(6) UNSIGNED NOT NULL,
  `id_plateforme` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Financeurs_plateforme`
--

INSERT INTO `Financeurs_plateforme` (`id_financeur_plateforme`, `id_financeur`, `id_plateforme`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Financeurs_reseau`
--

CREATE TABLE `Financeurs_reseau` (
  `id_financeur_reseau` int(6) UNSIGNED NOT NULL,
  `id_financeur` int(6) UNSIGNED NOT NULL,
  `id_reseau` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Financeurs_reseau`
--

INSERT INTO `Financeurs_reseau` (`id_financeur_reseau`, `id_financeur`, `id_reseau`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Options`
--

CREATE TABLE `Options` (
  `id_option` int(6) UNSIGNED NOT NULL,
  `nom_option` varchar(255) NOT NULL,
  `desc_option` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Options`
--

INSERT INTO `Options` (`id_option`, `nom_option`, `desc_option`) VALUES
(1, 'Option 1', 'description de l option 1');

-- --------------------------------------------------------

--
-- Structure de la table `Option_equipement`
--

CREATE TABLE `Option_equipement` (
  `id_option_equipement` int(6) UNSIGNED NOT NULL,
  `id_option` int(6) UNSIGNED NOT NULL,
  `id_equipement` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Option_equipement`
--

INSERT INTO `Option_equipement` (`id_option_equipement`, `id_option`, `id_equipement`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Option_sous_categorie`
--

CREATE TABLE `Option_sous_categorie` (
  `id_option_sous` int(6) UNSIGNED NOT NULL,
  `id_option` int(6) UNSIGNED NOT NULL,
  `id_sous_categorie_eqt` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Option_sous_categorie`
--

INSERT INTO `Option_sous_categorie` (`id_option_sous`, `id_option`, `id_sous_categorie_eqt`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Plateforme`
--

CREATE TABLE `Plateforme` (
  `id_plateforme` int(6) UNSIGNED NOT NULL,
  `nom_1_plateforme` varchar(50) NOT NULL,
  `nom_2_plateforme` varchar(50) DEFAULT NULL,
  `url_img_acceuil_plateforme` varchar(250) NOT NULL,
  `titre_page_acceuil_plateforme` varchar(50) NOT NULL,
  `desc_page_acceuil_plateforme` text NOT NULL,
  `nom_general_nat_plateforme` varchar(50) DEFAULT NULL,
  `desc_generale_nat_plateforme` text,
  `desc_page_eqt_plateforme` text,
  `desc_page_real_plateforme` text,
  `url_img_page_real_plateforme` varchar(50) DEFAULT NULL,
  `titre_page_real_plateforme` varchar(50) DEFAULT NULL,
  `desc_page_modes_plateforme` text,
  `desc_page_contact_plateforme` text,
  `id_site` int(6) UNSIGNED NOT NULL,
  `id_reseau` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Plateforme`
--

INSERT INTO `Plateforme` (`id_plateforme`, `nom_1_plateforme`, `nom_2_plateforme`, `url_img_acceuil_plateforme`, `titre_page_acceuil_plateforme`, `desc_page_acceuil_plateforme`, `nom_general_nat_plateforme`, `desc_generale_nat_plateforme`, `desc_page_eqt_plateforme`, `desc_page_real_plateforme`, `url_img_page_real_plateforme`, `titre_page_real_plateforme`, `desc_page_modes_plateforme`, `desc_page_contact_plateforme`, `id_site`, `id_reseau`) VALUES
(1, 'Université de bordeaux', '', 'https://www.legi.grenoble-inp.fr/web/IMG/jpg/_c_cyril_fresillon-legi-cnrs_phototheque_cnrs_20160079_0020_resultat.jpg', 'Titre page acceuil', 'L\'université de Bordeaux est une grande université de recherche pluridisciplinaire, ancrée dans ses territoires et rayonnant à l\'international.', 'nom_general_nat', 'L\'université de Bordeaux est une grande université de recherche pluridisciplinaire, ancrée dans ses territoires et rayonnant à l\'international.', 'L\'université de Bordeaux est une grande université de recherche pluridisciplinaire, ancrée dans ses territoires et rayonnant à l\'international.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'url_img_page_real', 'titre_page_real', 'Description de la page d acceuil : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Description de la page d acceuil : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, 1),
(2, 'CCR', '', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Jrc_ispra_visitors_centre.jpg/1200px-Jrc_ispra_visitors_centre.jpg', 'Titre page acceuil', 'Le Centre commun de recherche ou CCR (en anglais, Joint Research Centre ou JRC) est le laboratoire de recherche scientifique et technique de l\'Union européenne. Cette direction générale de la Commission européenne a été créée dans le but d\'apporter les conseils scientifiques et le savoir-faire technique nécessaires pour soutenir les orientations politiques choisies par l\'Union.', 'nom_general_nat', 'Le Centre commun de recherche ou CCR (en anglais, Joint Research Centre ou JRC) est le laboratoire de recherche scientifique et technique de l\'Union européenne. ', 'desc_page_eqt', 'desc_page_real', 'url_img_page_real', 'titre_page_real', 'desc_page_modes', 'desc_page_contact', 1, 1),
(3, 'IES Montpellier', '', 'https://static.latribune.fr/full_width/424103/le-nouveau-centre-de-recherche-en-sciences-et-technologies-de-l-information-de-montpellier.jpg', 'Titre page acceuil', 'Des équipes de l\'Institut d\'électronique et des systèmes (IES-UM2-CNRS), du Laboratoire d\'informatique, robotique et microélectronique de Montpellier (LIRMM-UM2-CNRS) et de l\'Institut national de recherche en informatique et automatique (INRIA) viennent d\'intégrer le nouveau Centre de recherche en sciences et technologies de l\'information de Montpellier, situé sur le campus Saint-Priest et officiellement inauguré le 16 décembre.', 'nom_general_nat', 'Des équipes de l\'Institut d\'électronique et des systèmes (IES-UM2-CNRS), du Laboratoire d\'informatique, robotique et microélectronique de Montpellier (LIRMM-UM2-CNRS) et de l\'Institut national de recherche en informatique et automatique (INRIA) viennent d\'intégrer le nouveau Centre de recherche en sciences et technologies de l\'information de Montpellier, situé sur le campus Saint-Priest et officiellement inauguré le 16 décembre.', 'desc_page_eqt', 'desc_page_real', 'url_img_page_real', 'titre_page_real', 'desc_page_modes', 'desc_page_contact', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Plateforme_services`
--

CREATE TABLE `Plateforme_services` (
  `id_plateforme_services` int(6) UNSIGNED NOT NULL,
  `id_plateforme` int(6) UNSIGNED NOT NULL,
  `id_service` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Plateforme_services`
--

INSERT INTO `Plateforme_services` (`id_plateforme_services`, `id_plateforme`, `id_service`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Realisations`
--

CREATE TABLE `Realisations` (
  `id_realisation` int(6) UNSIGNED NOT NULL,
  `titre_realisation` varchar(50) NOT NULL,
  `url_img_realisation` varchar(200) DEFAULT NULL,
  `id_categorie_eqt` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Realisations`
--

INSERT INTO `Realisations` (`id_realisation`, `titre_realisation`, `url_img_realisation`, `id_categorie_eqt`) VALUES
(1, 'titre realisation 1', 'url_img', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Reseau`
--

CREATE TABLE `Reseau` (
  `id_reseau` int(6) UNSIGNED NOT NULL,
  `nom_1_reseau` varchar(50) NOT NULL,
  `nom_2_reseau` varchar(50) DEFAULT NULL,
  `url_img_acceuil_reseau` text NOT NULL,
  `titre_page_acceuil_reseau` varchar(200) NOT NULL,
  `desc_page_acceuil_reseau` text NOT NULL,
  `nom_general_nat_reseau` varchar(50) DEFAULT NULL,
  `desc_generale_nat_reseau` text,
  `desc_page_eqt_reseau` text,
  `desc_page_real_reseau` text,
  `url_img_page_real_reseau` varchar(50) DEFAULT NULL,
  `titre_page_real_reseau` varchar(50) DEFAULT NULL,
  `desc_page_modes_reseau` text,
  `desc_page_contact_reseau` text,
  `id_site` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Reseau`
--

INSERT INTO `Reseau` (`id_reseau`, `nom_1_reseau`, `nom_2_reseau`, `url_img_acceuil_reseau`, `titre_page_acceuil_reseau`, `desc_page_acceuil_reseau`, `nom_general_nat_reseau`, `desc_generale_nat_reseau`, `desc_page_eqt_reseau`, `desc_page_real_reseau`, `url_img_page_real_reseau`, `titre_page_real_reseau`, `desc_page_modes_reseau`, `desc_page_contact_reseau`, `id_site`) VALUES
(1, 'FEMTO', '', 'https://miti.cnrs.fr/wp-content/uploads/2018/12/Capture-decran-2022-05-11-112044-400x400.png', 'Présentation', 'Le réseau technologique Femto adresse l’ensemble des problématiques liées à la génération, la caractérisation et l’utilisation des impulsions ultra-brèves. Son principal objectif est de rassembler et diffuser les connaissances et techniques spécifiques aux impulsions femtoseconde auprès de communautés scientifiques interdisciplinaires utilisant ou étant susceptibles d’utiliser ces sources ultra-brèves.', 'nom_general_nat', 'Femto adresse l’ensemble des problématiques liées à la génération, la caractérisation et l’utilisation des impulsions ultra-brèves.', 'desc_page_eqt : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'desc_page_real : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'url_img_page_real', 'titre_page_real', 'desc_page_modes : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'desc_page_contact : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 1),
(2, 'CRISTECH', NULL, 'https://miti.cnrs.fr/wp-content/uploads/2018/12/Capture-decran-2022-05-11-101257-400x400.png', 'Qui sommes-nous ? ', 'Le réseau est ouvert à toutes les personnes intéressées par la croissance cristalline et la cristallisation, quel que soit leur domaine scientifique d’intérêt (physique, chimie, biologie, géologie, science des matériaux,…) ou leur organisme d’appartenance (CNRS, établissements d’enseignement supérieur telles qu’universités ou grandes écoles, EPICs tels que le CEA, mais aussi industriels). Bien que la croissance cristalline soit souvent associée aux cristaux massifs inorganiques (oxydes, métaux, …) le réseau s’attelle à fédérer non seulement les utilisateurs de méthodes de préparation traditionnels (hautes température, en solution), mais aussi ceux de techniques alternatives (microfluidique, couches minces, …).', NULL, 'Le réseau est ouvert à toutes les personnes intéressées par la croissance cristalline et la cristallisation, quel que soit leur domaine scientifique d’intérêt (physique, chimie, biologie, géologie, science des matériaux,…) ou leur organisme d’appartenance (CNRS, établissements d’enseignement supérieur telles qu’universités ou grandes écoles, EPICs tels que le CEA, mais aussi industriels).', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 'RTMFM', '', 'https://miti.cnrs.fr/wp-content/uploads/2018/12/Capture-decran-2022-05-11-104539-400x400.png', 'En quelques mots ', 'Le Réseau Technologique de Microscopie photonique de Fluorescence Multidimensionnelle est un réseau fédérateur des expertises en microscopie photonique pour la biologie. La communauté de ce réseau accueille les spécialistes du transfert de technologies entre l’instrumentation optique et la biologie, capables de comprendre à la fois les besoins de la biologie et les notions physiques, appliqués à la réalisation d’outils innovants en optique.', 'nom_general_nat', 'Le Réseau Technologique de Microscopie photonique de Fluorescence Multidimensionnelle est un réseau fédérateur des expertises en microscopie photonique pour la biologie.', 'desc_page_eqt', 'desc_page_real', 'url_img_page_real', 'titre_page_real', 'desc_page_modes', 'desc_page_contact', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Reseau_services`
--

CREATE TABLE `Reseau_services` (
  `id_reseau_services` int(6) UNSIGNED NOT NULL,
  `id_reseau` int(6) UNSIGNED NOT NULL,
  `id_service` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Reseau_services`
--

INSERT INTO `Reseau_services` (`id_reseau_services`, `id_reseau`, `id_service`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Roles`
--

CREATE TABLE `Roles` (
  `id_role` int(6) UNSIGNED NOT NULL,
  `nom_role` varchar(6) NOT NULL,
  `description_role` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Roles`
--

INSERT INTO `Roles` (`id_role`, `nom_role`, `description_role`) VALUES
(1, 'role 1', 'description role 1');

-- --------------------------------------------------------

--
-- Structure de la table `Services`
--

CREATE TABLE `Services` (
  `id_service` int(6) UNSIGNED NOT NULL,
  `nom_service` varchar(50) NOT NULL,
  `description_service` text NOT NULL,
  `url_img_service` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Services`
--

INSERT INTO `Services` (`id_service`, `nom_service`, `description_service`, `url_img_service`) VALUES
(1, 'Service n1', 'description', 'urlurl_img');

-- --------------------------------------------------------

--
-- Structure de la table `Sites`
--

CREATE TABLE `Sites` (
  `id_site` int(6) UNSIGNED NOT NULL,
  `nom_1_site` varchar(50) NOT NULL,
  `nom_2_site` varchar(50) DEFAULT NULL,
  `lattitude_site` varchar(20) NOT NULL,
  `longitude_site` varchar(20) NOT NULL,
  `ligne_1_adresse_site` varchar(100) NOT NULL,
  `ligne_2_adresse_site` varchar(100) DEFAULT NULL,
  `cp_adresse_site` varchar(5) NOT NULL,
  `ville_adresse_site` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Sites`
--

INSERT INTO `Sites` (`id_site`, `nom_1_site`, `nom_2_site`, `lattitude_site`, `longitude_site`, `ligne_1_adresse_site`, `ligne_2_adresse_site`, `cp_adresse_site`, `ville_adresse_site`) VALUES
(1, 'nom_1', 'nom_2', 'lattitude', 'longitude', 'ligne_1', 'ligne_2', 'cp', 'ville');

-- --------------------------------------------------------

--
-- Structure de la table `Sous_categories_eqt`
--

CREATE TABLE `Sous_categories_eqt` (
  `id_sous_categorie_eqt` int(6) UNSIGNED NOT NULL,
  `nom_sous_categorie_eqt` varchar(50) NOT NULL,
  `description_sous_categorie_eqt` text NOT NULL,
  `nom_spe_tech_1` varchar(50) NOT NULL,
  `nom_spe_tech_2` varchar(50) NOT NULL,
  `nom_spe_tech_3` varchar(50) NOT NULL,
  `id_categorie_eqt` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Sous_categories_eqt`
--

INSERT INTO `Sous_categories_eqt` (`id_sous_categorie_eqt`, `nom_sous_categorie_eqt`, `description_sous_categorie_eqt`, `nom_spe_tech_1`, `nom_spe_tech_2`, `nom_spe_tech_3`, `id_categorie_eqt`) VALUES
(1, 'Sous Categorie n1', 'description', 'nom_spe_tech_1', 'nom_spe_tech_2', 'nom_spe_tech_3', 1);

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `id_user` int(6) UNSIGNED NOT NULL,
  `nom_user` varchar(50) NOT NULL,
  `prenom_user` varchar(50) NOT NULL,
  `mail_user` varchar(80) NOT NULL,
  `telephone_user` varchar(10) NOT NULL,
  `url_photo_user` varchar(200) DEFAULT NULL,
  `id_reseau` int(6) UNSIGNED DEFAULT NULL,
  `id_plateforme` int(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`id_user`, `nom_user`, `prenom_user`, `mail_user`, `telephone_user`, `url_photo_user`, `id_reseau`, `id_plateforme`) VALUES
(1, 'Goupillot', 'Alexis', 'johndoe@mail.fr', '0766788790', 'url_photo', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `User_roles`
--

CREATE TABLE `User_roles` (
  `id_user_role` int(6) UNSIGNED NOT NULL,
  `id_user` int(6) UNSIGNED NOT NULL,
  `id_role` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `User_roles`
--

INSERT INTO `User_roles` (`id_user_role`, `id_user`, `id_role`) VALUES
(1, 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Categories_eqt`
--
ALTER TABLE `Categories_eqt`
  ADD PRIMARY KEY (`id_categorie_eqt`);

--
-- Index pour la table `Equipements`
--
ALTER TABLE `Equipements`
  ADD PRIMARY KEY (`id_equipement`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_sous_categorie_eqt` (`id_sous_categorie_eqt`),
  ADD KEY `id_plateforme` (`id_plateforme`);

--
-- Index pour la table `Financeurs`
--
ALTER TABLE `Financeurs`
  ADD PRIMARY KEY (`id_financeur`);

--
-- Index pour la table `Financeurs_eqt`
--
ALTER TABLE `Financeurs_eqt`
  ADD PRIMARY KEY (`id_financeur_eqt`),
  ADD KEY `id_financeur` (`id_financeur`),
  ADD KEY `id_equipement` (`id_equipement`);

--
-- Index pour la table `Financeurs_plateforme`
--
ALTER TABLE `Financeurs_plateforme`
  ADD PRIMARY KEY (`id_financeur_plateforme`),
  ADD KEY `id_financeur` (`id_financeur`),
  ADD KEY `id_plateforme` (`id_plateforme`);

--
-- Index pour la table `Financeurs_reseau`
--
ALTER TABLE `Financeurs_reseau`
  ADD PRIMARY KEY (`id_financeur_reseau`),
  ADD KEY `id_financeur` (`id_financeur`),
  ADD KEY `id_reseau` (`id_reseau`);

--
-- Index pour la table `Options`
--
ALTER TABLE `Options`
  ADD PRIMARY KEY (`id_option`);

--
-- Index pour la table `Option_equipement`
--
ALTER TABLE `Option_equipement`
  ADD PRIMARY KEY (`id_option_equipement`),
  ADD KEY `id_option` (`id_option`),
  ADD KEY `id_equipement` (`id_equipement`);

--
-- Index pour la table `Option_sous_categorie`
--
ALTER TABLE `Option_sous_categorie`
  ADD PRIMARY KEY (`id_option_sous`),
  ADD KEY `id_option` (`id_option`),
  ADD KEY `id_sous_categorie_eqt` (`id_sous_categorie_eqt`);

--
-- Index pour la table `Plateforme`
--
ALTER TABLE `Plateforme`
  ADD PRIMARY KEY (`id_plateforme`),
  ADD KEY `id_site` (`id_site`),
  ADD KEY `id_reseau` (`id_reseau`);

--
-- Index pour la table `Plateforme_services`
--
ALTER TABLE `Plateforme_services`
  ADD PRIMARY KEY (`id_plateforme_services`),
  ADD KEY `id_plateforme` (`id_plateforme`),
  ADD KEY `id_service` (`id_service`);

--
-- Index pour la table `Realisations`
--
ALTER TABLE `Realisations`
  ADD PRIMARY KEY (`id_realisation`),
  ADD KEY `id_categorie_eqt` (`id_categorie_eqt`);

--
-- Index pour la table `Reseau`
--
ALTER TABLE `Reseau`
  ADD PRIMARY KEY (`id_reseau`),
  ADD KEY `id_site` (`id_site`);

--
-- Index pour la table `Reseau_services`
--
ALTER TABLE `Reseau_services`
  ADD PRIMARY KEY (`id_reseau_services`),
  ADD KEY `id_reseau` (`id_reseau`),
  ADD KEY `id_service` (`id_service`);

--
-- Index pour la table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id_service`);

--
-- Index pour la table `Sites`
--
ALTER TABLE `Sites`
  ADD PRIMARY KEY (`id_site`);

--
-- Index pour la table `Sous_categories_eqt`
--
ALTER TABLE `Sous_categories_eqt`
  ADD PRIMARY KEY (`id_sous_categorie_eqt`),
  ADD KEY `id_categorie_eqt` (`id_categorie_eqt`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_reseau` (`id_reseau`),
  ADD KEY `id_plateforme` (`id_plateforme`);

--
-- Index pour la table `User_roles`
--
ALTER TABLE `User_roles`
  ADD PRIMARY KEY (`id_user_role`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Categories_eqt`
--
ALTER TABLE `Categories_eqt`
  MODIFY `id_categorie_eqt` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Equipements`
--
ALTER TABLE `Equipements`
  MODIFY `id_equipement` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Financeurs`
--
ALTER TABLE `Financeurs`
  MODIFY `id_financeur` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Financeurs_eqt`
--
ALTER TABLE `Financeurs_eqt`
  MODIFY `id_financeur_eqt` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Financeurs_plateforme`
--
ALTER TABLE `Financeurs_plateforme`
  MODIFY `id_financeur_plateforme` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Financeurs_reseau`
--
ALTER TABLE `Financeurs_reseau`
  MODIFY `id_financeur_reseau` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Options`
--
ALTER TABLE `Options`
  MODIFY `id_option` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Option_equipement`
--
ALTER TABLE `Option_equipement`
  MODIFY `id_option_equipement` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Option_sous_categorie`
--
ALTER TABLE `Option_sous_categorie`
  MODIFY `id_option_sous` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Plateforme`
--
ALTER TABLE `Plateforme`
  MODIFY `id_plateforme` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Plateforme_services`
--
ALTER TABLE `Plateforme_services`
  MODIFY `id_plateforme_services` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Realisations`
--
ALTER TABLE `Realisations`
  MODIFY `id_realisation` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Reseau`
--
ALTER TABLE `Reseau`
  MODIFY `id_reseau` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Reseau_services`
--
ALTER TABLE `Reseau_services`
  MODIFY `id_reseau_services` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `id_role` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Services`
--
ALTER TABLE `Services`
  MODIFY `id_service` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Sites`
--
ALTER TABLE `Sites`
  MODIFY `id_site` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Sous_categories_eqt`
--
ALTER TABLE `Sous_categories_eqt`
  MODIFY `id_sous_categorie_eqt` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id_user` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `User_roles`
--
ALTER TABLE `User_roles`
  MODIFY `id_user_role` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Equipements`
--
ALTER TABLE `Equipements`
  ADD CONSTRAINT `equipements_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `equipements_ibfk_2` FOREIGN KEY (`id_sous_categorie_eqt`) REFERENCES `Sous_categories_eqt` (`id_sous_categorie_eqt`) ON DELETE CASCADE,
  ADD CONSTRAINT `equipements_ibfk_3` FOREIGN KEY (`id_plateforme`) REFERENCES `Plateforme` (`id_plateforme`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Financeurs_eqt`
--
ALTER TABLE `Financeurs_eqt`
  ADD CONSTRAINT `financeurs_eqt_ibfk_1` FOREIGN KEY (`id_financeur`) REFERENCES `Financeurs` (`id_financeur`) ON DELETE CASCADE,
  ADD CONSTRAINT `financeurs_eqt_ibfk_2` FOREIGN KEY (`id_equipement`) REFERENCES `Equipements` (`id_equipement`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Financeurs_plateforme`
--
ALTER TABLE `Financeurs_plateforme`
  ADD CONSTRAINT `financeurs_plateforme_ibfk_1` FOREIGN KEY (`id_financeur`) REFERENCES `Financeurs` (`id_financeur`) ON DELETE CASCADE,
  ADD CONSTRAINT `financeurs_plateforme_ibfk_2` FOREIGN KEY (`id_plateforme`) REFERENCES `Plateforme` (`id_plateforme`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Financeurs_reseau`
--
ALTER TABLE `Financeurs_reseau`
  ADD CONSTRAINT `financeurs_reseau_ibfk_1` FOREIGN KEY (`id_financeur`) REFERENCES `Financeurs` (`id_financeur`) ON DELETE CASCADE,
  ADD CONSTRAINT `financeurs_reseau_ibfk_2` FOREIGN KEY (`id_reseau`) REFERENCES `Reseau` (`id_reseau`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Option_equipement`
--
ALTER TABLE `Option_equipement`
  ADD CONSTRAINT `option_equipement_ibfk_1` FOREIGN KEY (`id_option`) REFERENCES `Options` (`id_option`) ON DELETE CASCADE,
  ADD CONSTRAINT `option_equipement_ibfk_2` FOREIGN KEY (`id_equipement`) REFERENCES `Equipements` (`id_equipement`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Option_sous_categorie`
--
ALTER TABLE `Option_sous_categorie`
  ADD CONSTRAINT `option_sous_categorie_ibfk_1` FOREIGN KEY (`id_option`) REFERENCES `Options` (`id_option`) ON DELETE CASCADE,
  ADD CONSTRAINT `option_sous_categorie_ibfk_2` FOREIGN KEY (`id_sous_categorie_eqt`) REFERENCES `Sous_categories_eqt` (`id_sous_categorie_eqt`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Plateforme`
--
ALTER TABLE `Plateforme`
  ADD CONSTRAINT `plateforme_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `Sites` (`id_site`) ON DELETE CASCADE,
  ADD CONSTRAINT `plateforme_ibfk_2` FOREIGN KEY (`id_reseau`) REFERENCES `Reseau` (`id_reseau`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Plateforme_services`
--
ALTER TABLE `Plateforme_services`
  ADD CONSTRAINT `plateforme_services_ibfk_1` FOREIGN KEY (`id_plateforme`) REFERENCES `Plateforme` (`id_plateforme`) ON DELETE CASCADE,
  ADD CONSTRAINT `plateforme_services_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `Services` (`id_service`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Realisations`
--
ALTER TABLE `Realisations`
  ADD CONSTRAINT `realisations_ibfk_1` FOREIGN KEY (`id_categorie_eqt`) REFERENCES `Categories_eqt` (`id_categorie_eqt`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Reseau`
--
ALTER TABLE `Reseau`
  ADD CONSTRAINT `reseau_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `Sites` (`id_site`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Reseau_services`
--
ALTER TABLE `Reseau_services`
  ADD CONSTRAINT `reseau_services_ibfk_1` FOREIGN KEY (`id_reseau`) REFERENCES `Reseau` (`id_reseau`) ON DELETE CASCADE,
  ADD CONSTRAINT `reseau_services_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `Services` (`id_service`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Sous_categories_eqt`
--
ALTER TABLE `Sous_categories_eqt`
  ADD CONSTRAINT `sous_categories_eqt_ibfk_1` FOREIGN KEY (`id_categorie_eqt`) REFERENCES `Categories_eqt` (`id_categorie_eqt`) ON DELETE CASCADE;

--
-- Contraintes pour la table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_reseau`) REFERENCES `Reseau` (`id_reseau`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_plateforme`) REFERENCES `Plateforme` (`id_plateforme`) ON DELETE CASCADE;

--
-- Contraintes pour la table `User_roles`
--
ALTER TABLE `User_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `Roles` (`id_role`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
