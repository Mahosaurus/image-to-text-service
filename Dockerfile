FROM python:3.8-slim-buster

EXPOSE 5000
EXPOSE 8081

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY . ./
RUN dir -s
RUN python -m pip install -r requirements.txt

CMD ["python3", "-m" , "flask", "run"]
