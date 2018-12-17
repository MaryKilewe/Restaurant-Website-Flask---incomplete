from flask import Flask, render_template, request, session, redirect, url_for, flash, send_from_directory
import os
from os import listdir
import pymysql


UPLOAD_FOLDER = 'C:\\Users\\Mary\\Documents\\1.PycharmProgams\\RestaurantWebsiteFlaskProject\\static\\image'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])
#ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# follow this youtube channel tutorial
# https://www.youtube.com/watch?v=yO_XNCsBIsg - Displaying Multiple Images using Flask and Python (Gallery).

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)


@app.route('/uploaded_images')
def uploads():
    pictures = os.listdir('static/image/')
    return render_template("menu-images.html", pics=pictures)

# try this out later maybe to display pdf files rather than images.
# code below doesn't work on images. It shows brocken images instead of actual images
'''@app.route('/')  
def home():  
    pics = os.listdir('static/images/')  
    return render_template("homepage.html", pics=pics)  


{% for pic in pics %}  
    <img src='/static/images/{{pic}}'/>  
{% endfor %} '''



if __name__ == "__main__":
    app.run(debug=True)


