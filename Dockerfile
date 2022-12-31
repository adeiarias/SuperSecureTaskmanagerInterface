FROM php:7.4-apache

RUN docker-php-ext-install mysqli

COPY html.tar /tmp
RUN tar -xvf /tmp/html.tar
COPY flag.txt /flag.txt
RUN chown -R root:www-data /var/www/html
RUN chmod -R 775 /var/www/html
RUN a2enmod headers
RUN a2enmod rewrite

RUN /etc/init.d/apache2 restart
