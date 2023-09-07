#!/bin/sh
sleep 10

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --path=/var/www/ --allow-root

cat /var/www/wp-config-sample.php >  /var/www/wp-config.php

wp config set DB_NAME $SQL_DATABASE --path=/var/www/ --allow-root
wp config set DB_USER $SQL_USER --path=/var/www/ --allow-root
wp config set DB_PASSWORD $SQL_PASSWORD --path=/var/www/ --allow-root
wp config set DB_HOST mariadb --path=/var/www/ --allow-root

wp core install --path=/var/www/ --url=omoussao.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN_PASSWORD --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create --path=/var/www/ $WP_USER $WP_EMAIL --user_pass=$USER_PASS --allow-root

exec php-fpm7.4 -F