CREATE DATABASE IF NOT EXISTS insis_kitweb_database;
USE insis_kitweb_database;

CREATE TABLE Services ( 
    id_service INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_service VARCHAR(50) NOT NULL, 
    description_service TEXT NOT NULL,  
    url_img_service VARCHAR(200)
); 

CREATE TABLE Categories_eqt ( 
    id_categorie_eqt INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_categorie_eqt VARCHAR(50) NOT NULL, 
    description_categorie_eqt TEXT NOT NULL
); 

CREATE TABLE Sous_categories_eqt ( 
    id_sous_categorie_eqt INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_sous_categorie_eqt VARCHAR(50) NOT NULL, 
    description_sous_categorie_eqt TEXT NOT NULL,
    nom_spe_tech_1 VARCHAR(50) NOT NULL,
    nom_spe_tech_2 VARCHAR(50) NOT NULL,
    nom_spe_tech_3 VARCHAR(50) NOT NULL,
    id_categorie_eqt INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_categorie_eqt) REFERENCES Categories_eqt (id_categorie_eqt) ON DELETE CASCADE
); 

CREATE TABLE Sites ( 
    id_site INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_1_site VARCHAR(50) NOT NULL, 
    nom_2_site VARCHAR(50),
    lattitude_site VARCHAR(20) NOT NULL, 
    longitude_site VARCHAR(20) NOT NULL,
    ligne_1_adresse_site VARCHAR(100) NOT NULL, 
    ligne_2_adresse_site VARCHAR(100), 
    cp_adresse_site VARCHAR(5) NOT NULL,
    ville_adresse_site VARCHAR(50) NOT NULL
);

-- AJOUTER TITRE PAGE D'ACCEUIL
-- AJOUTER TEXTE PAGE D'ACCEUIL
CREATE TABLE Reseau ( 
    id_reseau INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_1_reseau VARCHAR(50) NOT NULL, 
    nom_2_reseau VARCHAR(50),
    url_img_acceuil_reseau VARCHAR(200) NOT NULL,
    titre_page_acceuil_reseau VARCHAR(200) NOT NULL,
    desc_page_acceuil_reseau VARCHAR(200) NOT NULL,
    nom_general_nat_reseau VARCHAR(50),
    desc_generale_nat_reseau TEXT,
    desc_page_eqt_reseau TEXT,
    desc_page_real_reseau TEXT,
    url_img_page_real_reseau VARCHAR(50),
    titre_page_real_reseau VARCHAR(50),
    desc_page_modes_reseau TEXT,
    desc_page_contact_reseau TEXT,
    id_site INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_site) REFERENCES Sites (id_site) ON DELETE CASCADE
);

CREATE TABLE Plateforme ( 
    id_plateforme INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_1_plateforme VARCHAR(50) NOT NULL, 
    nom_2_plateforme VARCHAR(50),
    url_img_acceuil_plateforme VARCHAR(100) NOT NULL,
    titre_page_acceuil_plateforme VARCHAR(50) NOT NULL,
    desc_page_acceuil_plateforme TEXT NOT NULL, 
    nom_general_nat_plateforme VARCHAR(50),
    desc_generale_nat_plateforme TEXT,
    desc_page_eqt_plateforme TEXT,
    desc_page_real_plateforme TEXT,
    url_img_page_real_plateforme VARCHAR(50),
    titre_page_real_plateforme VARCHAR(50),
    desc_page_modes_plateforme TEXT,
    desc_page_contact_plateforme TEXT,
    id_site INT(6) UNSIGNED NOT NULL,
    id_reseau INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_site) REFERENCES Sites (id_site) ON DELETE CASCADE,
    FOREIGN KEY (id_reseau) REFERENCES Reseau (id_reseau) ON DELETE CASCADE
);

/*TABLE AJOUTEE AU MLD RESEAU-SERVICES ET PLATEFORME-SERVICES*/ 
CREATE TABLE Reseau_services (
    id_reseau_services INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_reseau INT(6) UNSIGNED NOT NULL,
    id_service INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_reseau) REFERENCES Reseau (id_reseau) ON DELETE CASCADE,
    FOREIGN KEY (id_service) REFERENCES Services (id_service) ON DELETE CASCADE
);

CREATE TABLE Plateforme_services (
    id_plateforme_services INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_plateforme INT(6) UNSIGNED NOT NULL,
    id_service INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_plateforme) REFERENCES Plateforme (id_plateforme) ON DELETE CASCADE,
    FOREIGN KEY (id_service) REFERENCES Services (id_service) ON DELETE CASCADE
);

CREATE TABLE User (
    id_user INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_user VARCHAR(50) NOT NULL,
    prenom_user VARCHAR(50) NOT NULL,
    mail_user VARCHAR(80) NOT NULL,
    telephone_user VARCHAR(10) NOT NULL,
    url_photo_user VARCHAR(200),
    id_reseau INT(6) UNSIGNED,
    id_plateforme INT(6) UNSIGNED,

    FOREIGN KEY (id_reseau) REFERENCES Reseau (id_reseau) ON DELETE CASCADE,
    FOREIGN KEY (id_plateforme) REFERENCES Plateforme (id_plateforme) ON DELETE CASCADE
);

CREATE TABLE Roles (
    id_role INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_role VARCHAR(6) NOT NULL,
    description_role TEXT
);

CREATE TABLE User_roles (
    id_user_role INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_user INT(6) UNSIGNED NOT NULL,
    id_role INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_user) REFERENCES User (id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_role) REFERENCES Roles (id_role) ON DELETE CASCADE
);

-- AJOUTER LE NIVEAU POUR UTILISER UN EQT (NOVICE, ECT)
-- AJOUTER LES HABILITATIONS POUR UTILISER L'EQT
-- AJOUTER LA TABLE OPTION, UN EQUIPEMENT PEUT AVOIR PLUSIEURS OPTIONS 
-- AJOUTER L'OPTION TRANSPORTABLE
CREATE TABLE Equipements (
    id_equipement INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_1_equipement VARCHAR(50) NOT NULL,
    nom_2_equipement VARCHAR(50),
    url_img_equipement VARCHAR(200),  -- Rajouter NOT NULL plus tard 
    constructeur_equipement VARCHAR(50) NOT NULL,
    modele_equipement VARCHAR(50) NOT NULL,
    lieu_stockage_equipement VARCHAR(50),
    description_equipement TEXT NOT NULL,
    niv_utilisation_equipement ENUM('debutant', 'intermediaire', 'expert'), 
    habilitations_equipement VARCHAR(255),
    is_transportable_equipement BOOLEAN,
    id_user INT(6) UNSIGNED,
    id_plateforme INT(6) UNSIGNED,
    id_sous_categorie_eqt INT(6) UNSIGNED,

    FOREIGN KEY (id_user) REFERENCES User (id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_sous_categorie_eqt) REFERENCES Sous_categories_eqt (id_sous_categorie_eqt) ON DELETE CASCADE,
    FOREIGN KEY (id_plateforme) REFERENCES Plateforme (id_plateforme) ON DELETE CASCADE
);

CREATE TABLE Options (
    id_option INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_option VARCHAR(255) NOT NULL,
    desc_option TEXT NOT NULL
);

CREATE TABLE Option_equipement (
    id_option_equipement INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_option INT(6) UNSIGNED NOT NULL,
    id_equipement INT(6) UNSIGNED NOT NULL, 

    FOREIGN KEY (id_option) REFERENCES Options (id_option) ON DELETE CASCADE,
    FOREIGN KEY (id_equipement) REFERENCES Equipements (id_equipement) ON DELETE CASCADE
);

CREATE TABLE Option_sous_categorie (
    id_option_sous INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_option INT(6) UNSIGNED NOT NULL,
    id_sous_categorie_eqt INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_option) REFERENCES Options (id_option) ON DELETE CASCADE,
    FOREIGN KEY (id_sous_categorie_eqt) REFERENCES Sous_categories_eqt (id_sous_categorie_eqt) ON DELETE CASCADE
);

-- AJOUTER UNE ANNEE DE REALISATION 
-- AJOUTER IDENTFIANT EQUIPEMENT 
CREATE TABLE Realisations (
    id_realisation INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    titre_realisation VARCHAR(50) NOT NULL,
    url_img_realisation VARCHAR(200), -- Rajouter NOT NULL plus tard
    id_categorie_eqt INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_categorie_eqt) REFERENCES Categories_eqt (id_categorie_eqt) ON DELETE CASCADE
);

-- RAJOUTER TYPE DE PARTENARIAT EN ENUM 
-- RENNOMMER FINANCER EN ORGANISME
-- REVOIR LES TYPES DE FINANCEMENT AVEC MICHEL 
CREATE TABLE Financeurs (
    id_financeur INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nom_financeur VARCHAR(50) NOT NULL,
    url_logo_financeur VARCHAR(200) -- Rajouter NOT NULL plus tard
);

CREATE TABLE Financeurs_reseau (
    id_financeur_reseau INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_financeur INT(6) UNSIGNED NOT NULL,
    id_reseau INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_financeur) REFERENCES Financeurs (id_financeur) ON DELETE CASCADE,
    FOREIGN KEY (id_reseau) REFERENCES Reseau (id_reseau) ON DELETE CASCADE
);

CREATE TABLE Financeurs_plateforme (
    id_financeur_plateforme INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_financeur INT(6) UNSIGNED NOT NULL,
    id_plateforme INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_financeur) REFERENCES Financeurs (id_financeur) ON DELETE CASCADE,
    FOREIGN KEY (id_plateforme) REFERENCES Plateforme (id_plateforme) ON DELETE CASCADE
);

CREATE TABLE Financeurs_eqt (
    id_financeur_eqt INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    id_financeur INT(6) UNSIGNED NOT NULL,
    id_equipement INT(6) UNSIGNED NOT NULL,

    FOREIGN KEY (id_financeur) REFERENCES Financeurs (id_financeur) ON DELETE CASCADE,
    FOREIGN KEY (id_equipement) REFERENCES Equipements (id_equipement) ON DELETE CASCADE
);