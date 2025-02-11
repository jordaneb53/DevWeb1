

- **Modèle** : cette partie gère ce qu'on appelle la **logique métier** de votre site. Elle comprend notamment la gestion des données qui sont stockées, mais aussi tout le code qui prend des décisions autour de ces données. Son objectif est de fournir une interface d'action la plus simple possible au contrôleur. On y trouve donc entre autres des algorithmes complexes et des requêtes SQL.
    
- **Vue** : cette partie se concentre sur l'**affichage**. Elle ne fait presque aucun calcul et se contente de récupérer des variables pour savoir ce qu'elle doit afficher. On y trouve essentiellement du code HTML mais aussi quelques boucles et conditions PHP très simples, pour afficher par exemple une liste de messages.
    
- **Contrôleur** : cette partie gère les **échanges** avec l'utilisateur. C'est en quelque sorte l'intermédiaire entre l'utilisateur, le modèle et la vue. Le contrôleur va recevoir des requêtes de l'utilisateur. Pour chacune, il va demander au modèle d'effectuer certaines actions (lire des articles de blog depuis une base de données, supprimer un commentaire) et de lui renvoyer les résultats (la liste des articles, si la suppression est réussie). Puis il va _adapter_ ce résultat et le donner à la vue. Enfin, il va renvoyer la nouvelle page HTML, générée par la vue, à l'utilisateur.
    

La figure suivante schématise le rôle de chacun de ces éléments.

[![Le modèle accède à la base de données. La vue affiche la page. Le contrôleur s'occupe de la logique.](https://user.oc-static.com/upload/2022/05/09/16521046284748_P2C1-1%20%285%29.png)](https://user.oc-static.com/upload/2022/05/09/16521046284748_P2C1-1%20%285%29.png)

L'architecture MVC

Il est important de bien comprendre comment ces éléments s'agencent et communiquent entre eux. Regardez bien la figure suivante.

[![Le modèle et le contrôleur échange d'informations. Le contrôleur transmet des données à la vue.](https://user.oc-static.com/upload/2022/05/09/16521047098411_P2C1-2%20%282%29.png)](https://user.oc-static.com/upload/2022/05/09/16521047098411_P2C1-2%20%282%29.png)

Échange d'informations entre les éléments

Il faut tout d'abord retenir que **le contrôleur est le chef d'orchestre** : c'est lui qui reçoit la requête du visiteur et qui contacte d'autres fichiers (le modèle et la vue) pour leur demander des services.

Le fichier du contrôleur demande les données au modèle sans se soucier de la façon dont celui-ci va les récupérer. Par exemple : « Donne-moi la liste des 30 derniers messages du forum numéro 5 ». Le modèle traduit cette demande en une requête SQL, récupère les informations et les renvoie au contrôleur.

Une fois les données récupérées, le contrôleur les transmet à la vue qui se chargera d'afficher la liste des messages.

Vous pouvez retenir que le contrôleur sert presque uniquement à faire la jonction entre le modèle et la vue.

Concrètement, le visiteur demandera la page au contrôleur et c'est la vue qui lui sera retournée, comme schématisé sur la figure suivante. Bien entendu, tout cela est transparent pour lui, il ne voit pas tout ce qui se passe sur le serveur. C'est un schéma plus complexe que ce à quoi vous avez été habitués, bien évidemment : c'est pourtant sur ce type d'architecture que repose un grand nombre de sites professionnels !

[![La requête du client arrive au contrôleur et celui-ci lui retourne la vue.](https://user.oc-static.com/upload/2022/05/09/16521047600873_P2C1-3%20%281%29.png)](https://user.oc-static.com/upload/2022/05/09/16521047600873_P2C1-3%20%281%29.png)

Le client et l'architecture MVC

Voilà la théorie. Vous avez pu expérimenter la pratique dans les chapitres précédents où, pour notre exemple très simple du blog, nous avions 3 fichiers :

- `index.php`: le contrôleur (chef d'orchestre) ;
    
- `templates/homepage.php`: la vue (page HTML...) ;
    
- `src/model.php`: le modèle (requêtes SQL...).
    

C'est quand même pas mal plus compliqué, vous êtes sûr que ça vaut le coup ?

Pour l'instant, vous avez quand même vu que que ça vous permettait de travailler avec d'autres professionnels, et c'est déjà un énorme gain ! Cela dit, en travaillant tout seul ou avec d'autres développeurs, le gain ne semble pas très flagrant. Mais attendez que le projet se complexifie un peu et vous allez vite comprendre pourquoi nous avons besoin de cette structure.

### En résumé

- Les design patterns – ou patrons de conception – sont des méthodes de codage reconnues, qui permettent de résoudre des problèmes récurrents.
    
- MVC signifie “Modèle, Vue, Contrôleur”, c’est un patron de conception concernant l'agencement du code. Le code est segmenté selon ces trois sections : le modèle contient le code qui gère la logique métier, la vue celui qui gère l'affichage, et le contrôleur gère le lien avec l'utilisateur.