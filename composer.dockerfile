FROM composer

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

RUN addgroup -g $GROUP_ID laravel && adduser -G laravel -g $GROUP_ID -s /bin/sh -D laravel

WORKDIR /var/www/html

USER laravel