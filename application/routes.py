from flask import render_template, url_for, request, redirect, session
from application.dataAccess import get_recipe_by_id, get_dietary_types, get_allergy_types, get_tool_names, \
    get_ingredient_names, get_unit_types, get_recipe_title, get_cuisine_types, get_duration
from application import app
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Pa$$w0rd",  # use for windows
    # password="",  # use for mac
    database="recipedb"
)

cursor = db.cursor()

@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html', title='Home')


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
@app.template_filter('format_timedelta')
def format_timedelta_filter(value):
    if value is None:
        return ''  # Or any other default value you prefer

    hours, remainder = divmod(value.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    return '{:02}:{:02}:{:02}'.format(hours, minutes, seconds)


@app.route('/submitrecipepage1', methods=['GET','POST'])
def submitrecipepage1():
    # uses the function in data access to get the list of dietary types and assigns to variable dietary type
    cuisinetype = get_cuisine_types()
    durationdata = get_duration()
    if request.method == 'POST':
        # Get data from page 1 form and store in session
        recipename = request.form['recipeName']
        recipedescription = request.form['recipeDescription']
        cuisinetype = ','.join(request.form.getlist('cuisine'))  # Convert list to comma-separated string
        preptime = request.form['prepTime']
        cooktime = request.form['cookTime']
        servingsize = request.form['serving']
        print(type(preptime))
        print(recipename, recipedescription, cuisinetype, preptime, cooktime, servingsize)
        args= (recipename,recipedescription,cuisinetype, preptime, cooktime, servingsize)
        print(args)
        try:
            cursor.callproc('insert_recipe_v1', args)
            db.commit()  # If autocommit is disabled

        # cursor.callproc('insert_recipe_v1', args)
        except mysql.connector.Error as err:
            print("Error calling stored procedure: {}".format(err))
        return redirect(url_for('submitrecipepage2'))
    return render_template('submitRecipepage1.html', title='Recipe', cuisinetype = cuisinetype, durationdata = durationdata)


# the sessions are meant to save the data submitted on the form page so that when we get to the end of the form we can then take that data and use it
@app.route('/submitrecipepage2', methods=['GET', 'POST'])
def submitrecipepage2():
    # uses the function in data access to get the list of dietary types and assigns to variable dietary type
    dietarytype = get_dietary_types()
    allergytype = get_allergy_types()
    toolname = get_tool_names()
    if request.method == 'POST':
        dietarytype = ','.join(request.form.getlist('dietary'))
        allergytype = ','.join(request.form.getlist('allergy'))
        toolname = ','.join(request.form.getlist('tool'))  # Convert list to comma-separated string
        print(dietarytype, allergytype, toolname)
        cursor.callproc('insert_dietary_v1', (dietarytype,))
        db.commit()  # If autocommit is disabled
        cursor.callproc('insert_allergy_v1', (allergytype,))
        db.commit()  # If autocommit is disabled
        cursor.callproc('insert_tool_v1', (toolname,))
        db.commit()  # If autocommit is disabled
        return redirect(url_for('submitrecipepage3'))
    return render_template('submitRecipepage2.html', title='Recipe', dietarytype=dietarytype, allergytype=allergytype,
                           toolname=toolname)


# page 3 for ingredients
# not currently displaying the ingredients once supposedly added
# got myself all confused by the sessions so between 3 and add recipe needs more thought
@app.route('/submitrecipepage3', methods=['GET', 'POST'])
def submitrecipepage3():
    ingredientname = get_ingredient_names()
    unitname = get_unit_types()
    if request.method == 'POST':
        ingredientnameone = request.form['ingredientname']
        quantityone = request.form['quantity']
        unitnameone = request.form['unitname']
        args = (ingredientnameone,quantityone,unitnameone)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled
        
        ingredientnametwo = request.form['ingredientname2']
        quantitytwo = request.form['quantity2']
        unitnametwo = request.form['unitname2']
        args = (ingredientnametwo, quantitytwo, unitnametwo)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnamethree = request.form['ingredientname3']
        quantitythree = request.form['quantity3']
        unitnamethree = request.form['unitname3']
        args = (ingredientnamethree, quantitythree, unitnamethree)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled
        
        ingredientnamefour = request.form['ingredientname4']
        quantityfour = request.form['quantity4']
        unitnamefour = request.form['unitname4']
        args = (ingredientnamefour, quantityfour, unitnamefour)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnamefive = request.form['ingredientname5']
        quantityfive = request.form['quantity5']
        unitnamefive = request.form['unitname5']
        args = (ingredientnamefive, quantityfive, unitnamefive)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnamesix = request.form['ingredientname6']
        quantitysix = request.form['quantity6']
        unitnamesix = request.form['unitname6']
        args = (ingredientnamesix, quantitysix, unitnamesix)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnameseven = request.form['ingredientname7']
        quantityseven = request.form['quantity7']
        unitnameseven = request.form['unitname7']
        args = (ingredientnameseven, quantityseven, unitnameseven)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnameeight = request.form['ingredientname8']
        quantityeight = request.form['quantity8']
        unitnameeight = request.form['unitname8']
        args = (ingredientnameeight, quantityeight, unitnameeight)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnamenine = request.form['ingredientname9']
        quantitynine = request.form['quantity9']
        unitnamenine = request.form['unitname9']
        args = (ingredientnamenine, quantitynine, unitnamenine)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled

        ingredientnameten = request.form['ingredientname10']
        quantityten = request.form['quantity10']
        unitnameten = request.form['unitname10']
        args = (ingredientnameten, quantityten, unitnameten)
        print(args)
        cursor.callproc('insert_ingredients_v1', args)
        db.commit()  # If autocommit is disabled
        # print(ingredientname, quantity, unitname )
        return redirect(url_for('submitrecipepage4'))
    return render_template('submitRecipepage3.html', title='Recipe', ingredientname=ingredientname, unitname=unitname)


# page 4 for steps
@app.route('/submitrecipepage4', methods=['GET', 'POST'])
def submitrecipepage4():
    # uses the function in data access to get the list of dietary types and assigns to variable dietary type
    if request.method == 'POST':
        stepnumber = request.form['stepnumber']
        stepdescription = request.form['stepdescription']
        args = (stepnumber, stepdescription)
        # Call the stored procedure for each step number and description pair
        cursor.callproc('insert_steps_v1', args)
        db.commit()
        # Get data from page 2 form and store in session
        # for key in request.form:
        #     # was expecting that for each row it would increment so row_1, row_2 etc but not currently happening
        #     print(f"this is the key {key}")
        #     # print(request.form['row_2_stepnumber'])
        #     # Check if the key ends with stepnumber to identify the dynamically added rows
        #     # if key.startswith('row_'):
        #     #     # Extract the step number and description from the form data
        #     #     # for some reason yet for me to understand the javascript id's - the key takes you to the step number
        #     #     step_number = request.form[key]
        #     #     # the key for the description doesnt have the description in it's title
        #     #     step_description_key = request.form[key]
        #     #     print(f"step number {step_number}, step desc {step_description_key}")
        #     #     print(f"stepkey {step_description_key}")
        #     #     step_description = request.form[step_description_key]
        #     #     print(f"this is something {step_description}")
        #     #     args = (step_number, step_description)
        #     #     print(f"this is the arguments {args}")
        #     #     # Call the stored procedure for each step number and description pair
        #     #     cursor.callproc('insert_steps_v1', args)
        #     #     db.commit()
        #     if key.endswith('_stepnumber'):
        #         # Extract the step number and description from the form data
        #         step_number = request.form[key]
        #         # Generate the corresponding key for the step description
        #         step_description_key = key.replace('_stepnumber', '_stepdescription')
        #         # Get the step description from the form data using the generated key
        #         step_description = request.form[step_description_key]
        #         # Process the step number and description as needed
        #         print(f"Step Number: {step_number}, Step Description: {step_description}")
        #         cursor.callproc('insert_steps_v1', step_number, step_description)
        #         db.commit()
        num_rows = int(request.form.get('num_rows', 0))

        # Iterate over each row and process step number and description
        for i in range(1, num_rows + 1):
            step_number_key = f'row_{i}_stepnumber'
            step_description_key = f'row_{i}_stepdescription'

            # Extract step number and description from the form data
            step_number = request.form.get(step_number_key)
            step_description = request.form.get(step_description_key)
            print(step_number, step_description)
            # Call the stored procedure with the step number and description
            args = (step_number, step_description)
            cursor.callproc('insert_steps_v1', args)
            db.commit()
        return redirect(url_for('successsubmit'))
    return render_template('submitRecipepage4.html', title='Recipe')

@app.route('/submitsuccess')
def successsubmit():
    return render_template('submitRecipeSuccess.html', title='Success')


@app.route('/search')
def search():
    recipename = get_recipe_title()
    # recipedesc = get_recipe_desc()
    ingredientname = get_ingredient_names()
    # I removed recipedesc as get recipe title gets the description so not sure you needed it in a separate function?
    # return render_template('search.html', recipename=recipename, recipedesc=recipedesc, ingredientname=ingredientname)
    return render_template('search.html', recipename=recipename, ingredientname=ingredientname)


@app.route('/submitsuccess')
def success_submit():
    return render_template('submitRecipeSuccess.html', title='Success')

@app.route('/recipe')
def recipe_landing():
    return render_template('recipeLanding.html')


