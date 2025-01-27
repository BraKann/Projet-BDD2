-- @tables_reseau_tan.sql

spool tables_reseau_tan.log

prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************

DROP TABLE RESEAUTAN CASCADE CONSTRAINTS;

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************

CREATE TABLE RESEAUTAN (
    ligne_id NUMBER,
    ligne_nom VARCHAR(255),
    ligne_type VARCHAR(50),
    arret_id NUMBER,
    arret_nom VARCHAR(255),
    vehicule_id NUMBER,
    vehicule_type VARCHAR(50),
    capacite NUMBER,
    carburant_type VARCHAR(50),
    accessibilité_fonctionnalite VARCHAR(255),

    --PRIMARY KEY (line_id, station_id, vehicle_id)
    --CONSTRAINT pk_reseauxtan PRIMARY KEY(ligne_id,arret_id,vehicle_id)

    --DF : line_id → line_name, line_type
    -- station_id → station_name
    -- vehicle_id → vehicle_type, capacity, energy_type, accessibility_features
    -- line_id, station_id → station_name
    -- line_id, vehicle_id → vehicle_type, capacity, energy_type, accessibility_features
    -- fonctionne avec nimporte quel couple ou triple de id
    -- capacite -> vehicule_type (mais changera si on met le model des vehicule)

    --kilometrage
    --annee mise en service
    --heure service de la ligne
    --nombre de vehicule sur la ligne
    --tranche de passage
    --Les conducteurs / employés
    --marque vehicule(change les vitesse et capacite)
    --vitesse max et moyenne vehicule
    --mode nocturne qui permet un arret hors des arret de base sur certaine ligne
);

spool off