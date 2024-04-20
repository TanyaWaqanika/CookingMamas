from flask import render_template, url_for, request, redirect, session
from application.dataAccess import get_recipe_by_id, get_dietary_types, get_allergy_types, get_tool_names, \
    get_ingredient_names, get_unit_types, get_recipe_title, filter_by_dietary
from application import app


@app.route('/')
@app.route('/home')
def home():
    recipes = filter_by_dietary("Vegan")
    return render_template('home.html', title='Home',recipe=recipes)


@app.route('/welcome/<name>')
def welcome(name):
    return render_template('welcome.html', name=name, group='Everyone')


@app.route('/about/<name>')
@app.route('/about')
def about(name):
    return render_template('about.html', name=name.capitalize(), colour=['red', 'yellow', 'green'])


@app.route('/login', methods=['GET', 'POST'])
def login():
    # app.logger.debug("Start of login")
    if request.method == 'POST':
        session['username'] = request.form['username']
        # app.logger.debug("Username is: " + session['username'])
        session['loggedIn'] = True
        session['role'] = 'admin'
        return redirect(url_for('all_products'))
    return render_template('login.html', title="Login")


@app.route('/recipe/<int:recipe_id>')
def recipe(recipe_id):
    recipes = get_recipe_by_id(recipe_id)
    return render_template('recipe.html', recipe=recipes)


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


@app.route('/search')
def search():
    recipename = get_recipe_title()
    ingredientname = get_ingredient_names()
    # I removed recipedesc as get recipe title gets the description so not sure you needed it in a separate function?
    return render_template('search.html', recipename=recipename, ingredientname=ingredientname)


@app.route('/submitsuccess')
def success_submit():
    return render_template('submitRecipeSuccess.html', title='Success')


@app.route('/recipe')
def recipe_landing():
    return render_template('recipeLanding.html')
