FROM php:8.4-apache

RUN apt-get update

RUN apt-get install -y unzip

RUN apt-get install -y libzip-dev \
	&& docker-php-ext-install zip

RUN apt-get install -y libicu-dev \
	&& docker-php-ext-install intl

RUN docker-php-ext-install pdo_mysql

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN a2enmod rewrite
