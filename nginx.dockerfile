FROM nginx:stable-alpine

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

# Use env variables from docker-compose
#ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/default.conf.template /etc/nginx/templates/default.conf.template

RUN mkdir -p /var/www/html

RUN addgroup -g $GROUP_ID laravel && adduser -G laravel -g $GROUP_ID -s /bin/sh -D laravel

RUN chown ${USER_ID}:laravel /var/www/html