-- vue pour récupérer les lignes complètes
CREATE VIEW Vue_Lignes_Completes AS
SELECT l.ligne_id, l.ligne_nom AS LigneNom, l.ligne_type AS Ltype, a.arret_nom AS ArretNom, v.vehicule_type AS Vtype
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.ligne_id
JOIN ARRET a ON r.arret_id = a.arret_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id;

--vue pour récuperer les lignes sur lesquelles circulent des bus
CREATE VIEW Vue_Lignes_Bus AS
SELECT DISTINCT l.ligne_id, l.ligne_nom AS ligneNom, l.ligne_type AS Ltype
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.ligne_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
WHERE v.vehicule_type = 'Bus';

--vue pour récuperer les lignes sur lesquelles circulent des tramway
CREATE VIEW Vue_Lignes_Tramway AS
SELECT DISTINCT l.ligne_id, l.ligne_nom AS ligneNom, l.ligne_type AS Ltype
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.ligne_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
WHERE v.vehicule_type = 'Tramway';

--vue pour récuperer les lignes qui passent par l'arrêt 'Commerce'
CREATE VIEW Vue_Lignes_Commerce AS
SELECT DISTINCT l.ligne_id, l.ligne_nom AS ligne_nom, l.ligne_type AS Ltype
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.ligne_id
JOIN ARRET a ON r.arret_id = a.arret_id
WHERE a.arret_nom = 'Commerce';
