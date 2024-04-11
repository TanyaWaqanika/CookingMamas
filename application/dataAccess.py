import mysql.connector

# connects website to database, database is called repdb bc I had a split second of dyslexia and forgot how recipe is
# spelt smh


recipedb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Pa$$w0rd",
    database="repdb"
)

mycursor = recipedb.cursor()

#  Shows tables available in db in python terminal

mycursor.execute("SHOW TABLES")

for x in mycursor:
    print(x)

#  Insert sample data from python

sql = "INSERT INTO cuisine (cuisine_Type) VALUES (%s)"

# content in val must be in DICT
val = [("Italian")]
mycursor.execute(sql, val)

recipedb.commit()

print(mycursor.rowcount, "record inserted.")
