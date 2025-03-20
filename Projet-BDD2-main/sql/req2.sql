--REQUETE 2 : Une requête pour trouver tous les véhicules électriques et leur capacité
  --version 1 : utilisation de ORDER BY
SELECT v.vehicule_id, v.vehicule_type, v.capacite, v.carburant
FROM VEHICULE v
WHERE v.carburant = 'electrique'
ORDER BY v.capacite DESC;
  
  --version 2 : utilisation d'une sous-requête avec AS 
WITH vehicules_electriques AS (
    SELECT * FROM VEHICULE
    WHERE carburant = 'electrique'
)
SELECT vehicule_id, vehicule_type, capacite, carburant
FROM vehicules_electriques
ORDER BY capacite DESC;

  --version 3 : en utilisant une jointure
SELECT vehicule_id, vehicule_type, capacite, carburant
FROM (
    SELECT vehicule_id, vehicule_type, capacite, carburant
    FROM Vehicules
    WHERE carburant = 'Électrique'
) AS v
ORDER BY v.capacite DESC;