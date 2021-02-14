FROM php:7.4.10-apache

RUN apt-get update
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev libonig-dev libzip-dev zip unzip nano libxml2-dev libmagickcore-dev libmagickwand-dev imagemagick libheif1 libheif-dev --no-install-recommends
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install json
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN docker-php-ext-install xml
RUN pecl install imagick && docker-php-ext-enable imagick

RUN apt-get install -y ghostscript

RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY php.ini /usr/local/etc/php/php.ini
COPY policy.xml /etc/ImageMagick-6/policy.xml
RUN rm -rf /var/lib/apt/lists/
