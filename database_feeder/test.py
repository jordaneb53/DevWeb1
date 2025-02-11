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

