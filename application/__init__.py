from flask import Flask

app = Flask(__name__)
app.secret_key = 'doctor_who_is_a_key'
from application import routes
