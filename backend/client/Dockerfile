FROM python:3.11-slim-bookworm

ENV PYTHONUNBUFFERED=1

WORKDIR /xiaoma-rider

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

