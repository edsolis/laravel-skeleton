FROM php:8.0.2-fpm-alpine

#ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html

COPY ./src /var/www/html

RUN chown -R www-data:www-data \
        /var/www/html/storage \
        /var/www/html/bootstrap/cache

RUN docker-php-ext-install pdo pdo_mysql
