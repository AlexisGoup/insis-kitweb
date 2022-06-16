INSERT INTO Services 
    SET nom_service = 'Service n1',
        description_service = 'description',
        url_img_service = 'url\url_img';

INSERT INTO Categories_eqt 
    SET nom_categorie_eqt = 'Categorie n1',
        description_categorie_eqt = 'description';

INSERT INTO Sous_categories_eqt (nom_sous_categorie_eqt, description_sous_categorie_eqt, nom_spe_tech_1, nom_spe_tech_2, nom_spe_tech_3, id_categorie_eqt)
VALUES ('Sous Categorie n1', 'description', 'nom_spe_tech_1', 'nom_spe_tech_2', 'nom_spe_tech_3', (SELECT id_categorie_eqt FROM Categories_eqt WHERE nom_categorie_eqt = 'Categorie n1' LIMIT 1));

INSERT INTO Sites (nom_1_site, nom_2_site, lattitude_site, longitude_site, ligne_1_adresse_site, ligne_2_adresse_site, cp_adresse_site, ville_adresse_site)
VALUES ('nom_1', 'nom_2', 'lattitude', 'longitude', 'ligne_1', 'ligne_2', 'cp', 'ville');

INSERT INTO Reseau (nom_1_reseau, nom_2_reseau, url_img_acceuil_reseau, titre_page_acceuil_reseau, desc_page_acceuil_reseau, nom_general_nat_reseau, desc_generale_nat_reseau, desc_page_eqt_reseau, desc_page_real_reseau, url_img_page_real_reseau, titre_page_real_reseau, desc_page_modes_reseau, desc_page_contact_reseau, id_site)
VALUES ('nom_reseau_1', '', 'url', 'Titre de la page d acceuil', 'Description de la page d acceuil', 'nom_general_nat', 'desc_generale_nat', 'desc_page_eqt', 'desc_page_real', 'url_img_page_real', 'titre_page_real', 'desc_page_modes', 'desc_page_contact', (SELECT id_site FROM Sites WHERE nom_1_site = 'nom_1' LIMIT 1));

INSERT INTO Plateforme (nom_1_plateforme, nom_2_plateforme, url_img_acceuil_plateforme, titre_page_acceuil_plateforme, desc_page_acceuil_plateforme, nom_general_nat_plateforme, desc_generale_nat_plateforme, desc_page_eqt_plateforme, desc_page_real_plateforme, url_img_page_real_plateforme, titre_page_real_plateforme, desc_page_modes_plateforme, desc_page_contact_plateforme, id_site, id_reseau)
VALUES ('nom_pft_1', '', 'url', 'Titre page acceuil', 'Description page acceuil', 'nom_general_nat', 'desc_generale_nat', 'desc_page_eqt', 'desc_page_real', 'url_img_page_real', 'titre_page_real', 'desc_page_modes', 'desc_page_contact', (SELECT id_site FROM Sites WHERE nom_1_site = 'nom_1' LIMIT 1), (SELECT id_reseau FROM Reseau WHERE nom_1_reseau = 'nom_reseau_1' LIMIT 1));

INSERT INTO Reseau_services (id_reseau, id_service)
VALUES ((SELECT id_reseau FROM Reseau WHERE nom_1_reseau = 'nom_reseau_1' LIMIT 1), (SELECT id_service FROM Services WHERE nom_service = 'Service n1' LIMIT 1));

INSERT INTO Plateforme_services (id_plateforme, id_service)
VALUES ((SELECT id_plateforme FROM Plateforme WHERE nom_1_plateforme = 'nom_pft_1' LIMIT 1), (SELECT id_service FROM Services WHERE nom_service = 'Service n1' LIMIT 1));

INSERT INTO User (nom_user, prenom_user, mail_user, telephone_user, url_photo_user, id_reseau, id_plateforme)
VALUES ('Doe', 'John', 'johndoe@mail.fr', '0766788790', 'url_photo', (SELECT id_reseau FROM Reseau WHERE nom_1_reseau = 'nom_reseau_1' LIMIT 1), (SELECT id_plateforme FROM Plateforme WHERE nom_1_plateforme = 'nom_pft_1' LIMIT 1));

INSERT INTO Roles (nom_role, description_role)
VALUES ('role 1', 'description role 1');

INSERT INTO User_roles (id_user, id_role)
VALUES ((SELECT id_user FROM User WHERE nom_user = 'Doe' LIMIT 1), (SELECT id_role FROM Roles WHERE nom_role = 'role 1' LIMIT 1));

INSERT INTO Equipements (nom_1_equipement, nom_2_equipement, url_img_equipement, constructeur_equipement, modele_equipement, lieu_stockage_equipement, description_equipement, niv_utilisation_equipement, habilitations_equipement, is_transportable_equipement, id_user, id_plateforme, id_sous_categorie_eqt)
VALUES ('nom equipement 1', ' ', 'url_img', 'constructeur', 'modele', 'lieu_stockage', 'description bla bla', 'debutant', 'Habilitation 1, Habilitation 2', true, (SELECT id_user FROM User WHERE nom_user = 'Doe' LIMIT 1),  (SELECT id_plateforme FROM Plateforme WHERE nom_1_plateforme = 'nom_pft_1' LIMIT 1), (SELECT id_sous_categorie_eqt FROM Sous_categories_eqt WHERE nom_sous_categorie_eqt = 'Sous Categorie n1' LIMIT 1));

INSERT INTO Options (nom_option, desc_option)
VALUES ('Option 1', 'description de l option 1');

INSERT INTO Option_equipement (id_option, id_equipement)
VALUES ((SELECT id_option FROM Options WHERE nom_option = 'Option 1' LIMIT 1), (SELECT id_equipement FROM Equipements WHERE nom_1_equipement = 'nom equipement 1' LIMIT 1))

INSERT INTO Option_sous_categorie (id_option, id_sous_categorie_eqt)
VALUES ((SELECT id_option FROM Options WHERE nom_option = 'Option 1' LIMIT 1), (SELECT id_sous_categorie_eqt FROM Sous_categories_eqt WHERE nom_sous_categorie_eqt = 'Sous Categorie n1' LIMIT 1))

INSERT INTO Realisations (titre_realisation, url_img_realisation, id_categorie_eqt)
VALUES ('titre realisation 1', 'url_img', (SELECT id_categorie_eqt FROM Categories_eqt WHERE nom_categorie_eqt = 'Categorie n1' LIMIT 1));

INSERT INTO Financeurs (nom_financeur, url_logo_financeur)
VALUES ('financeur_1', 'url_logo');

INSERT INTO Financeurs_reseau (id_financeur, id_reseau)
VALUES ((SELECT id_financeur FROM Financeurs WHERE nom_financeur = 'financeur_1' LIMIT 1), (SELECT id_reseau FROM Reseau WHERE nom_1_reseau = 'nom_reseau_1' LIMIT 1));

INSERT INTO Financeurs_plateforme (id_financeur, id_plateforme)
VALUES ((SELECT id_financeur FROM Financeurs WHERE nom_financeur = 'financeur_1' LIMIT 1), (SELECT id_plateforme FROM Plateforme WHERE nom_1_plateforme = 'nom_pft_1' LIMIT 1));

INSERT INTO Financeurs_eqt (id_financeur, id_equipement)
VALUES ((SELECT id_financeur FROM Financeurs WHERE nom_financeur = 'financeur_1' LIMIT 1), (SELECT id_equipement FROM Equipements WHERE nom_1_equipement = 'nom equipement 1' LIMIT 1));