--REQUETE 1 : Recuperer tout les vehicules de plus de 100 de capacité qui passe par l'arret Commerce + une selection
  --version 1 : utilisation de JOIN
EXPLAIN PLAN FOR SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
JOIN Reseaux r ON v.vehicule_id = r.vehicule_id
JOIN ARRET a ON r.arret_id = a.arret_id
WHERE a.arret_nom = 'Commerce'
AND v.capacite >= 100;
SELECT * FROM table(dbms_xplan.display);
  
  --version 2 : utilisation d'EXISTS
EXPLAIN PLAN FOR 
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
WHERE v.capacite >= 100
AND EXISTS (
    SELECT 1
    FROM RESEAUX r
    JOIN ARRET a ON r.arret_id = a.arret_id
    WHERE r.vehicule_id = v.vehicule_id
    AND a.arret_nom = 'Commerce'
);
SELECT * FROM table(dbms_xplan.display);

  --version 3 : utilisation d'une sous-requête avec IN
EXPLAIN PLAN FOR
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
WHERE v.capacite >= 100
AND v.vehicule_id IN (
    SELECT r.vehicule_id
    FROM Reseaux r, ARRET a
    WHERE r.arret_id = a.arret_id
    AND a.arret_nom = 'Commerce'
);
SELECT * FROM table(dbms_xplan.display);



--REQUETE 2 : Une requête pour trouver tous les véhicules électriques et leur capacité
  --version 1 : utilisation de ORDER BY
EXPLAIN PLAN FOR
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
WHERE v.carburant = 'electrique'
ORDER BY v.capacite DESC;
SELECT * FROM table(dbms_xplan.display);
  
  --version 2 : utilisation d'une sous-requête avec AS 
EXPLAIN PLAN FOR
WITH vehicules_electriques AS (
    SELECT * FROM VEHICULE
    WHERE carburant = 'electrique'
)
SELECT vehicule_id, vehicule_type, capacite, carburant
FROM vehicules_electriques
ORDER BY capacite DESC;
SELECT * FROM table(dbms_xplan.display);

  --version 3 : utilisation de ROW_NUMBER()
EXPLAIN PLAN FOR
SELECT vehicule_id, vehicule_type, capacite, carburant
FROM (
    SELECT vehicule_id, vehicule_type, capacite, carburant,
           ROW_NUMBER() OVER (ORDER BY capacite DESC) as rn
    FROM VEHICULE
    WHERE carburant = 'electrique'
) v
WHERE rn > 0;
SELECT * FROM table(dbms_xplan.display); 






--REQUETE 3 : Une requête pour compter le nombre de véhicules par type d'énergie
  --version 1 : utilisation de GROUP BY
EXPLAIN PLAN FOR
SELECT carburant, COUNT(*) as nombre_vehicules
FROM VEHICULE
GROUP BY carburant
ORDER BY nombre_vehicules DESC;
SELECT * FROM table(dbms_xplan.display);
  
  --version 2 : utilisation d'une sous-requête
EXPLAIN PLAN FOR
SELECT 
    carburant, 
    (SELECT COUNT(*) FROM VEHICULE v2 WHERE v2.carburant = v1.carburant) as nombre
FROM VEHICULE v1
GROUP BY carburant
ORDER BY nombre DESC;
SELECT * FROM table(dbms_xplan.display);

  --version 3 : utilisation de GROUP BY, HAVING COUNT et ORDER BY
EXPLAIN PLAN FOR
SELECT 
    carburant as type_carburant, 
    SUM(1) as nombre_vehicules
FROM VEHICULE
GROUP BY carburant
HAVING COUNT(*) > 0
ORDER BY nombre_vehicules DESC;
SELECT * FROM table(dbms_xplan.display);







--REQUETE 4 : Une requête pour lister toutes les lignes avec leurs arrêts et véhicules associés
  --version 1 : utilisation de JOIN
EXPLAIN PLAN FOR
SELECT l.ligne_id, l.ligne_nom, l.ligne_type, a.arret_nom, v.vehicule_type, v.carburant
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.ligne_id
JOIN ARRET a ON r.arret_id = a.arret_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
ORDER BY l.ligne_id;
SELECT * FROM table(dbms_xplan.display);

  --!version 2 : utilisation de AND dans le WHERE
  --! erreur que je ne comprend pas
EXPLAIN PLAN FOR
SELECT 
    ligne_id, 
    ligne_nom, 
    ligne_type, 
    arret_nom, 
    vehicule_type, 
    carburant
FROM LIGNE, RESEAUX, ARRET, VEHICULE
WHERE ligne_id = RESEAUX.ligne_id
AND arret_id = RESEAUX.arret_id
AND vehicule_id = RESEAUX.vehicule_id
ORDER BY ligne_id;
SELECT * FROM table(dbms_xplan.display);
  
  --version 3 : utilisation d'une sous requête et d'INNER JOIN
EXPLAIN PLAN FOR
SELECT l.ligne_id, l.ligne_nom, l.ligne_type, a.arret_nom, v.vehicule_type, v.carburant
FROM LIGNE l
LEFT JOIN RESEAUX r ON l.ligne_id = r.ligne_id
LEFT JOIN ARRET a ON r.arret_id = a.arret_id
LEFT JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
WHERE r.ligne_id IS NOT NULL
ORDER BY l.ligne_id, a.arret_nom;
SELECT * FROM table(dbms_xplan.display);





--REQUETE 5 : Une requête pour trouver les arrêts desservis par des véhicules fluviaux (Navibus)
  --version 1 : utilisation de JOIN
EXPLAIN PLAN FOR
SELECT DISTINCT a.arret_id, a.arret_nom
FROM ARRET a
JOIN RESEAUX r ON a.arret_id = r.arret_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
WHERE v.vehicule_type = 'Navibus'
ORDER BY a.arret_nom;
SELECT * FROM table(dbms_xplan.display);
  
  --version 2 : utilisation de AND dans le WHERE
  --!Erreur que je comprend pas
EXPLAIN PLAN FOR
SELECT DISTINCT a.arret_id, a.arret_nom
FROM ARRET, RESEAUX, VEHICULE
WHERE ARRET.arret_id = RESEAUX.arret_id
AND RESEAUX.vehicule_id = VEHICULE.vehicule_id
AND VEHICULE.vehicule_type = 'Navibus'
ORDER BY ARRET.arret_nom;
SELECT * FROM table(dbms_xplan.display);

  --version 3 : utilisation d'une sous requête et d'EXISTS
EXPLAIN PLAN FOR
SELECT DISTINCT a.arret_id, a.arret_nom
FROM ARRET a
WHERE EXISTS (
    SELECT 1 FROM RESEAUX r
    JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
    WHERE r.arret_id = a.arret_id AND v.vehicule_type = 'Navibus'
)
ORDER BY a.arret_nom;
SELECT * FROM table(dbms_xplan.display);
