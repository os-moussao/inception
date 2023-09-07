FROM debian:buster

RUN apt update && apt upgrade && apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./tools/script.sh  ./create_db.sh

RUN chmod +x ./create_db.sh

ENTRYPOINT ["./create_db.sh"]