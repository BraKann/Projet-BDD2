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
    accessibilite VARCHAR(255),

    --PRIMARY KEY (line_id, station_id, vehicle_id)
    --CONSTRAINT pk_reseauxtan PRIMARY KEY(ligne_id,arret_id,vehicle_id)

    --DF : 
    -- ligne_id → ligne_nom, ligne_type;
    -- arret_id → arret_nom;
    -- line_id, arret_id → arret_nom;
    -- capacite -> vehicule_type; (mais changera si on met le model des vehicule)

    -- ligne_id, arret_id, vehicule_id → vehicule_type, capacite, carburant_type, accessibilite;
    -- ligne_id, vehicule_id → vehicule_type, capacite, carburant_type, accessibilite;
    -- arret_id, vehicule_id → vehicule_type, capacite, carburant_type, accessibilite;
    -- vehicule_id → vehicule_type, capacite, carburant_type, accessibilite;
    

    -- Potentielles améliorations pour ajout des attributs :
    -- kilometrage
    -- annee mise en service
    -- heure service de la ligne
    -- nombre de vehicule sur la ligne
    -- tranche de passage
    -- Les conducteurs / employés
    -- marque vehicule(change les vitesse et capacite)
    -- vitesse max et moyenne vehicule
    -- mode nocturne qui permet un arret hors des arret de base sur certaine ligne
);

spool off
