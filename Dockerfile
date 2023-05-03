FROM python:3.8-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY api /app
COPY src /app/src
COPY requirements.txt .
RUN echo $(ls)
RUN python -m pip install -r requirements.txt

RUN sudo apt-get update -yy
RUN sudo apt-get install poppler-utils -yy
RUN sudo apt-get install libleptonica-dev tesseract-ocr libtesseract-dev python3-pil tesseract-ocr-eng tesseract-ocr-deu tesseract-ocr-script-latn -yy

WORKDIR /app
RUN echo $(ls)
CMD ["python3", "app.py"]
