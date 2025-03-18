# Imagen base (penultima version estable de debian).
FROM debian:bullseye

# Actualiza la lista de paquetes disponibles desde los repositorios
# configurados.
# Instala nginx (el servidor web).
# Limpia la caché de paquetes descargados y elimina los archivos de la lista
# de paquetes.
RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia un archivo de configuración personalizado desde el contexto
# de construcción a la ubicación estándar de configuración de Nginx.
COPY conf/default.conf /etc/nginx/sites-available/default

# Copia la página web estática
COPY conf/index.html /var/www/html/index.html
RUN mkdir -p /var/www/html/static
COPY conf/image.png /var/www/html/static/image.png

# Especifica el comando que se ejecutará cuando el contenedor inicie:
# -g "daemon off;": ejecuta Nginx en el primer plano para que el proceso
# principal del contenedor siga activo.
CMD ["nginx", "-g", "daemon off;"]
