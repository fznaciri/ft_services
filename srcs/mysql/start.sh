#!/bin/sh
# /etc/init.d/mariadb start
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp ;"
# mysql -u root -e "CREATE USER 'wp-user'@'%' IDENTIFIED BY '123456' ;"
# mysql -u root -e "GRANT ALL ON *.* TO 'wp-user'@'%' ;"
# mysql -u root -e "FLUSH PRIVILEGES ;"
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root' ;"

# /etc/init.d/mariadb restart

rc-service mariadb setup
rc-service mariadb start
mysql -u root -e "CREATE USER 'wpuser'@'%' IDENTIFIED BY '123456';"
mysql -u root -e "CREATE DATABASE wp;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%'; FLUSH PRIVILEGES;"

/etc/init.d/mariadb restart