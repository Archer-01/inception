#!/bin/sh

while ! mariadb -h$MARIADB_HOSTNAME -u$WP_ADMIN -p$WP_ADMIN_PASSWORD $WP_DB_NAME &> /dev/null 2>&1; do
	sleep 1
done

if [ ! -f "/var/www/html/index.html" ]; then
	mv /tmp/index.html /var/www/html/
	mv /tmp/style.css /var/www/html/

	# Install WordPress
	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME \
					 --dbuser=$WP_ADMIN \
					 --dbpass=$WP_ADMIN_PASSWORD \
					 --dbhost=$MARIADB_HOSTNAME \
					 --allow-root
	wp core install --url=$WP_URL/wordpress \
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

	# Install Redis plugin
	wp plugin install "redis-cache" --activate --allow-root
	wp config set "WP_REDIS_HOST" $REDIS_HOST --allow-root
	wp config set "WP_REDIS_PORT" 6379 --raw --allow-root
	wp config set "WP_REDIS_TIMEOUT" 1 --raw --allow-root
	wp config set "WP_REDIS_READ_TIMEOUT" 1 --raw --allow-root
	wp config set "WP_REDIS_DATABASE" 0 --raw --allow-root

	mkdir -p /var/www/html/adminer
	curl "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php" \
		 --output /var/www/html/adminer/index.php --location
	curl "https://raw.githubusercontent.com/dracula/adminer/4cc3128f0e641ab94ac5e37125661b9b833579fe/theme/adminer.css" \
		 --output /var/www/html/adminer/adminer.css --location

	chown -R nginx:nginx "/var/www/html"
fi

wp redis enable --allow-root
php-fpm7
