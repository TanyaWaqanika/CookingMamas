import mysql.connector

# connects website to database, database is called repdb bc I had a split second of dyslexia and forgot how recipe is
# spelt smh


recipedb = mysql.connector.connect(
    host="localhost",
    user="root",
    # Windows password
    # password="Pa$$w0rd",
    # Mac password 
    password="",
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


# function to get all the dietaryType from the sql database so we can present on the front end
def get_dietary_types():
    cursor = recipedb.cursor()
    sql = "SELECT dietaryType from dietaryrequirement"
    cursor.execute(sql, )
    # Gets the first element of each row - means it doesn't show the ('') on the front end
    results = [row[0] for row in cursor.fetchall()]
    return results


def get_allergy_types():
    cursor = recipedb.cursor()
    sql = "SELECT allergyType from allergy"
    cursor.execute(sql, )
    results = [row[0] for row in cursor.fetchall()]
    return results


def get_tool_names():
    cursor = recipedb.cursor()
    sql = "SELECT toolName from tool"
    cursor.execute(sql, )
    results = [row[0] for row in cursor.fetchall()]
    return results


def get_ingredient_names():
    cursor = recipedb.cursor()
    sql = "SELECT ingredientName from ingredient"
    cursor.execute(sql, )
    results = [row[0] for row in cursor.fetchall()]
    return results


def get_unit_types():
    cursor = recipedb.cursor()
    sql = "SELECT unitName from unit"
    cursor.execute(sql, )
    results = [row[0] for row in cursor.fetchall()]
    return results


# def insert_recipe()
#     args = (,)
#     # flask interacting with mysql db
#     cursor = recipedb.cursor()
#     cursor.callproc('insert_recipe_v1', args)
