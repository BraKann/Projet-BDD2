-- @tuples_reseau_tan.sql
spool tuples_reseau_tan.log

prompt *************************************************************
prompt ******************** DELETE TABLE *****************************
prompt *************************************************************

DELETE FROM RESEAUX;
DELETE FROM LIGNE;
DELETE FROM ARRET;
DELETE FROM VEHICULE;

prompt *************************************************************
prompt ******************** INSERT TUPLES **************************
prompt *************************************************************

INSERT INTO LIGNE VALUES (1,'Ligne 1','Rail');
INSERT INTO LIGNE VALUES (2,'Ligne 2','Rail');
INSERT INTO LIGNE VALUES (3,'C5','Route');
INSERT INTO LIGNE VALUES (4,'N1','Fluviales');
INSERT INTO LIGNE VALUES (5,'N3','Fluviales');
INSERT INTO LIGNE VALUES (6,'Ligne 4','Route');
INSERT INTO LIGNE VALUES (7,'N2','Fluviales');
INSERT INTO LIGNE VALUES (8,'Deplacement dedie','Route');
INSERT INTO LIGNE VALUES (9,'12','Route');
INSERT INTO LIGNE VALUES (10,'Ligne 5','Route');

INSERT INTO ARRET VALUES (1,'Commerce');
INSERT INTO ARRET VALUES (2,'Beaujoire');
INSERT INTO ARRET VALUES (3,'Hôtel Dieu');
INSERT INTO ARRET VALUES (4,'Gare Maritime');
INSERT INTO ARRET VALUES (5,'Trentemoult');
INSERT INTO ARRET VALUES (6,'Gare Sud');
INSERT INTO ARRET VALUES (7,'Hôtel de Region');
INSERT INTO ARRET VALUES (8,'Île de Nantes');
INSERT INTO ARRET VALUES (9,'Universite');
INSERT INTO ARRET VALUES (10,'Hangar a Banane');

INSERT INTO VEHICULE VALUES (101,'Tramway',250,'electrique');
INSERT INTO VEHICULE VALUES (102,'Tramway',250,'electrique');
INSERT INTO VEHICULE VALUES (201,'Bus',50,'Gaz_Naturel');
INSERT INTO VEHICULE VALUES (202,'Bus',50,'Gaz_Naturel');
INSERT INTO VEHICULE VALUES (301,'Navibus',95,'Diesel');
INSERT INTO VEHICULE VALUES (302,'Navibus',95,'Hydrogene');
INSERT INTO VEHICULE VALUES (303,'Navibus',95,'electrique');
INSERT INTO VEHICULE VALUES (401,'BusWay',150,'electrique');
INSERT INTO VEHICULE VALUES (402,'BusWay',150,'electrique');
INSERT INTO VEHICULE VALUES (501,'ProxiTan',4,'Diesel');

INSERT INTO RESEAUX VALUES (1, 1, 101);
INSERT INTO RESEAUX VALUES (1, 3, 102);
INSERT INTO RESEAUX VALUES (2, 2, 102);
INSERT INTO RESEAUX VALUES (3, 3, 201);
INSERT INTO RESEAUX VALUES (4, 4, 301);
INSERT INTO RESEAUX VALUES (4, 5, 301);
INSERT INTO RESEAUX VALUES (5, 6, 302);
INSERT INTO RESEAUX VALUES (6, 7, 401);
INSERT INTO RESEAUX VALUES (7, 8, 303);
INSERT INTO RESEAUX VALUES (9, 9, 202);
INSERT INTO RESEAUX VALUES (10, 10, 402);
