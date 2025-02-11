
# Concevoir un programme de gestion de tâches en Python et MongoDB.

#Le programme doit proposer le menu suivant :
#Afficher les tâches
#Ajouter une tâche
#Compléter une tâche (la marquer comme terminée avec la date du jour)
#Supprimer une tâche
#Mettre à jour une tâche

from pymongo import MongoClient
from datetime import datetime

class GestionTaches:
    def __init__(self, db_name="todolist", collection_name="taches"):
        self.client = MongoClient("mongodb://localhost:27017/")
        self.db = self.client[db_name]
        self.collection = self.db[collection_name]

#Listes des taches
    def afficher_taches(self):
        taches = self.collection.find()
        for tache in taches:
            date_terminee = tache.get('date_terminée')
            if tache['statut'] == "terminé" and date_terminee is None:
                date_terminee = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                self.collection.update_one({"titre": tache['titre']}, {"$set": {"date_terminée": date_terminee}})
            print(f"{tache['titre']} - {tache['statut']} ({date_terminee if date_terminee else 'Non terminée'})")

#Premet d'ajouter une taches
    def ajouter_tache(self, titre):
        tache = {"titre": titre, "statut": "à faire", "date_terminée": None}
        self.collection.insert_one(tache)
        print("Tâche ajoutée.")

#Permet de completer une tache
    def completer_tache(self, titre):
        date_heure_actuelle = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        self.collection.update_one({"titre": titre}, {"$set": {"statut": "terminé", "date_terminée": date_heure_actuelle}})
        print("Tâche complétée.") 

#Permet de supprimer une tache
    def supprimer_tache(self, titre):
        self.collection.delete_one({"titre": titre})
        print("Tâche supprimée.")

#Permet de mettre a jour une tache
    def mettre_a_jour_tache(self, titre, nouveau_titre):
        self.collection.update_one({"titre": titre}, {"$set": {"titre": nouveau_titre}})
        print("Tâche mise à jour.")

if __name__ == "__main__":
    gestionnaire = GestionTaches()
    while True:
        print("\n1. Afficher les tâches\n2. Ajouter une tâche\n3. Compléter une tâche\n4. Supprimer une tâche\n5. Mettre à jour une tâche\n6. Quitter")
        choix = input("Choisissez une option: \n")
        
        if choix == "1":
            gestionnaire.afficher_taches()
        elif choix == "2":
            titre = input("Titre de la tâche: ")
            gestionnaire.ajouter_tache(titre)
        elif choix == "3":
            titre = input("Titre de la tâche à compléter: ")
            gestionnaire.completer_tache(titre)
        elif choix == "4":
            titre = input("Titre de la tâche à supprimer: ")
            gestionnaire.supprimer_tache(titre)
        elif choix == "5":
            titre = input("Titre de la tâche à mettre à jour: ")
            nouveau_titre = input("Nouveau titre: ")
            gestionnaire.mettre_a_jour_tache(titre, nouveau_titre)
        elif choix == "6":
            break
        else:
            print("Option invalide, veuillez réessayer.")
