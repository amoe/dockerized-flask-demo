FROM debian:stretch

RUN apt-get update
RUN apt-get -y install python3

WORKDIR /code
CMD ["/usr/bin/python3", "main.py"]
