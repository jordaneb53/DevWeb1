--Obtenir la liste des 10 villes les plus peuplées en 2012

1:SELECT ville_nom,ville_population_2012 FROM `villes_france_free` ORDER BY `ville_population_2012`DESC LIMIT 10;

--Obtenir la liste des 50 villes ayant la plus faible superficie

2:SELECT ville_nom, ville_surface FROM `villes_france_free` ORDER BY ville_surface ASC LIMIT 50;

--Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”

3:SELECT ville_departement, ville_nom FROM `villes_france_free` WHERE ville_departement LIKE '97%';

--Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé

4:SELECT ville_nom,departement_nom FROM `villes_france_free` LEFT JOIN departement ON departement_code = ville_departement ORDER BY `ville_population_2012` DESC LIMIT 10;

4:SELECT ville_nom,departement_nom FROM `villes_france_free` departement WHERE departement_code = ville_departement ORDER BY `ville_population_2012` DESC LIMIT 10;

--Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes

5:SELECT ville_departement, departement_nom, COUNT(ville_commune) AS nb_communes,ville_code_commune FROM `villes_france_free` LEFT JOIN departement ON departement_code = ville_departement GROUP BY ville_departement ORDER BY nb_communes DESC;

--Obtenir la liste des 10 plus grands départements, en terme de superficie

6:SELECT departement_nom, ville_departement, SUM(`ville_surface`) AS dpt_surface FROM `villes_france_free` LEFT JOIN departement ON departement_code = ville_departement GROUP BY ville_departement ORDER BY dpt_surface DESC LIMIT 10;

--Compter le nombre de villes dont le nom commence par “Saint”

7:SELECT COUNT(*) AS 'nb-villes-saint' FROM `villes_france_free` WHERE `ville_nom` LIKE 'saint%';

--Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes

8:SELECT ville_nom, COUNT(*) AS nbt_item FROM `villes_france_free` GROUP BY `ville_nom` ORDER BY nbt_item DESC;

--Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne

9:SELECT ville_nom FROM `villes_france_free` WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `villes_france_free`);

--Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants

10:SELECT departement_nom, SUM(ville_population_2012) FROM villes_france_free LEFT JOIN departement ON departement_code = ville_departement GROUP BY ville_departement HAVING SUM(ville_population_2012) > 2000000;

--Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)

11:SELECT REPLACE (ville_nom,'-',' ') FROM villes_france_free WHERE ville_nom LIKE'SAINT-%';



















