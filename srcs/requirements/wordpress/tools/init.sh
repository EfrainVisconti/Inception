#!/bin/bash

# while ! mysqladmin ping -h $WORDPRESS_DB_HOST --silent; do
#     sleep 3;
#     done;
sleep 10;
# Instalar WordPress
wp core install \
--url=$DOMAIN_NAME --title="$WP_TITLE" \
--admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD \
--admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# Crear usuario adicional
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root;

# Instala el plugin Redis Object Cache y lo activa
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

exec /usr/sbin/php-fpm7.4 -F