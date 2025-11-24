#!/bin/bash

MYSQL_USER=$(cat /run/secrets/db_user.txt)
MYSQL_PASSWORD=$(cat /run/secrets/db_password.txt)
WP_ADMIN_N=$(cat /run/secrets/wordpress_admin_name.txt)
WP_ADMIN_P=$(cat /run/secrets/wordpress_admin_password.txt)
WP_U_PASS=$(cat /run/secrets/wordpress_user_password.txt)

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress
chmod -R 755 /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress

wp core download --allow-root

wp core config \
	--dbhost=mariadb:3306 \
	--dbname="$MYSQL_DB" \
	--dbuser="$MYSQL_USER" \
	--dbpass="$MYSQL_PASSWORD" \
	--allow-root

wp core install \
	--url="$DOMAIN_NAME" \
	--title="$WP_TITLE" \
	--admin_user="$WP_ADMIN_N" \
	--admin_password="$WP_ADMIN_P" \
	--admin_email="$WP_ADMIN_E" \
	--allow-root

wp user create \
	"$WP_U_NAME" "$WP_U_EMAIL" \
	--user_pass="$WP_U_PASS" \
	--role="$WP_U_ROLE" \
	--allow-root

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
/usr/sbin/php-fpm7.4 -F
