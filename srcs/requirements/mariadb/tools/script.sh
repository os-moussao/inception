#!/bin/sh

# # allow mysql to start with the associated command
# service mysql start;

# # create database with the name of the environment variable $SQL_DATABASE
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# # create user
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# # grant all rights $SQL_USER
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# # chage the root user rights
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# # refresh user previleges
# mysql -e "FLUSH PRIVILEGES;"

# # restart mysql so that all changes are made 
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# # lunch mysql
# exec mysqld_safe

mysqld --user=mysql --bootstrap --datadir=/var/lib/mysql << EOF
USE mysql;
FLUSH PRIVILEGES ;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${SQL_ROOT_PASSWORD}') ;
DROP DATABASE IF EXISTS test ;
CREATE DATABASE '${SQL_DATABASE}';
FLUSH PRIVILEGES ;
GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' identified by '$SQL_PASSWORD' WITH GRANT OPTION ;
GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'localhost' identified by '$SQL_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR '${SQL_USER}'@'localhost'=PASSWORD('${SQL_PASSWORD}') ;
FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --skip-networking=0