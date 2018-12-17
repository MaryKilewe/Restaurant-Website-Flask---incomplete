from flask import Flask, render_template, request, session, redirect, url_for, flash
from os import listdir
import pymysql


app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def blog():
    if request.method == 'POST':  # check if user posted something
        email = request.form['email']
        name = request.form['name']
        message = request.form['message']

        if email == "":
            # flash('Email is empty')
            return render_template('replyComments.html', msg_email="Email is empty")
        elif name == "":
            # flash('Name is empty')
            return render_template('replyComments.html', msg_name="Name is empty")
        elif message == "":
            # flash('Message is empty')
            return render_template('replyComments.html', msg_comment="Message is empty")
        elif len(message) < 10:
            # flash('Message should be at least ten characters')
            return render_template('replyComments.html', msg_comment_legnth="Message should be at least ten characters")
        else:
            # save the three items to db
            # establish db connection
            con = pymysql.connect("localhost", "root", "", "sampledb")
            # execute sql
            # create a cursor object, cursor executes sql
            cursor = con.cursor()
            sql = "INSERT INTO messages_tbl(`name`,`email`,`message`) VALUES(%s,%s,%s)"  # use tick marks ( ` ) instead of single quotes
            try:
                cursor.execute(sql, (name, email, message))
                con.commit()  # commit changes to the db
                cursor.execute("SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC")
                rows = cursor.fetchall()
                return render_template('replyComments.html', msg="Uploaded!", rowdata=rows)
            except:
                con.rollback()
                cursor.execute("SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC")
                rows = cursor.fetchall()
                return render_template('replyComments.html', msg="Failed!", rowdata=rows)
    else:
        con = pymysql.connect("localhost", "root", "", "sampledb")
        cursor = con.cursor()
        sql = "SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC"
        # execute sql
        cursor.execute(sql)
        if cursor.rowcount < 1:
            return render_template('replyComments.html', msg2="No messages found!")
        else:
            rows = cursor.fetchall()
            # send the rows back to the presentation rows
            return render_template('replyComments.html', rowdata=rows)
        # return render_template('blog.html')


# ================================================================================


@app.route('/replyform/<msg_id>', methods=['POST', 'GET'])
def showReplyForm(msg_id):
    con = pymysql.connect("localhost", "root", "", "sampledb")
    # execute sql
    # create a cursor object, cursor executes sql
    cursor = con.cursor()
    cursor.execute("SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC")
    rows = cursor.fetchall()
    return render_template('replyComments.html', rowdata=rows,
                           showform='''
                                    <form action="/reply" method="post" class="replyDesign" style="position:absolute">
                                    Name:
                                    <br>
                                    <input type="text" name="name" placeholder="Enter name..." class="form-control">
                                    
                                    Email:
                                    <br>
                                    <input type="email" name="email" placeholder="Enter email..." class="form-control">
                                    
                                    Comment:
                                    <br>
                                    <textarea name="message" placeholder="Enter message..." class="form-control" 
                                    style="height:150px"></textarea>
                                
                                    <input type="submit" name="submit" value="POST COMMENT" class="btn btn-outline-warning">
                                    </form> 
                                    ''')



@app.route("/reply/<msg_id>")
def reply(msg_id):
    # logic goes here. handle form data
    if request.method == 'POST':  # check if user posted something
        email = request.form['email']
        name = request.form['name']
        message = request.form['message']

        if email == "":
            # flash('Email is empty')
            return render_template('blog.html', msg_email="Email is empty")
        elif name == "":
            # flash('Name is empty')
            return render_template('blog.html', msg_name="Name is empty")
        elif message == "":
            # flash('Message is empty')
            return render_template('blog.html', msg_comment="Message is empty")
        elif len(message) < 10:
            # flash('Message should be at least ten characters')
            return render_template('blog.html', msg_comment_legnth="Message should be at least ten characters")
        else:
            con = pymysql.connect("localhost", "root", "", "sampledb")
            reply_cursor = con.cursor()
            sql_reply = "INSERT INTO messages_tbl(`name`,`email`,`message`,`type`) VALUES(%s,%s,%s,'reply_comment')"  # use tick marks ( ` ) instead of single quotes
            try:
                reply_cursor.execute(sql_reply, (name, email, message))
                con.commit()  # commit changes to the db

                return render_template(url_for('blog'), msg="Uploaded")
                #return render_template('replyComments.html', msg="Uploaded!", rowdata=rows, replydata=reply_rows, msgReplyTo="Reply to: " + msg_id)
            except:
                con.rollback()
                return render_template(url_for('blog'), msg="Failed!")
    else:
        con = pymysql.connect("localhost", "root", "", "sampledb")
        cursor = con.cursor()
        sql = "SELECT * FROM `messages_tbl` ORDER BY `red_date` DESC"
        cursor.execute(sql)
        messages = cursor.fetchall()

        cursor_message_data = con.cursor()
        sql_message_data = "SELECT * FROM `messages_tbl` WHERE `message_id`=%s"
        cursor_message_data.execute(sql_message_data, msg_id)
        # fetch the information of the message selected to be replied to
        message_of_initial_comment = cursor_message_data.fetchall()
        if cursor.rowcount < 1:
            return render_template(url_for('blog'), msg2="No messages")
        else:
            return render_template('replyComments.html', message_id=msg_id, message_data=message_of_initial_comment,
                                   rowdata=messages)


if __name__ == "__main__":
    app.run(debug=True)


