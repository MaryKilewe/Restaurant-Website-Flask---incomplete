
from flask import Flask, render_template, request, session, redirect, url_for, flash
import pymysql
import pandas
import matplotlib.pyplot as plt
import os
from werkzeug.utils import secure_filename


app = Flask(__name__)
#app.secret_key = b'_5#y2L"F4Q8z\n\xec]/>?@$'
app.secret_key = b'\xden\xe6BE\xcf_\xaa&\x02\x8fM2\x91N@\xf2E\xffap\xe9\x81'
# ============================================================================

# ============================================================================


'''
@app.route('/homepage')
def homepage():
    if 'userkey' in session:
        return render_template('homepage.html')
    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')
'''

#=================================================================================
# create a table named register. Columns: username, password, firstname, lastname
@app.route('/register', methods=['POST', 'GET'])
def register():
    # logic goes here. handle form data
    if request.method == 'POST':  # check if user posted something
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        username = request.form['username']
        password = request.form['password']

        if firstname == "":
            # flash('Email is empty')
            return render_template('register.html', msg_email="First name is empty")
        elif lastname == "":
            # flash('Name is empty')
            return render_template('register.html', msg_name="Last name is empty")
        elif username == "":
            # flash('Message is empty')
            return render_template('register.html', msg_comment="Username is empty")
        elif len(password) < 10:
            # flash('Message should be at least ten characters')
            return render_template('register.html', msg_comment_legnth="Password should be at least ten characters")
        else:
            con = pymysql.connect("localhost", "root", "", "sampledb")
            cursor = con.cursor()
            sql = "INSERT INTO register_tbl(`firstname`,`lastname`,`username`,`password`,`status`) VALUES(%s,%s,%s,%s,'user')"  # use tick marks ( ` ) instead of single quotes
        try:
            cursor.execute(sql, (firstname, lastname, username, password))
            con.commit()  # commit changes to the db
            session['userkey'] = username
            return render_template('homepage.html', msg="Welcome "+username)
        except:
            con.rollback()
            return render_template('register.html', msg="Failed! Try again.")
    else:
        return render_template('register.html')


#=================================================================================


# allow a user to log in
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
                return redirect('/blogMessages')

        elif cursor.rowcount > 1:
            return render_template('login.html', msg="Try again later")
        else:
            return render_template('login.html', msg="Something went wrong. Contact Admin.")

    else:
        return render_template('login.html')


# =================================================================================
# ================================================================================

@app.route('/logout')
def logout():
    session.pop('userkey', None)
    return redirect('/login')

# =====================================================================================

# registered user types a blog
@app.route('/blog', methods=['POST', 'GET'])
def blog():
    if 'userkey' in session:
        # logic goes here. handle form data
        if request.method =='POST':          # check if user posted something
            email = request.form['email']
            name = request.form['name']
            message = request.form['message']

            if email == "":
                #flash('Email is empty')
                return render_template('blog.html', msg_email="Email is empty")
            elif name == "":
                #flash('Name is empty')
                return render_template('blog.html', msg_name="Name is empty")
            elif message == "":
                #flash('Message is empty')
                return render_template('blog.html', msg_comment="Message is empty")
            elif len(message) <10:
                #flash('Message should be at least ten characters')
                return render_template('blog.html', msg_comment_legnth="Message should be at least ten characters")
            else:
                #save the three items to db
                #establish db connection
                con = pymysql.connect("localhost", "root", "", "sampledb")
                #execute sql
                #create a cursor object, cursor executes sql
                cursor = con.cursor()
                sql = "INSERT INTO messages_tbl(`name`,`email`,`message`) VALUES(%s,%s,%s)"     #use tick marks ( ` ) instead of single quotes
                try:
                    cursor.execute(sql,(name,email,message))
                    con.commit()        #commit changes to the db
                    cursor.execute("SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC")
                    rows = cursor.fetchall()
                    return render_template('blog.html', msg="Uploaded!", rowdata=rows)
                except:
                    con.rollback()
                    cursor.execute("SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC")
                    rows = cursor.fetchall()
                    return render_template('blog.html', msg="Failed!", rowdata=rows)
        else:
            con = pymysql.connect("localhost", "root", "", "sampledb")
            cursor = con.cursor()
            sql = "SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC"
            # execute sql
            cursor.execute(sql)
            if cursor.rowcount < 1:
                return render_template('blog.html', msgDisplay="No messages found!")
            else:
                rows = cursor.fetchall()
                # send the rows back to the presentation rows
                return render_template('blog.html', rowdata=rows)
            #return render_template('blog.html')

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')

# ========================================================================================
# ========================================================================================


@app.route("/deleteblog/<msg_id>")
def deleteblog(msg_id):
    if 'userkey' in session:

        # we now delete the message with that id
        con = pymysql.connect("localhost", "root", "", "sampledb")
        cursor = con.cursor()
        sql = "DELETE FROM `messages_tbl` WHERE `message_id`=%s"
        # execute sql, provide the msg_id that we received
        try:
            cursor.execute(sql, (msg_id))
            con.commit()
        #--------------------------------------------------- added this code
            sql = "SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC"
            cursor.execute(sql)
            rows = cursor.fetchall()
            return render_template('blog.html', msg2="Deleted comment made by: " + msg_id, rowdata=rows)
        #--------------------------------------------------------------------
            #return render_template('search.html')
        except:
            con.rollback()
            return redirect('/blog')

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')


# *******************************************************************************

# ------------------------- BACK-END FUNCTIONALITY ------------------------------

# *******************************************************************************

@app.route('/backend')
def backend():
    if 'userkey' in session:

        # get the key value
        username = session['userkey']
        return render_template('backend.html')
    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')

# ===============================================================================
# ===============================================================================

@app.route("/search", methods=['POST', 'GET'])
def search():
    if 'userkey' in session:

        if request.method =='POST':
            education = request.form['education']
            select_state = request.form.get('comp_select_state')
            select_gender = request.form.get('comp_select_gender')

            con = pymysql.connect("localhost","root","","sampledb")

            cursor = con.cursor()
            sql = "SELECT * FROM `customers` WHERE `Education` = %s AND `State` = %s AND `Gender` = %s"

            cursor.execute(sql,(education, select_state, select_gender))

            if cursor.rowcount == 0:
                return render_template('search.html',
                                       state_data=[{'name': 'Oregon'}, {'name': 'Arizona'}, {'name': 'Washington'},
                                             {'name': 'California'}, {'name': 'Nevada'}],
                                       gender_data=[{'name': 'M'}, {'name': 'F'}],
                                       msg="Not found in the database...")
            else:
                rows = cursor.fetchall()
                return render_template('search.html',
                                       state_data=[{'name': 'Oregon'}, {'name': 'Arizona'}, {'name': 'Washington'},
                                             {'name': 'California'}, {'name': 'Nevada'}],
                                       gender_data=[{'name': 'M'}, {'name': 'F'}],
                                       customerdata=rows)
                # above function receives a name from the form searches based
                # on the name and return rows
        else:
            return render_template('search.html',
                                   state_data=[{'name': 'Oregon'}, {'name': 'Arizona'}, {'name': 'Washington'},
                                               {'name': 'California'}, {'name': 'Nevada'}],
                                   gender_data=[{'name': 'M'}, {'name': 'F'}])

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')

# ========================================================================================
# ========================================================================================

# searching from the database
@app.route('/orders', methods=['POST', 'GET'])
def orders():
    if 'userkey' in session:

        con = pymysql.connect("localhost","root","","sampledb")
        cursor = con.cursor()
        sql = "SELECT * FROM `orders` ORDER BY `date` DESC"
        cursor.execute(sql)
            # check is cursor has zero rows
        if cursor.rowcount == 0:
            return render_template('orders-table.html', msg="No orders found...")
        else:
            rows = cursor.fetchall()
            return render_template('orders-table.html', orderdata=rows)

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')

# ==============================================================================

@app.route('/blogstable', methods=['GET'])
def blogstable():
    if 'userkey' in session:

        con = pymysql.connect("localhost","root","","sampledb")
        cursor = con.cursor()
        sql = "SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC"
        cursor.execute(sql)
        if cursor.rowcount == 0:
            return render_template('blogs-table.html', msg="No blog messages found...")
        else:
            rows = cursor.fetchall()
            return render_template('blogs-table.html', blogsdata=rows)

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')

# ==============================================================================

@app.route('/users', methods=['GET'])
def users():
    if 'userkey' in session:

        con = pymysql.connect("localhost","root","","sampledb")
        cursor = con.cursor()
        sql = "SELECT * FROM `register_tbl` ORDER BY `registration_time` DESC"
        cursor.execute(sql)
            # check is cursor has zero rows
        if cursor.rowcount == 0:
            return render_template('reg-users-table.html', msg="No registered user data found...")
        else:
            rows = cursor.fetchall()
            return render_template('reg-users-table.html', userdata=rows)


    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')


# ===================================================================================================================
# ----------------- SECTION FOR ADDING MENU ITEMS, UPLOADING IMAGES AND DISPLAYING IMAGES ON WEBPAGE ----------------

UPLOAD_FOLDER = 'C:\\Users\\Mary\\Documents\\1.PycharmProgams\\RestaurantWebsiteFlaskProject\\static\\image\\'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

# this section has code that adds menu item to homepage using backend form
# adds a menu item into the database
@app.route('/additem', methods=['POST', 'GET'])
def additem():
    if request.method == 'POST':  # check if user posted something
        item = request.form['item']
        description = request.form['description']
        cost = request.form['cost']
        image = request.form['image']

        if item == "":
            # flash('Email is empty')
            return render_template('add-item.html', msg_item="*Item is empty")
        elif description == "":
            # flash('Name is empty')
            return render_template('add-item.html', msg_description="*Description is empty")
        elif cost == "":
            # flash('Message is empty')
            return render_template('add-item.html', msg_cost="*Cost is empty")
        elif image == "":
            # flash('Message is empty')
            return render_template('add-item.html', msg_image="*Image is empty")
        elif not image.endswith('.jpg'):
            # flash('Message is empty')
            return render_template('add-item.html', msg_image_type="*Wrong file type. Only <a href=\"#\">jpg</a>")
        else:
            # save the three items to db
            # establish db connection
            con = pymysql.connect("localhost", "root", "", "sampledb")
            cursor = con.cursor()
            sql = "INSERT INTO allfood_tbl(`item`,`description`,`cost`,`image`) VALUES(%s,%s,%s,%s)"
            try:
                cursor.execute(sql, (item, description, cost, image))
                con.commit()  # commit changes to the db
                return render_template('add-item.html', msg="Uploaded!")
            except:
                con.rollback()
                return render_template('add-item.html', msg="Failed!")
    else:
        return render_template('add-item.html',
                               description_data=[{'description': 'meal'}, {'description': 'drink'}, {'description': 'dessert'}]
                               )


# code for uploading images to folder named static/image.
# The path is stated in UPLOADED_FOLDER at the top of the page
@app.route('/imageUpload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'img-file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['img-file']
        # if user does not select file, browser also
        # submit an empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            return redirect(url_for('uploads'))

    return render_template('upload-image.html')


from flask import send_from_directory
@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)


# displays all the images uploaded by the admin with their respective names.
# This makes it easier for them to add the name of the picture when they are adding a menu item
@app.route('/uploaded-images')
def uploads():
    pictures = os.listdir('static/image/')
    return render_template("menu-images.html", pics=pictures)


@app.route('/homepage')
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



        return render_template("homepage.html", mealsdata=rows_meals,
                               drinksdata=rows_drinks,
                               dessertdata=rows_dessert,
                               path_to_images='../static/image/')

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')


# deletes an image from static/image folder
@app.route('/delete-image/<pic>/', methods=['GET', 'POST'])
def delete_image(pic):
    if 'userkey' in session:

        os.remove(os.path.join(app.config['UPLOAD_FOLDER'], pic))
        return redirect(url_for('uploads'))

    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')


# ===============================================================================
# ===============================================================================

# section of code below deals with displaying food item details to administrator and editing of those food items
# create the popup form with some adjustments to the code - https://www.formget.com/how-to-create-pop-up-contact-form-using-javascript/


@app.route('/food-list', methods=['POST', 'GET'])
def food_list():
    con = pymysql.connect("localhost", "root", "", "sampledb")

    cursor = con.cursor()
    sql_allfood = "SELECT * FROM `allfood_tbl` ORDER BY `id`"
    cursor.execute(sql_allfood)
    rows_allfood = cursor.fetchall()

    # this will join the data from all three tables in a variable named foodata.
    # This is abetter way to display all food items in the database.
    # Sql Full joins won't work here because there is no common column among the table
    return render_template('food-list.html', fooddata=rows_allfood)


@app.route('/edit-food/<item_id>', methods=['POST', 'GET'])
def edit_food(item_id):
    if request.method == 'POST':  # check if user posted something
        item = request.form['item']
        # notice the difference in brackets used on description line. () is used instead of []
        description = request.form['description']
        cost = request.form['cost']
        image = request.form['image']

        # update the row with the specific id passed in the url above
        # --------------------------------------------------------------
        con = pymysql.connect("localhost", "root", "", "sampledb")
        # update main database
        cursor = con.cursor()
        sql = "UPDATE `allfood_tbl` " \
              "SET `item`=%s, `description`=%s, `cost`=%s, `image`=%s " \
              "WHERE `id`=%s"

        cursor.execute(sql, (item, description, cost, image, item_id))
        con.commit()

        # redirect to food list url
        return redirect(url_for('food_list'))

    else:
        con = pymysql.connect("localhost", "root", "", "sampledb")
        cursor_1 = con.cursor()
        sql_allfood = "SELECT * FROM `allfood_tbl` ORDER BY `id`"
        cursor_1.execute(sql_allfood)
        rows_allfood = cursor_1.fetchall()

        # pass the item's name, description, cost and image to the input field of the html form
        cursor_item_name = con.cursor()
        sql_item_name = "SELECT * FROM `allfood_tbl` WHERE `id`=%s"
        cursor_item_name.execute(sql_item_name, item_id)
        item_name = cursor_item_name.fetchall()

        #name_of_item = con.cursor().execute("SELECT `item` FROM `meals_tbl` WHERE `id`=%s", item_id)
        return render_template('edit-food-list.html',
                               fooddata=rows_allfood,
                               item_edited=item_id,
                               description_data=[{'description':'meal'}, {'description':'drink'}, {'description':'dessert'}],
                               selected_item=item_name
                               )
'''
@app.route('/backend')
def backend():
    if 'userkey' in session:


    elif 'userkey' not in session:
        return redirect('/login')
    else:
        return redirect('/login')


# ===============================================================================
# ===============================================================================
'''



@app.route('/scatterplot')
def scatterplot():

    con = pymysql.connect("localhost", "root", "", "sampledb")
    df = pandas.read_sql("SELECT `quantity`, `State` FROM orders", con)
    plt.scatter(df['State'], df['quantity'], c=df['quantity'])
    plt.savefig('static/image/graphs/states-scatterplot.png')
    #plt.show()

    return render_template('scatter-plot.html')




"""@app.route('/order/<order_id>')
def scatterplot(order_id):
"""





if __name__ == "__main__":
    app.run(debug=True)
