# Imagen base (penultima version estable de debian).
FROM debian:bullseye

# Actualiza la lista de paquetes disponibles desde los repositorios
# configurados.
# Instala nginx (el servidor web) y openssl (herramienta para generar
# certificados SSL/TLS).
# Limpia la caché de paquetes descargados y elimina los archivos de la lista
# de paquetes.
RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crea el directorio donde se almacenará el certificado SSL y la clave privada.
# Genera una clave privada RSA de 4096 bits.
# Genera un certificado autofirmado con OpenSSL válido para conexiones HTTPS.
RUN mkdir /etc/nginx/ssl && \
	openssl req -x509 -nodes -newkey rsa:4096 \
	-keyout /etc/nginx/ssl/PrivateKey.key \
	-out /etc/nginx/ssl/SelfSignedCertificate.crt \
	-subj "/C=ES/ST=Vizcaya/L=Urduliz/O=42/CN=eviscont.42.fr" \
	-days 365

# Copia un archivo de configuración personalizado desde el contexto
# de construcción a la ubicación estándar de configuración de Nginx.
COPY conf/default.conf /etc/nginx/sites-available/default

# Especifica el comando que se ejecutará cuando el contenedor inicie:
# -g "daemon off;": ejecuta Nginx en el primer plano para que el proceso
# principal del contenedor siga activo.
CMD ["nginx", "-g", "daemon off;"]
