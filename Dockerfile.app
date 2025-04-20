# Usa como base PHP 8.0 con Apache ya instalado.
FROM php:8.0-apache

# Establece el directorio de trabajo dentro del contenedor.
WORKDIR /var/www

# Actualiza los paquetes, instala dependencias necesarias para Laravel y Composer, 
# y descarga e instala dockerize.
RUN apt-get update && apt-get install -y \
  git unzip curl libzip-dev zip \
  libpng-dev libjpeg-dev libfreetype6-dev \
  libonig-dev libxml2-dev wget \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install \
  pdo \
  pdo_mysql \
  zip \
  gd \
  mbstring \
  tokenizer \
  xml \
  ctype \
  bcmath \
  fileinfo \
  opcache \
  && wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz \
  && tar -xvzf dockerize-linux-amd64-v0.6.1.tar.gz \
  && mv dockerize /usr/local/bin/

# Copia Composer desde una imagen oficial para poder usarlo dentro de este contenedor.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia el resto del código del proyecto al contenedor.
COPY . .

# Copia los archivos de Composer.
COPY composer.json composer.lock ./

# Instala dependencias
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Reemplaza la raíz de documentos en los archivos de configuración de Apache.
ENV APACHE_DOCUMENT_ROOT=/var/www/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Activa módulos de Apache que Laravel necesita.
RUN a2enmod rewrite headers

# Cambia los permisos de las carpetas de almacenamiento y caché de Laravel.
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
RUN chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Copia el script de arranque personalizado.
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Da permisos de ejecución al script de entrada.
RUN chmod +x /usr/local/bin/entrypoint.sh

# Define el punto de entrada del contenedor (script que se ejecuta al iniciar).
ENTRYPOINT ["entrypoint.sh"]