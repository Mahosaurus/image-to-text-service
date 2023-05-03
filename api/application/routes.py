import os

import cv2
import pytesseract

from flask import current_app as app
from flask import request, redirect, flash, render_template

def allowed_file(filename):
    ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def index():
    return render_template('upload.html')

@app.route('/upload_image', methods=['POST'])
def upload_image():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)

        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)

        if file and allowed_file(file.filename):
            print("Tesseract start")
            file.save("tmp")
            image = cv2.imread("tmp") #pylint: disable=no-member
            result = ocr_by_tesseract(image)
            print(result)
            return render_template("processed.html", processed_data={"text": result})
        return render_template('processed.html', processed_data={"text": result})

def ocr_by_tesseract(file_contet):
    # Get an indexable document
    result_text = bytes(pytesseract.image_to_string(file_contet, lang='deu'), 'utf-8').decode('utf-8')
    result_text = result_text.replace("\n", "")
    result_text = result_text.replace(",", " ")
    result_text = result_text.replace("-", " ")
    result_text = result_text.replace("—", " ")
    result_text = result_text.replace("—", " ")
    result_text = " ".join([text.lower() for text in result_text.split(" ") if text])
    return result_text