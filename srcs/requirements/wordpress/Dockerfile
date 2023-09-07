FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y \
    php7.4 \
    php7.4-mysql \
    php7.4-fpm \
    curl

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp &&\
    chmod +x wp &&\
    mv wp /usr/local/bin/wp

COPY ./tools/auto_config.sh ./auto_config.sh

RUN chmod +x ./auto_config.sh && mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html && mkdir -p /run/php &&\
    chown -R www-data:www-data /run/php

EXPOSE 9000

ENTRYPOINT ["./auto_config.sh"]