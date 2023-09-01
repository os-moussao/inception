FROM debian:buster

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y mariadb-server

COPY conf/mariadb.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]
