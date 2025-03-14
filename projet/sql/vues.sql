-- vue pour récupérer les lignes complètes
CREATE VIEW Vue_Lignes_Completes AS
SELECT l.ligne_id, l.nom AS ligne_nom, l.type AS ligne_type, a.nom AS arret_nom, v.type AS vehicule_type, v.carburant
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.id_ligne
JOIN ARRET a ON r.id_arret = a.arret_id
JOIN VEHICULE v ON r.id_vehicule = v.vehicule_id;

--vue pour récuperer les lignes sur lesquelles circulent des bus
CREATE VIEW Vue_Lignes_Bus AS
SELECT DISTINCT l.ligne_id, l.nom AS ligne_nom, l.type AS ligne_type
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.id_ligne
JOIN VEHICULE v ON r.id_vehicule = v.vehicule_id
WHERE v.type = 'Bus';

--vue pour récuperer les lignes sur lesquelles circulent des tramway
CREATE VIEW Vue_Lignes_Tramway AS
SELECT DISTINCT l.ligne_id, l.nom AS ligne_nom, l.type AS ligne_type
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.id_ligne
JOIN VEHICULE v ON r.id_vehicule = v.vehicule_id
WHERE v.type = 'Tramway';

--vue pour récuperer les lignes qui passent par l'arrêt 'Commerce'
CREATE VIEW Vue_Lignes_Commerce AS
SELECT DISTINCT l.ligne_id, l.nom AS ligne_nom, l.type AS ligne_type
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.id_ligne
JOIN ARRET a ON r.id_arret = a.arret_id
WHERE a.nom = 'Commerce';