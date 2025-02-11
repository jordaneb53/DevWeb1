
Modèle conceptuel de donnée : (MCD)
Méthode MERISE en FRANCE 
UML au luxembourg

exemple:
          
![[2025-01-07_16h33_40.png]]

les différentes relation  1:1    1:N(N:1)  N:N
la clef étrangère se place  toujours du coté du 1 au niveau de la cardinalité ,une clef étrangére sera toujours relié à une clef primaire

![[2025-01-07_16h44_28.png]]


DBeaver pour traité la base de donnée ( pour voir les lien entres chaque tables)



exemple schéma N:N   (Many To Many) traduit e anglais pour synphony

le resultat de la table 

![[Pasted image 20250108083716.png]]

**SQL : Cinéthèque**  
  
# Récupération de TOUS les films avec TOUTES leurs catégorie   
`==SELECT film.film_titre, GROUP_CONCAT(categorie.cat_nom) AS categories==`  
`==FROM film==`  
`LEFT JOIN film_categorie ON film_categorie.film_id = film.film_id`  
`==LEFT JOIN categorie ON categorie.cat_id = film_categorie.cat_id==`  
`==GROUP BY film.film_id==`  
`==ORDER BY film.film_titre;==`  
  
# Récupération de TOUS les films appartenant à la catégorie "Drame" avec TOUTES leurs catégories.  
`SELECT f1.film_titre, GROUP_CONCAT(c1.cat_nom) AS categories`  
`FROM film f1`  
`LEFT JOIN film_categorie fc1 ON fc1.film_id = f1.film_id`  
`LEFT JOIN categorie c1 ON c1.cat_id = fc1.cat_id`  
`WHERE EXISTS (`  
    `SELECT f2.film_id`  
    `FROM film f2`  
    `LEFT JOIN film_categorie fc2 ON fc2.film_id = f2.film_id`  
    `LEFT JOIN categorie c2 ON c2.cat_id = fc2.cat_id`  
    `WHERE c2.cat_nom = 'Drame' AND f2.film_id = f1.film_id`  
`)`    
`GROUP BY f1.film_id`  
`ORDER BY f1.film_titre;`


# Récupération du NOMBRES de films appartenant au 5  catégories:

`SELECT categorie.cat_nom, COUNT(film_categorie.film_id) AS nb_films`
`FROM categorie`
`LEFT JOIN film_categorie ON categorie.cat_id = film_categorie.cat_id`
`GROUP BY categorie.cat_nom;`

# Permet de recherché un film dans un intervalle en fonction de l'année

`SELECT *` 
`FROM film`
`WHERE film.film_annee >= 1995 And film.film_annee <=2005` 
`ORDER BY film_annee;`


# Trie du film le plus ancien 

`SELECT film_titre,film_annee`
`FROM film`
`WHERE film_annee is NOT Null`	
`ORDER BY film_annee` 
`LIMIT 1;`