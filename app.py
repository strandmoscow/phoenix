import os
from flask import Flask, render_template, request
import psycopg2

app = Flask(__name__, instance_relative_config=True)

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


@app.route("/registration", methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        print("!!!")
        surname = request.form.get('inputSurname')
        name = request.form.get('inputName')
        email = request.form.get('inputEmail')
        print(surname)
        cur.execute("""SELECT version()""")
        s = cur.fetchall()
        print(s)
        return render_template('register.html')
    else:
        print("!!!1")
        return render_template('register.html')


@app.route("/sign_in")
def sign_in():
    return render_template('sign_in.html')


if __name__ == "__main__":
    try:
        app.run(host="127.0.0.1", port=8000, debug=True)
    except:
        print('unable to open port')
