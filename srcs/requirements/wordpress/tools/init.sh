while ! mysqladmin ping -h $WORDPRESS_DB_HOST --silent; do
    sleep 3;
    done;

# Instalar WordPress
wp core install \
--url=$DOMAIN_NAME --title="$WP_TITLE" \
--admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD \
--admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# Crear usuario adicional
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root;

php-fpm -F