# Imagen base (penultima version estable de debian).
FROM debian:bullseye

# Actualiza la lista de paquetes disponibles desde los repositorios
# configurados.
# Instala php-fpm (el servidor de aplicaciones PHP), php-mysql (extensión
# de PHP para MySQL), mariadb-client y curl.
# Limpia la caché de paquetes descargados y elimina los archivos de la lista
# de paquetes.
RUN apt-get update && \
    apt-get install -y --no-install-recommends php7.4-fpm php-mysql mariadb-client curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear directorio para WordPress
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Instalar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Descargar WordPress
# Dar permisos al usuario www-data
RUN wp core download --allow-root && \
    chown -R www-data:www-data .

# Copia un archivo de configuración (de Wordpress) personalizado desde el
# contexto de construcción.
COPY conf/wp-config.php ./wp-config.php

# Copia un script de inicialización desde el contexto de construcción.
COPY tools/init.sh /usr/local/bin/init.sh

# Modifica la configuración de PHP-FPM para que escuche en el puerto 9000 y no
# en el socket predeterminado (por ejemplo /run/php/php7.4-fpm.sock).
# Da permisos de ejecución al script de inicialización.
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
    chmod +x /usr/local/bin/init.sh && \
    mkdir -p /run/php

# Comando por defecto, se usa para ejecutar la instalacion de WordPress
# en tiempo de ejecución usando las variables de entorno.
CMD ["init.sh"]