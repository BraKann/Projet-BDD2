-- Création d'index pour optimiser les requêtes
CREATE INDEX idx_arret_nom ON ARRET(arret_nom); -- optimise recherce par nom d'arret 
CREATE INDEX idx_vehicule_type ON VEHICULE(vehicule_type); -- optimise recherche par type de vehicule
CREATE INDEX idx_vehicule_capacite ON VEHICULE(capacite); -- optimise recherche par capacite
CREATE INDEX idx_reseaux_composite ON RESEAUX(ligne_id, arret_id, vehicule_id); -- optimise jointure, recherche arret sur une ligne et véhicule sur une ligne
