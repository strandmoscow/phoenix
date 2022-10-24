from flask import Blueprint, request, session, render_template, redirect

account = Blueprint('account', __name__, template_folder='templates', static_folder='static')


@account.route("/step1", methods=['GET', 'POST'])
def step1():
    profile_icon = './static/abstract-user-flat-4.svg'
    return render_template('account.html', img=profile_icon)
