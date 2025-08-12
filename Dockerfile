FROM php:8.2-apache

# Adminer letöltése
RUN mkdir -p /var/www/html && \
    curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
    -o /var/www/html/index.php

# Apache engedélyezés
EXPOSE 80
