FROM python:3.8-slim-buster

#WORKDIR /python-docker
COPY . ./
RUN dir -s
RUN pip3 install -r requirements.txt

CMD ["python3", "-m" , "flask", "run"]