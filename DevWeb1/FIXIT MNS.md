

Architecture recommandé du Model-Vue-Controler


### **1. Modèle (Model)**

C'est la couche qui gère les données et la logique métier. Tu vas définir les classes et les interactions avec la base de données.

📌 **Exemples de modèles :**

- **Utilisateur** (id, nom, email, rôle)
- **Technicien** (id, nom, spécialité, horaires)
- **Client** (id, nom, numéro de téléphone, email)
- **Rendez-vous** (id, client_id, véhicule, technicien_id, date, durée, statut)
- **Véhicule** (id, plaque, marque, modèle, année, propriétaire_id)
- **GarageSolidaireReservation** (id, client_id, créneau, durée)

🛠 **Outils possibles** :

- Base de données : **MySQL, localhost


---

### **2. Vue (View)**

C'est l’interface utilisateur où les clients et techniciens interagissent avec l'application.

📌 **Exemples de pages :**

- **Page d'accueil** : Présentation du garage, catalogue des véhicules d'occasion
- **Espace client** : Prise de rendez-vous, historique des réparations
- **Espace technicien** : Planning des réparations, alertes sur les RDV à venir
- **Espace administrateur** : Gestion des techniciens, clients, statistiques

🛠 **Outils possibles** :

- **HTML/CSS/JavaScript**


---

### **3. Contrôleur (Controller)**

C'est la couche intermédiaire qui gère les requêtes, traite les données et envoie les réponses aux vues.

📌 **Exemples de contrôleurs :**

- **AuthController** : Gestion des connexions, inscriptions
- **RendezVousController** : Création, modification et suppression des rendez-vous
- **TechnicienController** : Gestion des techniciens, calcul du temps de travail
- **GarageSolidaireController** : Gestion des réservations

🛠 **Outils possibles** :

- **Frameworks backend : Laravel (PHP), Symfony (PHP), Express.js (Node.js), Django (Python), Spring Boot (Java)**


==**ci joint l'arboréscence du projet /Bash**==

/garage-app/
│── /public/            # Contient les fichiers accessibles au public (CSS, JS, images) *Interface utilisateur*
│── /views/             # Contient les fichiers HTML (templates)
│── /models/            # Contient les fichiers pour gérer la base de données
│── /controllers/       # Contient les fichiers pour la logique métier*fonction métier
│── /config/            # Contient la configuration de la base de données *requet SQL*
│── /assets/            # CSS, JS, images
│── index.php           # Point d’entrée principal
│── router.php          # Gère les routes et redirections
│── .htaccess           # Configuration Apache (URL rewriting)
ou alors passer en nginx.conf   pour un serveur Nginx