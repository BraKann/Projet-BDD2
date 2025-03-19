-- Création de clusters pour optimiser les performances
CREATE CLUSTER Cluster_Lignes (ligne_id NUMBER); -- organise les données par id_ligne
CREATE INDEX idx_cluster_lignes ON CLUSTER Cluster_Lignes; -- on créer un index sur le cluster pour augmenter la performance des recherches

CREATE CLUSTER Cluster_Reseaux (ligne_id NUMBER, arret_id NUMBER, vehicule_id NUMBER); -- regroupe les colonnes de la table Reseaux pour optimiser les jointures fréquemment faites avec cette table
CREATE INDEX idx_cluster_reseaux ON CLUSTER Cluster_Reseaux; -- on créer un index sur le cluster pour augmenter la performance des recherches
