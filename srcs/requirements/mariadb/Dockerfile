# Imagen base (penultima version estable de debian).
FROM debian:bullseye

# Actualiza la lista de paquetes disponibles desde los repositorios
# configurados.
# Instala mariadb-server.
# Limpia la caché de paquetes descargados y elimina los archivos de la lista
# de paquetes.
RUN apt-get update && apt-get install -y --no-install-recommends mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia un script de inicialización desde el contexto de construcción.
COPY tools/init.sh /init.sh

RUN chmod +x /init.sh

# Definir el comando de inicio para ejecutar el script
CMD ["/init.sh"]
