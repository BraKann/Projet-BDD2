-- @tables_reseau_tan.sql

spool tables_reseau_tan.log

prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************

DROP TABLE RESEAUX CASCADE CONSTRAINTS;
DROP TABLE VEHICULE CASCADE CONSTRAINTS;
DROP TABLE LIGNE CASCADE CONSTRAINTS;
DROP TABLE ARRET CASCADE CONSTRAINTS;
                                        

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************

CREATE TABLE LIGNE (
    ligne_id NUMBER,
    ligne_nom VARCHAR(255),
    ligne_type VARCHAR(50),

    PRIMARY KEY (ligne_id)
    --CONSTRAINT pk_reseauxtan PRIMARY KEY(ligne_id,arret_id,vehicle_id)
);

CREATE TABLE VEHICULE (
    vehicule_id NUMBER,
    vehicule_type VARCHAR(50),
    capacite NUMBER,
    carburant VARCHAR(50),
    accessibilite VARCHAR(255),

    PRIMARY KEY (vehicule_id)
    --CONSTRAINT pk_reseauxtan PRIMARY KEY(ligne_id,arret_id,vehicle_id)
);

CREATE TABLE ARRET (
    arret_id NUMBER,
    arret_nom VARCHAR(255),

    PRIMARY KEY (arret_id)
    --CONSTRAINT pk_reseauxtan PRIMARY KEY(ligne_id,arret_id,vehicle_id)
);

CREATE TABLE RESEAUX (
    ligne_id NUMBER,
    arret_id NUMBER,
    vehicule_id NUMBER,

    PRIMARY KEY (ligne_id, arret_id, vehicule_id)
    --CONSTRAINT pk_reseauxtan PRIMARY KEY(ligne_id,arret_id,vehicle_id)
);

spool off
