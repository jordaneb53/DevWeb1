Obtenir l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
SELECT * 
FROM `client` 
WHERE `prenom` = 'Muriel'
AND `password` = SHA1("test11");

Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.
SELECT nom, COUNT(*) AS nb_produits 
FROM `commande_ligne` 
GROUP BY nom 
HAVING nb_produits > 1
ORDER BY nb_produits DESC;

Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes et y ajouter une colonne qui liste les identifiants des commandes associées.
SELECT nom, COUNT(*) AS nb_produits , GROUP_CONCAT(`commande_id`) AS liste_commandes
FROM `commande_ligne` 
GROUP BY nom 
HAVING nb_produits > 1
ORDER BY nb_produits DESC;

Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité
UPDATE `commande_ligne` 
SET  `prix_total` = (`quantite` * `prix_unitaire`);

Obtenir le montant total pour chaque commande et y voir facilement la date associée à cette commande ainsi que le prénom et nom du client associé
SELECT client.prenom, client.nom, commande.date_achat, commande_id, SUM(prix_total)  
FROM `commande_ligne` 
LEFT JOIN commande ON commande.id = commande_ligne.commande_id
LEFT JOIN client ON client.id = commande.client_id
GROUP BY `commande_id`;

(difficulté très haute) Enregistrer le montant total de chaque commande dans le champ intitulé “cache_prix_total”
UPDATE commande AS table_1 
INNER JOIN 
    ( SELECT commande_id, SUM(commande_ligne.prix_total) AS prix_total 
      FROM commande_ligne 
      GROUP BY commande_id ) table_2 
          ON  table_1.id = table_2.commande_id 
SET table_1.cache_prix_total = table_2.prix_total;

Obtenir le montant global de toutes les commandes, pour chaque mois
SELECT YEAR(date_achat) AS annee,MONTH(date_achat) AS mois,ROUND(SUM(cache_prix_total)) AS montant_global
FROM commande
GROUP BY annee, mois
ORDER BY annee, mois;

Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, et obtenir ce montant total pour chaque client.
SELECT client.nom, client.prenom, ROUND(SUM(commande.cache_prix_total)) AS montant_commande_total
FROM `commande` 
LEFT JOIN client ON client.id = commande.client_id
GROUP BY commande.client_id
ORDER BY montant_commande_total DESC
LIMIT 10;

Obtenir le montant total des commandes pour chaque date
SELECT `date_achat`, ROUND(SUM(`cache_prix_total`)) AS montant_total_commande
FROM `commande` 
GROUP BY `date_achat`;

Ajouter une colonne intitulée “category” à la table contenant les commandes. Cette colonne contiendra une valeur numérique
ALTER TABLE `commande` 
ADD `category` INT UNSIGNED NOT NULL 
AFTER `cache_prix_total`;

Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
“1” pour les commandes de moins de 200€
“2” pour les commandes entre 200€ et 500€
“3” pour les commandes entre 500€ et 1.000€
“4” pour les commandes supérieures à 1.000€

UPDATE `commande` 
SET `category` = (
  CASE 
     WHEN cache_prix_total<200 THEN 1
     WHEN cache_prix_total<500 THEN 2
     WHEN cache_prix_total<1000 THEN 3
     ELSE 4
  END );

Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
CREATE TABLE `commande_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée
INSERT INTO `commande_category` (`id`, `nom`) VALUES (1, 'commandes de moins de 200€');
INSERT INTO `commande_category` (`id`, `nom`) VALUES (2, 'commandes entre 200€ et 500€');
INSERT INTO `commande_category` (`id`, `nom`) VALUES (3, 'commandes entre 500€ et 1.000€');
INSERT INTO `commande_category` (`id`, `nom`) VALUES (4, 'commandes supérieures à 1.000€');

Supprimer toutes les commandes (et les lignes des commandes) inférieur au 1er février 2019. Cela doit être effectué en 2 requêtes maximum
DELETE FROM `commande_ligne` 
WHERE `commande_id` IN ( SELECT id FROM commande WHERE date_achat < '2019-02-01' );
DELETE FROM `commande` WHERE date_achat < '2019-02-01';