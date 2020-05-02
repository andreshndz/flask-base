FROM python:3.7
MAINTAINER Andres Hernandez

ADD . /flask_base
WORKDIR /flask_base
RUN pip install -q --upgrade pip
RUN pip install -q -r requirements.txt

CMD flask run --host=0.0.0.0 --port=5000