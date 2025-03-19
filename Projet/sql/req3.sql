--REQUETE 3 : Une requête pour compter le nombre de véhicules par type d'énergie
  --version 1 : utilisation de GROUP BY
SELECT carburant, COUNT(*) as nombre_vehicules
FROM VEHICULE
GROUP BY carburant
ORDER BY nombre_vehicules DESC;
  
  --version 2 : utilisation d'une sous-requête
SELECT 
    carburant, 
    (SELECT COUNT(*) FROM VEHICULE v2 WHERE v2.carburant = v1.carburant) as nombre
FROM VEHICULE v1
GROUP BY carburant
ORDER BY nombre DESC;

  --version 3 : utilisation de GROUP BY, HAVING COUNT et ORDER BY
SELECT 
    carburant as type_carburant, 
    SUM(1) as nombre_vehicules
FROM VEHICULE
GROUP BY carburant
HAVING COUNT(*) > 0
ORDER BY nombre_vehicules DESC;