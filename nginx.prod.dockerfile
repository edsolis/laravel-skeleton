FROM nginx:stable-alpine

ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY ./nginx/default.conf.template /etc/nginx/templates/default.conf.template

RUN mkdir -p /var/www/html

COPY ./src /var/www/html

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN chown laravel:laravel /var/www/html