from flask import Blueprint, request, session, render_template, redirect

account = Blueprint('account', __name__, template_folder='templates', static_folder='static')


@account.route("/base_acc", methods=['GET', 'POST'])
def base_acc():
    profile_icon = './static/abstract-user-flat-4.svg'
    eye_icon = './static/eye.svg'
    return render_template('account.html', img=profile_icon, eye=eye_icon)
