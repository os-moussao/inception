#!/bin/sh


sleep 5

alias wp="wp --allow-root"

# if [ ! -f "/var/www/wp-config.php" ];then
	cd /var/www && wp core download

	wp core config \
	    --dbname=$SQL_DATABASE \
	    --dbuser=$SQL_USER \
	    --dbpass=$SQL_PASSWORD \
	    --dbhost=mariadb

	wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} \
	    --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email

	wp user create  ${WP_USER} ${WP_EMAIL} --user_pass=${WP_USER_PASSWORD} --role=author

# fi


sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf && mkdir /run/php

chown -R www-data:www-data /var/www/

exec php-fpm7.3 -F

