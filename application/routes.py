from flask import render_template, url_for, request, redirect, session
from application.dataAccess import get_recipe_by_id, get_dietary_types, get_allergy_types, get_tool_names, \
    get_ingredient_names, get_unit_types, get_recipe_title, filter_by_dietary, get_random_recipes
from application import app


@app.route('/')
@app.route('/home')
def home():
    # veganFilter = filter_by_dietary("Vegan")

    return render_template('home.html', title='Home') # veganFilter=veganFilter)


@app.route('/recipe/<int:recipe_id>')
def recipe(recipe_id):
    recipes = get_recipe_by_id(recipe_id)
    randomrec = get_random_recipes()
    return render_template('recipe.html', recipe=recipes, randomrec=randomrec)


# TO DO Create the route that will help populate the options for the database form
# Also to submit the data to the database - stored procedure?
@app.route('/submitrecipe')
def submit_recipe():
    # uses the function in data access to get the list of dietary types and assigns to variable dietary type
    dietarytype = get_dietary_types()
    allergytype = get_allergy_types()
    toolname = get_tool_names()
    ingredientname = get_ingredient_names()
    unitname = get_unit_types()
    return render_template('submitRecipe.html', title='Recipe', dietarytype=dietarytype, allergytype=allergytype,
                           toolname=toolname, ingredientname=ingredientname, unitname=unitname)


@app.route('/allrecipes', methods=['GET', 'POST'])
def allrecipes():
    recipename = get_recipe_title()
    ingredientname = get_ingredient_names()
    dietarytype = get_dietary_types()
    if request.method == 'POST':
        request.form.getlist('glutenType')
        return filter_by_dietary("Gluten Free")
    return render_template('allrecipes.html', recipename=recipename, ingredientname=ingredientname, dietarytype=dietarytype)


@app.route('/submitsuccess')
def success_submit():
    return render_template('submitRecipeSuccess.html', title='Success')


@app.route('/recipe')
def recipe_landing():
    return render_template('recipeLanding.html')



