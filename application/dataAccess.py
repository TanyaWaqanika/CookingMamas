import mysql.connector

# connects website to database, database is called repdb bc I had a split second of dyslexia and forgot how recipe is
# spelt smh


recipedb = mysql.connector.connect(
    host="localhost",
    user="root",
    # Windows password
    password="Pa$$w0rd",
    # Mac password 
    #password="",
    database="recipedb"
)

mycursor = recipedb.cursor()

#  Shows tables available in db in python terminal

def show_tables():
    mycursor = recipedb.cursor()
    mycursor.execute("SHOW TABLES")
    tables = [table[0] for table in mycursor.fetchall()]
    mycursor.close()
    return tables

def insert_sample_data():
    mycursor = recipedb.cursor()
    sql = "INSERT INTO cuisine (cuisine_Type) VALUES (%s)"
    val = [("Italian",)]
    mycursor.executemany(sql, val)
    recipedb.commit()
    print(mycursor.rowcount, "record inserted.")
    mycursor.close()
def get_recipe_by_id(recipe_id):
    # Connect to the database
    # recipedb = mysql.connector.connect(
    #     host="localhost",
    #     user="root",
    #     password="Pa$$w0rd",
    #     database="repdb"
    # )

    mycursor = recipedb.cursor(dictionary=True)

    # Query to fetch recipe details by ID
    sql = "SELECT recipeName, recipeDescription FROM recipe WHERE recipeId = %s"
    val = (recipe_id,)
    mycursor.execute(sql, val)

    # Fetch the recipe details
    recipe = mycursor.fetchone()

    # Close database connection
    mycursor.close()
    recipedb.close()

    return recipe