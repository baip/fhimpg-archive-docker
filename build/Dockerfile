FROM php:apache

RUN apt-get -qy update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -qy install --no-install-recommends imagemagick nullmailer && \
    docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli && \
    apt-get -qy clean && \
    a2enmod rewrite

WORKDIR /a

RUN mkdir /a/etc /a/bin /a/data /a/cache /a/tmp /a/log && \
    chmod 777 /a/data /a/cache /a/tmp /a/log

COPY ["archive/src/", \
      "archive/support/", "/a/www/"]
COPY archive/archive.rewrite.conf /a/etc/
COPY php.ini /usr/local/etc/php/

ENV APACHE_DOCUMENT_ROOT /a/www
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf && \
    chown -R www-data:www-data /a/www /a/etc