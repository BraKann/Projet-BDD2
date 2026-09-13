# Projet BDD2 - Modélisation et optimisation du réseau de transport nantais (TAN)

## Contexte

Projet réalisé dans le cadre du cours de Bases de Données 2 (Nantes Université).
Objectif : concevoir une base de données à partir d'une table unique non normalisée, la normaliser en 3FN/FNBC via deux algorithmes distincts, puis l'optimiser (indexes, clusters, vues) en comparant les performances des requêtes.

**Sujet choisi** : le réseau de transport en commun de Nantes (lignes, arrêts, véhicules).

## Technologies utilisées

- **SQL / Oracle** : DDL (tables, clés primaires/étrangères), DML, `CREATE CLUSTER`, `CREATE INDEX`, `CREATE VIEW`
- **EXPLAIN PLAN** : analyse du coût d'exécution (rows, bytes, %CPU, temps)
- **Database Design Tool** (uisacad5) : vérification externe des dépendances fonctionnelles, clés et couverture minimale

## Démarche

1. **Modélisation initiale** - une table unique (`ReseauTan`) réunissant tous les attributs, avec des tuples d'exemple pour faire émerger les dépendances fonctionnelles.
2. **Dépendances fonctionnelles** - identification des DF, en excluant volontairement celles qui trahissaient la réalité métier (ex. un nom d'arrêt n'est pas unique).
3. **Calcul des clés** - méthode LMR (Left/Middle/Right) pour déterminer les clés candidates.
4. **Couverture minimale** - simplification de l'ensemble des DF par split, suppression des redondances et des dépendances transitives.
5. **Normalisation** - deux algorithmes appliqués et comparés :
   - **Synthèse (Bernstein)** → 3FN, préserve les dépendances fonctionnelles
   - **Décomposition** → FNBC, élimine toute dépendance non désirable
6. **Choix du modèle final** - arbitrage motivé par les cas d'usage réels de la base (ex. la capacité d'un véhicule ne change jamais pour un type donné → une table séparée n'était pas justifiée).
7. **Requêtes et optimisation** - 5 requêtes métier, chacune écrite en 3 variantes SQL (jointures classiques, sous-requêtes, requêtes corrélées), comparées via `EXPLAIN PLAN`.
8. **Indexes, clusters, vues** - ajoutés sur les colonnes les plus sollicitées (nom d'arrêt, type de véhicule, capacité) et sur les jointures fréquentes.

## Compétences acquises

- **Modélisation de données** : passage d'un modèle plat à un schéma relationnel normalisé
- **Théorie des bases de données** : calcul de fermetures, clés candidates (LMR), couverture minimale, algorithmes de normalisation (Bernstein, décomposition BCNF)
- **Esprit critique sur la normalisation** : savoir écarter une DF techniquement valide mais incohérente avec le métier
- **SQL avancé** : écriture de requêtes équivalentes sous plusieurs formes (jointures, sous-requêtes, `EXISTS`, `IN`, `WITH`, fonctions de fenêtrage)
- **Optimisation de bases de données** : indexes, clusters, vues, et lecture de plans d'exécution (`EXPLAIN PLAN`)
- **Analyse de performance** : interprétation critique de métriques (rows, bytes, %CPU, temps) sans sur-interpréter sur un petit volume de données
- **Gestion de projet en équipe** : planification via diagramme de Gantt, répartition des rôles par référent d'étape

## Auteurs

CHIABERGE Christopher, ROULEAU Gwendoline, DIALLO Mamoudou
