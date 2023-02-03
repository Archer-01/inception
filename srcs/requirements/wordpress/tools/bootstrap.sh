#!/bin/sh

if [ ! -f "/var/www/html/index.html" ]; then
	chown -R nginx:nginx "/var/www/html"

	mv /tmp/index.html /var/www/html/

	# Install WordPress
	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME \
					 --dbuser=$WP_ADMIN \
					 --dbpass=$WP_ADMIN_PASSWORD \
					 --dbhost=$MARIADB_HOSTNAME \
					 --allow-root

	wp core install --url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email \
					--allow-root

	wp user create $WP_USER \
				   $WP_USER_EMAIL \
				   --role=author \
				   --user_pass=$WP_USER_PASSWORD \
				   --allow-root
fi

php-fpm7
