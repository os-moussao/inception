FROM debian:buster

RUN apt update && \
    apt upgrade && \
    apt install -y nginx curl ca-certificates openssl

RUN mkdir -p /etc/nginx/ssl &&\
     openssl req -x509 -nodes -days 730 \
     -out /etc/nginx/ssl/inception.crt \
     -keyout /etc/nginx/ssl/inception.key \
     -subj "/C=CA/ST=IDF/O=Company, Inc./CN=omoussao.42.fr/UID=omoussao"

