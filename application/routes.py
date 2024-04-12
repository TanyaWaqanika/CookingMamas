from flask import render_template, url_for, request, redirect, session

from application import app


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


from application.dataAccess import get_recipe_by_id

@app.route('/recipe/<int:recipe_id>')
def recipe(recipe_id):
    recipe = get_recipe_by_id(recipe_id)
    return render_template('recipe.html', recipe=recipe)