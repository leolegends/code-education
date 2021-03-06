FROM php:7.3.6-fpm-alpine3.9

RUN apk add --no-cache openssl bash mysql-client nodejs npm
RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache shadow

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN wget https://getcomposer.org/download/1.10.13/composer.phar 

RUN mv composer.phar /usr/local/bin/composer

RUN chmod +x /usr/local/bin/composer
RUN chmod 777 /usr/local/bin/composer

RUN chown -R www-data:www-data /var/www

RUN composer --version

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 
# RUN composer self-update --stable

# COPY . /var/www
RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
