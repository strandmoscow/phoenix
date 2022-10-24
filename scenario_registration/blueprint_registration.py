from flask import Blueprint, request, session, render_template, redirect

registration = Blueprint('registration', __name__, template_folder='templates')


@registration.route("/step1", methods=['GET', 'POST'])
def step1():
    if request.method == 'POST':
        session['surname'] = request.form.get('inputSurname')
        session['name'] = request.form.get('inputName')
        session['email'] = request.form.get('inputEmail')
        return redirect("step2")
    else:
        return render_template('registration.html')


@registration.route("/step2", methods=['GET', 'POST'])
def step2():
    if request.method == 'POST':
        session['dob'] = request.form.get('inputDOB')
        session['phone'] = request.form.get('inputPhone')
        session['email'] = request.form.get('inputEmail')
    else:
        return render_template('registration2.html')
