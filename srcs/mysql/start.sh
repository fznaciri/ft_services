#!/bin/sh
#install and start services
mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
exec /usr/bin/mysqld -u root &
sleep 5
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp ;"
mysql -u root -e "CREATE USER 'wp-user'@'%' IDENTIFIED BY '123456' ;"
mysql -u root -e "GRANT ALL ON wp.* TO 'wp-user'@'%' ; FLUSH PRIVILEGES ;"
mysql -uroot wp </wp.sql
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random