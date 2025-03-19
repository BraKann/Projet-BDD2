--REQUETE 5 : Une requête pour trouver les arrêts desservis par des véhicules fluviaux (Navibus)
  --version 1 : utilisation de JOIN
SELECT DISTINCT a.arret_id, a.arret_nom
FROM ARRET a
JOIN RESEAUX r ON a.arret_id = r.arret_id
JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
WHERE v.vehicule_type = 'Navibus'
ORDER BY a.arret_nom;
  
  --version 2 : utilisation de AND dans le WHERE
  --!Erreur que je comprend pas
SELECT DISTINCT a.arret_id, a.arret_nom
FROM ARRET a, RESEAUX, VEHICULE
WHERE a.arret_id = RESEAUX.arret_id
AND RESEAUX.vehicule_id = VEHICULE.vehicule_id
AND VEHICULE.vehicule_type = 'Navibus'
ORDER BY a.arret_nom;

  --version 3 : utilisation d'une sous requête et d'EXISTS
SELECT DISTINCT a.arret_id, a.arret_nom
FROM ARRET a
WHERE EXISTS (
    SELECT 1 FROM RESEAUX r
    JOIN VEHICULE v ON r.vehicule_id = v.vehicule_id
    WHERE r.arret_id = a.arret_id AND v.vehicule_type = 'Navibus'
)
ORDER BY a.arret_nom;