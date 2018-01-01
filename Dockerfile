FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
                libfreetype6-dev \
                libjpeg62-turbo-dev \
                libmcrypt-dev \
                libpng-dev \
        && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql bcmath zip \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd


VOLUME ["/var/www"]
