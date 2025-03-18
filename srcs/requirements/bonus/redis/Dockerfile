# Imagen base (penultima version estable de debian).
FROM debian:bullseye

# Actualiza la lista de paquetes disponibles desde los repositorios
# configurados.
# Instala redis-server.
# Limpia la caché de paquetes descargados y elimina los archivos de la lista
# de paquetes.
RUN apt-get update && apt-get install -y --no-install-recommends redis-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# No es necesario en este caso, pero se deja
# como información de lo que contiene el archivo de configuración que viene por defecto.
# COPY redis.conf /etc/redis/redis.conf

# Configura Redis para que escuche en todas las interfaces (0.0.0.0)
RUN sed -i 's/^bind 127.0.0.1 -::1/bind 0.0.0.0/' /etc/redis/redis.conf

# Define el comando por defecto para iniciar Redis
CMD ["redis-server",  "--protected-mode", "no"]
