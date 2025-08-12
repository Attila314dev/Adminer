FROM php:8.2-apache

# PostgreSQL kliens fejlécek + PHP pgsql/pdo_pgsql extensionök
RUN apt-get update \
 && apt-get install -y --no-install-recommends libpq-dev curl \
 && docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql \
 && docker-php-ext-install pgsql pdo_pgsql \
 && rm -rf /var/lib/apt/lists/*

# Adminer letöltése (index.php néven a webrootba)
RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
     -o /var/www/html/index.php

# (Render Docker service-hez általában elég az alap Apache beállítás; 
# ha porttal lenne gond, be lehet állítani az APACHE_LISTEN_PORT-ot a $PORT-ra)

EXPOSE 80
