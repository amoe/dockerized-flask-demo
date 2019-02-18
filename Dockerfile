FROM debian:stretch

RUN apt-get update
RUN apt-get -y install python3 python3-pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

WORKDIR /code

# Flask specific
ENV LANG=C.UTF-8
ENV FLASK_ENV=development

CMD ["/usr/local/bin/flask", "run", "-h", "0.0.0.0"]
