une table est un tableau avec des lignes et des colonnes 
une table correspond à une entité ,une collection d'objet 
id = la clef primary (identifie de manière unique )il faut quelle reste non modifiable 
une enregistrement = une ligne sur la base de donnée
2 logiciel de gestion de base de données  MySQL/MariaDB
SGBDR  Système de Gestion de Bases de Données Relationnelles
**SQL** (Structured Query Language)


![[Pasted image 20250107160509.png]]









L’utilisation basique de cette commande s’effectue de la manière suivante:

SELECT nom_du_champ FROM nom_du_tableau

Cette requête SQL va **sélectionner** (SELECT) le champ “nom_du_champ” **provenant** (FROM) du tableau appelé “nom_du_tableau”.
**Table “client” :**

|identifiant|prenom|nom|ville|
|---|---|---|---|
|1|Pierre|Dupond|Paris|
|2|Sabrina|Durand|Nantes|
|3|Julien|Martin|Lyon|
|4|David|Bernard|Marseille|
|5|Marie|Leroy|Grenoble|

Si l’ont veut avoir la liste de toutes les villes des clients, il suffit d’effectuer la requête SQL ci-dessous :

SELECT ville FROM client

De cette manière on obtient le résultat suivant :

|ville|
|---|
|Paris|
|Nantes|
|Lyon|
|Marseille|
|Grenoble|
Avec la même table client il est possible de lire plusieurs colonnes à la fois. Il suffit tout simplement de séparer les noms des champs souhaités par une virgule. Pour obtenir les **prénoms** et les **noms** des **clients** il faut alors faire la requête suivante:

SELECT prenom, nom FROM client

Ce qui retourne ce résultat:

|prenom|nom|
|---|---|
|Pierre|Dupond|
|Sabrina|Durand|
|Julien|Martin|
|David|Bernard|
|Marie|Leroy|
Il est possible de retourner automatiquement toutes les colonnes d’un tableau sans avoir à connaître le nom de toutes les colonnes. Au lieu de lister toutes les colonnes, il faut simplement utiliser le caractère “*” (étoile). C’est un joker qui permet de sélectionner toutes les colonnes. Il s’utilise de la manière suivante:

SELECT * FROM client

Cette requête SQL retourne exactement les mêmes colonnes qu’il y a dans la base de données. Dans notre cas, le résultat sera donc:

|identifiant|prenom|nom|ville|
|---|---|---|---|
|1|Pierre|Dupond|Paris|
|2|Sabrina|Durand|Nantes|
|3|Julien|Martin|Lyon|
|4|David|Bernard|Marseille|
|5|Marie|Leroy|Grenoble|
Avec LIKE en SQL  voici les moyens de retrouver "A%" commence par A "%A" termine à A "%A%" contient la lettre A.

La syntaxe pour utiliser cette fonction de statistique est simple :

SELECT AVG(nom_colonne) FROM nom_table