-- Création d'index pour optimiser les requêtes
CREATE INDEX idx_arret_nom ON ARRET(nom); -- optimise recherce par nom d'arret 
CREATE INDEX idx_vehicule_type ON VEHICULE(type); -- optimise recherche par type de vehicule
CREATE INDEX idx_vehicule_capacite ON VEHICULE(capacite); -- optimise recherche par capacite
CREATE INDEX idx_reseaux_composite ON RESEAUX(id_ligne, id_arret, id_vehicule); -- optimise jointure, recherche arret sur une ligne et véhicule sur une ligne
