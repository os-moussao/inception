FROM alpine:3.10

RUN apk update && \
    apk upgrade && \
    apk add mariadb mariadb-client

RUN addgroup mysql mysql

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

RUN chown -R mysql:mysql /var/lib/mysql

COPY tools/script.sh .

RUN chmod +x script.sh

EXPOSE 3306

ENTRYPOINT ["./script.sh"]