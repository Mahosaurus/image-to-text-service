import json
from pdf2image import convert_from_path
import pytesseract

def do_ocr(file_candidate):
    pages = convert_from_path(file_candidate, 1000, single_file=True)
    print("Starting tesseract img to str")

    # Get an indexable document
    result_text = bytes(pytesseract.image_to_string(pages[0], lang='deu'), 'utf-8').decode('utf-8')
    result_text = result_text.replace("\n", "")
    result_text = result_text.replace(",", " ")
    result_text = result_text.replace("-", " ")
    result_text = result_text.replace("—", " ")
    result_text = result_text.replace("—", " ")
    #result_text = [text.lower() for text in result_text.split(" ") if text]

    return result_text
