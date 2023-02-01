#!/bin/sh

WORDPRESS_PATH="/var/www/wordpress/wordpress"

if [ ! -d "$WORDPRESS_PATH" ]; then
	# Install wp-cli
	curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	# Install WordPress
	wp core download --path="$WORDPRESS_PATH"
	wp config create --path="$WORDPRESS_PATH"\
					 --dbname="$WP_DB_NAME" \
					 --dbuser="$WP_ADMIN" \
					 --dbpass="$WP_ADMIN_PASSWORD" \
					 --dbhost="$MARIADB_HOSTNAME"
	wp core install --path="$WORDPRESS_PATH" \
					--url="$WP_URL" \
					--title="$WP_TITLE" \
					--admin_user="$WP_ADMIN" \
					--admin_password="$WP_ADMIN_PASSWORD" \
					--admin_email="$WP_ADMIN_EMAIL"
fi

php-fpm7
