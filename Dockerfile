FROM python:3.8-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY api /app
COPY src /app/src
COPY requirements.txt /app/.

WORKDIR /app

RUN apt-get update -yy
RUN apt-get install poppler-utils -yy
RUN apt-get install libleptonica-dev tesseract-ocr libtesseract-dev python3-pil tesseract-ocr-eng tesseract-ocr-deu tesseract-ocr-spa tesseract-ocr-script-latn -yy

RUN python -m pip install -r requirements.txt

CMD ["python3", "app.py"]
