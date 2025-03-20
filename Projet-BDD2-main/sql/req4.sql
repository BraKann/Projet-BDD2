--REQUETE 4 : Une requête pour lister toutes les lignes avec leurs arrêts et véhicules associés
  --version 1 : utilisation de JOIN
SELECT l.ligne_id, l.ligne_nom, l.ligne_type, a.arret_nom, v.vehicule_type, v.carburant
FROM LIGNE l
JOIN RESEAUX r ON l.ligne_id = r.ligne_id
JOIN ARRET a ON r.arret_id = a.arret_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
ORDER BY l.ligne_id;

  --!version 2 : utilisation de AND dans le WHERE
SELECT 
    l.ligne_id, 
    l.ligne_nom, 
    l.ligne_type, 
    a.arret_nom, 
    v.vehicule_type, 
    v.carburant
FROM LIGNE l, RESEAUX r, ARRET a, VEHICULE v
WHERE l.ligne_id = r.ligne_id
AND a.arret_id = r.arret_id
AND v.vehicule_id = r.vehicule_id
ORDER BY l.ligne_id;
  
--version 3 : utilisation d'une sous requête et d'INNER JOIN

SELECT l.ligne_id, l.ligne_nom, l.ligne_type, a.arret_nom, v.vehicule_type, v.carburant
FROM LIGNE l
LEFT JOIN RESEAUX r ON l.ligne_id = r.ligne_id
LEFT JOIN ARRET a ON r.arret_id = a.arret_id
LEFT JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
WHERE r.ligne_id IS NOT NULL
ORDER BY l.ligne_id, a.arret_nom;