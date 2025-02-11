from pymongo import MongoClient
from faker import Faker
import mysql.connector
import os

fake = Faker(locale="fr_FR")

# Connect to MongoDB
mongo_client = MongoClient('mongodb://localhost:27017/')

# Connect to MySQL
mysql_client = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="test_db"
)

# Génération de 1000 000 000 000 de nom et prénom

for i in range(1000000000):
    
    
    first_name = fake.first_name()
    last_name = fake.last_name()
    
    # Insertion dans MongoDB
    mongo_db = mongo_client['test_db']
    mongo_collection = mongo_db['people']
    mongo_collection.insert_one({'first_name': first_name, 'last_name': last_name})
    
    # Insertion dans MySQL
    cursor = mysql_client.cursor()
    query = f"INSERT INTO people (first_name, last_name) VALUES ('{first_name}', '{last_name}')"
    cursor.execute(query)
    mysql_client.commit()
    
    print(f"{i}/1000000000")