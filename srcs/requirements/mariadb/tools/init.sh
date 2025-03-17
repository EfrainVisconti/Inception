#!/bin/bash

# Inicia MariaDB en segundo plano
service mariadb start

# Verificar si las variables de entorno están definidas
if [[ -z "${MYSQL_DATABASE}" || -z "${MYSQL_USER}" || -z "${MYSQL_PASSWORD}" ]]; then
    echo "ERROR: Las variables de entorno no están definidas."
    exit 1
fi

# Crear la base de datos y usuario si no existen
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`@'%';"
mariadb -e "FLUSH PRIVILEGES;"

# Apaga MariaDB para reiniciarlo con los cambios
mysqladmin --user=root shutdown

# Inicia MariaDB en primer plano
exec mysqld --port=3306 \
		--bind-address=0.0.0.0 \
		--datadir='/var/lib/mysql' \
		--user=mysql