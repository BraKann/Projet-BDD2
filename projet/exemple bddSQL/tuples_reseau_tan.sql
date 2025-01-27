-- @tuples_reseau_tan.sql
spool tuples_reseau_tan.log

prompt *************************************************************
prompt ******************** DELETE TABLE *****************************
prompt *************************************************************

DELETE FROM RESEAUTAN;

prompt *************************************************************
prompt ******************** INSERT TUPLES **************************
prompt *************************************************************

INSERT INTO RESEAUTAN (ligne_id, ligne_nom, ligne_type, arret_id, arret_nom, vehicule_id, vehicule_type, capacite, carburant_type, accessibilité_fonctionnalite) 
VALUES
(1, 'Ligne 1', 'Rail', 1, 'Commerce', 101, 'Tramway', 250 , 'Électrique', 'Rampe d’accès'),
(2, 'Ligne 2', 'Rail', 2, 'Beaujoire', 102, 'Tramway', 250 , 'Électrique', 'Rampe d’accès'),
(3, 'C5', 'Route', 3, 'Hôtel Dieu', 201, 'Bus', 50, 'Gaz_Naturel', 'Rampe d’accès'),
(4, 'N1', 'Fluviales', 4, 'Gare Maritime', 301, 'Navibus', 95, 'Diesel', 'Rampe d’accès'),
(4, 'N1', 'Fluviales', 5, 'Trentemoult', 301, 'Navibus', 95, 'Diesel', 'Rampe d’accès'),
(5, 'N3', 'Fluviales', 6, 'Gare Sud', 302, 'Navibus', 95, 'Hydrogène', 'Rampe d’accès'),
(6, 'Ligne 4', 'Route', 7, 'Hôtel de Région', 401, 'BusWay', 150, 'Électrique', 'Rampe d’accès, WiFi'),
(10, 'Ligne 5', 'Route', 10, 'Hangar a Banane', 402, 'BusWay', 150, 'Électrique', 'Rampe d’accès, WiFi'),
(7, 'Loire N2', 'Fluviales', 8, 'Île de Nantes', 303, 'Navibus', 95, 'Électrique', 'Rampe d’accès'),
(8, 'Déplacement dédié', 'Route', NULL, NULL, 501, 'ProxiTan', 4, 'Diesel', 'Rampe d’accès, Espace fauteuil,Ascenseur'),
(9, '12', 'Route', 9, 'Université', 202, 'Bus', 50, 'Gaz_Naturel', 'Rampe d’accès'); 