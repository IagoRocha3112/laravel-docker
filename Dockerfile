FROM php:7.2-fpm-alpine

RUN apk add --no-cache openssl bash mysql-client nodejs npm

RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www/html

RUN chown -R 1000:www-data /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000
ENTRYPOINT ["php-fpm"]
