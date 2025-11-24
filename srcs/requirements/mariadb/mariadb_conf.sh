#!/bin/bash

MYSQL_USER=$(cat /run/secrets/db_user.txt)
MYSQL_PASSWORD=$(cat /run/secrets/db_password.txt)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password.txt)

service mariadb start
sleep 5

echo "Waiting for MariaDB complete setup"
while ! mariadb -u root -e "SELECT 1" &>/dev/null; do
	sleep 1
done
echo "MariaDB ready!"

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
