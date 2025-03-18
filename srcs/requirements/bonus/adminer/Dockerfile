# Imagen base (penultima version estable de debian).
FROM debian:bullseye

# Actualiza la lista de paquetes disponibles desde los repositorios
# configurados.
# Instala php, php-cli, php-mysqli, php-json y wget.
# Limpia la caché de paquetes descargados y elimina los archivos de la lista
# de paquetes.
RUN apt-get update && apt-get install -y \
    php \
    php-cli \
    php-mysqli \
    php-json \
    wget
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crea el directorio para Adminer y descarga la última versión de Adminer.
RUN mkdir -p /var/www/adminer && \
    wget "https://www.adminer.org/latest.php" -O /var/www/adminer/index.php

# Inicia Adminer con el servidor embebido de PHP
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/adminer"]
