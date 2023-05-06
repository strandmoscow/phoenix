import os
from flask import Flask, render_template, request, session, Blueprint, url_for
import psycopg2
from scenario_registration.blueprint_registration import registration
from scenario_registration.blueprint_account import account

app = Flask(__name__, instance_relative_config=True)

app.register_blueprint(registration, url_prefix='/registration')
app.register_blueprint(account, url_prefix='/account')

UPLOAD_FOLDER = os.path.join('statics')
app.config.from_mapping(
    SECRET_KEY='dev',
    UPLOAD_FOLDER=UPLOAD_FOLDER
)

try:
    conn = psycopg2.connect("dbname='Phoenix' user='postgres' host='70.34.250.137' password='p_admin_p'")
    cur = conn.cursor()
except:
    print("I am unable to connect to the database")


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/sign_in")
def sign_in():
    return render_template('sign_in.html')

@app.route("/students")
def students():
    return render_template('students.html')


# @app.route("/account")
# def account():
#     profile_icon = './static/svg/abstract-user-flat-4.svg'
#     return render_template('account.html', img=profile_icon)


if __name__ == "__main__":
    try:
        app.run(host="127.0.0.1", port=8000, debug=True)
    except:
        print('unable to open port')
