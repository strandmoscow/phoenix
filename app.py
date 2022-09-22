import os
from flask import Flask, render_template

app = Flask(__name__, instance_relative_config=True)

UPLOAD_FOLDER = os.path.join('statics')
app.config.from_mapping(
    SECRET_KEY='dev',
    UPLOAD_FOLDER=UPLOAD_FOLDER
)


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/registration")
def register():
    return render_template('register.html')


@app.route("/sign_in")
def sign_in():
    return render_template('sign_in.html')


if __name__ == "__main__":
    try:
        app.run(host="127.0.0.1", port=8000, debug=True)
    except:
        print('unable to open port')
