#!/bin/sh

service mysql start

mysql -u root << EOF
DROP USER IF EXISTS 'testUser'@'%';
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

kill `cat /var/run/mysqld/mysqld.pid`

mysqld --skip-log-error