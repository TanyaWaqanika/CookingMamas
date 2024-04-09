import mysql.connector

recipedb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Pa$$w0rd",
    database="repdb"
)

mycursor = recipedb.cursor()


mycursor.execute("SHOW TABLES")

for x in mycursor:
    print(x)