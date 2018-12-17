
from flask import Flask, render_template, request, session, redirect, url_for, flash
import pymysql
import pandas
import matplotlib.pyplot as plt
import os
from werkzeug.utils import secure_filename

# https://www.reddit.com/r/flask/comments/4agkf2/flask_for_creating_an_ecommerce_website/
# https://github.com/Ottermad/Python-Flask-Store
app = Flask(__name__)
# strong secret key!!
app.config['SECRET_KEY'] = '\xa6\xb5\x0e\x7f\xd3}\x0b-\xaa\x03\x03\x82\x10\xbe\x1e0u\x93,{\xd4Z\xa3\x8f'


@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        con = pymysql.connect("localhost", "root", "", "sampledb")
        cursor = con.cursor()
        sql = "SELECT * FROM `register_tbl` WHERE `username` =% s AND `password` =% s"
        cursor.execute(sql, (username, password))
        # check if a match was found or not
        if cursor.rowcount == 0:
            return render_template('login.html', msg="No user found with your credentials. Please try again")
        elif cursor.rowcount == 1:
            # create session for the user logged in
            # we store the current logged in username variable below
            if username == 'admin' and password == 'adminpass':
                session['userkey'] = 'admin307'
                return redirect('/backend')
            else:
                session['userkey'] = username
                return redirect('/trialhomepage')

        elif cursor.rowcount > 1:
            return render_template('login.html', msg="Try again later")
        else:
            return render_template('login.html', msg="Something went wrong. Contact Admin.")

    else:
        return render_template('login.html')


@app.route('/trialhomepage')
def homepage():
    if 'userkey' in session:
        con = pymysql.connect("localhost", "root", "", "sampledb")

        cursor_1 = con.cursor()
        cursor_2 = con.cursor()
        cursor_3 = con.cursor()
        sql_meals = "SELECT * FROM `allfood_tbl` WHERE `description`='meal' ORDER BY `id`"
        sql_drinks = "SELECT * FROM `allfood_tbl` WHERE `description`='drink' ORDER BY `id`"
        sql_dessert = "SELECT * FROM `allfood_tbl` WHERE `description`='dessert' ORDER BY `id`"
        # execute sql
        cursor_1.execute(sql_meals)
        cursor_2.execute(sql_drinks)
        cursor_3.execute(sql_dessert)

        rows_meals = cursor_1.fetchall()
        rows_drinks = cursor_2.fetchall()
        rows_dessert = cursor_3.fetchall()



        return render_template("trialHomepage.html", mealsdata=rows_meals,
                               drinksdata=rows_drinks,
                               dessertdata=rows_dessert,
                               path_to_images='../static/image/')

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')



@app.route('/shopping_cart', methods=['POST', 'GET'])
def show_cart():
    '''
    cart_items = session['item']
    cart_cost = session['cost']
    cart_image = session['image']
    '''
    cart_details = session['itemdetails']
    return render_template('shopping_cart.html', cart_data=cart_details)
    #rt_data = cart_items + cart_cost + cart_image


@app.route('/cart/add/<item_id>', methods=['POST', 'GET'])
def sadd_to_cart(item_id):
    # do a cross join of the three tables maybe to retrieve the necessarinformation
    if 'userkey' in session:
        con = pymysql.connect("localhost", "root", "", "sampledb")

        '''cursor_full_join = con.cursor()
        ql="INSERT INTO shopping_cart_tbl (username, address, item, cost) \
            SELECT user.username, addr.address, food.item_, food.cost \
            FROM register_tbl AS user FULL JOIN delivery_addresses_tbl AS addr FULL JOIN allfood_tbl AS food \
            ON user.username = addr.username AND food.id=%s"
            '''
        cursor_item_details = con.cursor()
        sql_item_details = "SELECT * FROM `allfood_tbl` WHERE `id`=%s"
        cursor_item_details.execute(sql_item_details, item_id)
        item_details = cursor_item_details.fetchall()
        session['itemdetails'] = []
        session['itemdetails'].append(item_details)

        '''
        cursor_item= con.cursor()
        cursor_cost = con.cursor()
        cursor_image= con.cursor()
        sql_item = "SELECT `item` FROM `allfood_tbl` WHERE `id`=%s"
        sql_cost = "SELECT `cost` FROM `allfood_tbl` WHERE `id`=%s"
        sql_image = "SELECT `image` FROM `allfood_tbl` WHERE `id`=%s"
        cursor_item.execute(sql_item, item_id)
        cursor_cost.execute(sql_cost, item_id)
        cursor_image.execute(sql_image, item_id)

        # global rows
        item = cursor_item.fetchall()
        cost = cursor_cost.fetchall()
        image = cursor_image.fetchall()

        session['item'] = []
        session['cost'] = []
        session['image'] = []

        session['item'].append(item)
        session['cost'].append(cost)
        session['image'].append(image)

        '''
        return render_template('homepage.html')

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')


if __name__ == "__main__":
    app.run(debug=True)
# == END
# cart.html
