#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mariadb-install-db --user="mysql" --datadir="/var/lib/mysql"

	mariadbd --user=mysql --bootstrap << END
		-- Reload all privileges
		FLUSH PRIVILEGES;

		-- Remove anonymous users
		DELETE FROM mysql.user
			   WHERE User='';

		-- Set password for the root user
		ALTER USER 'root'@'localhost'
			  IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';

		-- Disallow root remote login
		DELETE FROM mysql.user
			   WHERE User='root'
					 AND Host NOT IN ('localhost', '127.0.0.1', '::1');

		DROP DATABASE IF EXISTS test;

		CREATE DATABASE $WP_DB_NAME;

		CREATE USER '$WP_ADMIN'
			   IDENTIFIED BY '$WP_ADMIN_PASSWORD';

		GRANT ALL PRIVILEGES
		  	  ON $WP_DB_NAME.*
			  TO '$WP_ADMIN'
			  IDENTIFIED BY '$WP_ADMIN_PASSWORD';
END
fi

mariadbd-safe --datadir="/var/lib/mysql"
