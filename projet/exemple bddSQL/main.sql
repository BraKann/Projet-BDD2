
INSERT INTO LIGNE VALUES (1,'Ligne 1','Rail');
INSERT INTO LIGNE VALUES (2,'Ligne 2','Rail');
INSERT INTO LIGNE VALUES (3,'C5','Route');
INSERT INTO LIGNE VALUES (4,'N1','Fluviales');
INSERT INTO LIGNE VALUES (5,'N3','Fluviales');
INSERT INTO LIGNE VALUES (6,'Ligne 4','Route');
INSERT INTO LIGNE VALUES (7,'N2','Fluviales');
INSERT INTO LIGNE VALUES (8,'Déplacement dédié','Route');
INSERT INTO LIGNE VALUES (9,'12','Route');
INSERT INTO LIGNE VALUES (10,'Ligne 5','Route');

INSERT INTO ARRET VALUES (1,'Commerce');
INSERT INTO ARRET VALUES (2,'Beaujoire');
INSERT INTO ARRET VALUES (3,'Hôtel Dieu');
INSERT INTO ARRET VALUES (4,'Gare Maritime');
INSERT INTO ARRET VALUES (5,'Trentemoult');
INSERT INTO ARRET VALUES (6,'Gare Sud');
INSERT INTO ARRET VALUES (7,'Hôtel de Région');
INSERT INTO ARRET VALUES (8,'Île de Nantes');
INSERT INTO ARRET VALUES (9,'Université');
INSERT INTO ARRET VALUES (10,'Hangar a Banane');

INSERT INTO VEHICULE VALUES (101,'Tramway',250,'Électrique','Rampe d’accès');
INSERT INTO VEHICULE VALUES (102,'Tramway',250,'Électrique','Rampe d’accès');
INSERT INTO VEHICULE VALUES (201,'Bus',50,'Gaz_Naturel','Rampe d’accès');
INSERT INTO VEHICULE VALUES (202,'Bus',50,'Gaz_Naturel','Rampe d’accès');
INSERT INTO VEHICULE VALUES (301,'Navibus',95,'Diesel','Rampe d’accès');
INSERT INTO VEHICULE VALUES (302,'Navibus',95,'Hydrogène','Rampe d’accès');
INSERT INTO VEHICULE VALUES (303,'Navibus',95,'Électrique','Rampe d’accès');
INSERT INTO VEHICULE VALUES (401,'BusWay',150,'Électrique','Rampe d’accès, WiFi');
INSERT INTO VEHICULE VALUES (402,'BusWay',150,'Électrique','Rampe d’accès, WiFi');
INSERT INTO VEHICULE VALUES (501,'ProxiTan',4,'Diesel','Rampe d’accès, Espace fauteuil,Ascenseur');

INSERT INTO RESEAUX VALUES (1, 1, 101);
INSERT INTO RESEAUX VALUES (1, 3, 102);
INSERT INTO RESEAUX VALUES (2, 2, 102);
INSERT INTO RESEAUX VALUES (3, 3, 201);
INSERT INTO RESEAUX VALUES (4, 4, 301);
INSERT INTO RESEAUX VALUES (4, 5, 301);
INSERT INTO RESEAUX VALUES (5, 6, 302);
INSERT INTO RESEAUX VALUES (6, 7, 401);
INSERT INTO RESEAUX VALUES (7, 8, 303);
INSERT INTO RESEAUX VALUES (8, NULL, 501);
INSERT INTO RESEAUX VALUES (9, 9, 202);
INSERT INTO RESEAUX VALUES (10, 10, 402);
    
-- Sélectionner toutes les données de la table LIGNE
SELECT * FROM LIGNE;

-- Sélectionner toutes les données de la table VEHICULE
SELECT * FROM VEHICULE;

-- Sélectionner toutes les données de la table ARRET
SELECT * FROM ARRET;

-- Sélectionner toutes les données de la table RESEAUX
SELECT * FROM RESEAUX;

-- Sélectionner les vehicules qui ont une capacité supérieure à 100 et qui passent par l'arret 'Commerce'
SELECT * FROM VEHICULE V
JOIN RESEAUX R ON V.vehicule_id = R.vehicule_id
JOIN ARRET A ON R.arret_id = A.arret_id
WHERE A.arret_nom = 'Commerce' AND V.capacite > 100;


