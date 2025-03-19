spool req1log.log

--REQUETE 1 : Recuperer tout les vehicules de plus de 100 de capacité qui passe par l'arret Commerce + une selection
  --version 1 : utilisation de JOIN
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
JOIN RESEAUX re ON v.vehicule_id = re.vehicule_id
JOIN ARRET a ON re.arret_id = a.arret_id
WHERE a.arret_nom = 'Commerce'
AND v.capacite >= 100;

  --version 2 : utilisation d'EXISTS
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
WHERE v.capacite >= 100
AND EXISTS (
    SELECT 1
    FROM RESEAUX re
    JOIN ARRET a ON re.arret_id = a.arret_id
    WHERE re.vehicule_id = v.vehicule_id
    AND a.arret_nom = 'Commerce'
);

  --version 3 : utilisation d'une sous-requête avec IN
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
WHERE v.capacite >= 100
AND v.vehicule_id IN (
    SELECT re.vehicule_id
    FROM Reseaux re, ARRET a
    WHERE re.arret_id = a.arret_id
    AND a.arret_nom = 'Commerce'
);

spool off