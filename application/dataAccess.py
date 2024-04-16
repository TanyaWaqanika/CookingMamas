import mysql.connector

# connects website to database, database is called repdb bc I had a split second of dyslexia and forgot how recipe is
# spelt smh


recipedb = mysql.connector.connect(
    host="localhost",
    user="root",
    # Windows password
    password="Pa$$w0rd",
    # Mac password 
    # password="",
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
    mycursor = recipedb.cursor(dictionary=True)

    # Query to fetch recipe details by ID
    sql = """SELECT recipe.recipeName, recipe.recipeDescription, recipe.servingSize,
    cuisine.cuisine_type, tool.toolName, 
    image.imageSource, duration.overallDuration, duration.prepTime, duration.cookTime 
    FROM recipe 
    JOIN cuisine ON recipe.cuisineID = cuisine.cuisineID 
    LEFT JOIN recipetoolrequirement ON recipe.recipeID = recipetoolrequirement.recipeID 
    LEFT JOIN tool ON recipetoolrequirement.toolID = tool.toolID 
    LEFT JOIN image ON recipe.recipeID = image.recipeID 
    LEFT JOIN duration ON recipe.durationID = duration.durationID
    WHERE recipe.recipeId = %s"""
    val = (recipe_id,)
    mycursor.execute(sql, val)

    # Fetch the recipe details
    recipe = mycursor.fetchone()

    # Query to fetch steps for the recipe
    steps_sql = """
       SELECT stepNumber, stepDescription
       FROM recipestep
       WHERE recipeID = %s
       ORDER BY stepNumber
       """
    mycursor.execute(steps_sql, val)

    # Fetch the steps for the recipe
    steps = mycursor.fetchall()

    # Add steps to the recipe dictionary
    recipe['steps'] = steps

    # Query to fetch ingredients, quantity, and units for the recipe
    ingredients_sql = """
    SELECT ingredient.ingredientName, recipeingredientamount.quantity, unit.unitName
    FROM recipeingredientamount
    JOIN ingredient ON recipeingredientamount.ingredientID = ingredient.ingredientID
    JOIN unit ON recipeingredientamount.unitID = unit.unitID
    WHERE recipeingredientamount.recipeID = %s
    """
    mycursor.execute(ingredients_sql, val)

    # Fetch all ingredients with quantities and units
    ingredients = mycursor.fetchall()

    # Add ingredients to the recipe dictionary
    recipe['ingredients'] = ingredients

    # Close database connection
    mycursor.close()

    return recipe


def get_recipe_title():
    cursor = recipedb.cursor()
    sql = "SELECT recipeName from recipe"
    cursor.execute(sql)
    recipe_titles = [row[0] for row in cursor.fetchall()]
    cursor.close()  # Close the cursor
    return recipe_titles


def get_recipe_desc():
    cursor = recipedb.cursor()
    sql = "SELECT recipeDescription from recipe"
    cursor.execute(sql)
    recipe_desc = [row[0] for row in cursor.fetchall()]
    cursor.close()  # Close the cursor
    return recipe_desc


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

def get_cuisine_types():
    cursor = recipedb.cursor()
    sql = "SELECT cuisine_type from cuisine"
    cursor.execute(sql, )
    # Gets the first element of each row - means it doesn't show the ('') on the front end
    results = [row[0] for row in cursor.fetchall()]
    return results

# def get_duration():
#     cursor = recipedb.cursor()
#     sql = "SELECT prepTime, cookTime from duration"
#     cursor.execute(sql, )
#     # Gets the first element of each row - means it doesn't show the ('') on the front end
# 
#     results = cursor.fetchall()
#     return results
# 
# print(get_duration())


# def insert_recipe()
#     args = (,)
#     # flask interacting with mysql db
#     cursor = recipedb.cursor()
#     cursor.callproc('insert_recipe_v1', args)
