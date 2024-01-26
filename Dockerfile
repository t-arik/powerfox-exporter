FROM python:3.12-slim-bullseye

EXPOSE 9813

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .

CMD [ "python3", "exporter.py"]
