import os
from flask import Flask, render_template, request, session, Blueprint
import psycopg2
from scenario_registration.blueprint_registration import registration

app = Flask(__name__, instance_relative_config=True)

app.register_blueprint(registration, url_prefix='/registration')

UPLOAD_FOLDER = os.path.join('statics')
app.config.from_mapping(
    SECRET_KEY='dev',
    UPLOAD_FOLDER=UPLOAD_FOLDER
)

try:
    conn = psycopg2.connect("dbname='Phoenix' user='net_user' host='80.211.80.219' password='net_user_password'")
    cur = conn.cursor()
except:
    print("I am unable to connect to the database")


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/sign_in")
def sign_in():
    return render_template('sign_in.html')


if __name__ == "__main__":
    try:
        app.run(host="127.0.0.1", port=8000, debug=True)
    except:
        print('unable to open port')
