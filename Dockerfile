FROM php:7.2-fpm-alpine

# GAMBIARRA USADA para evitar o problema e timeout do alpine
#RUN sed -i -e 's/http:/https:/' /etc/apk/repositories

RUN apk add --update --no-cache libintl icu icu-dev libxml2-dev \
    sqlite socat sqlite-libs nginx supervisor wget git curl php7 php7-openssl \
    php7-json php7-phar php7-dom php7-curl php7-fpm php7-gd php7-mcrypt php7-iconv \
    php7-session php7-ctype php7-tokenizer php7-pdo php7-pdo_mysql php7-mysqli \
    php7-xml php7-simplexml php7-soap php7-mbstring openssh-client php7-fileinfo \
    php7-zip php7-xmlreader php7-xmlwriter php7-imagick

RUN docker-php-ext-install intl zip soap mysqli pdo pdo_mysql

RUN apk add --no-cache libpng libpng-dev && docker-php-ext-install gd && apk del libpng-dev

# COPY master /var/www/

EXPOSE 9000

CMD ["php-fpm"]



