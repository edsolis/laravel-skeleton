FROM php:8.0.2-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

RUN addgroup -g $GROUP_ID laravel && adduser -G laravel -g $GROUP_ID -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown ${USER_ID}:laravel /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql
