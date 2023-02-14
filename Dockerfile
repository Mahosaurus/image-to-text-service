FROM python:3.8-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY api /app
COPY src /app/src
COPY requirements.txt .

RUN python -m pip install -r requirements.txt

WORKDIR /app
CMD ["python3", "app.py"]
