#!/bin/sh
#install and start services
mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
exec /usr/bin/mysqld -u root &
sleep 5
# rc-status
# touch /run/openrc/softlevel
# /etc/init.d/mariadb setup
# rc-service mariadb start
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp ;"
mysql -u root -e "CREATE USER 'wp-user'@'%' IDENTIFIED BY '123456' ;"
mysql -u root -e "GRANT ALL ON wp.* TO 'wp-user'@'%' ; FLUSH PRIVILEGES ;"
mysql -uroot wp </wp.sql
# /etc/init.d/mariadb restart
cat /dev/random

# rc-service mariadb setup
# rc-service mariadb start
# mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY '123456';"
# mysql -e "CREATE DATABASE wp;"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'localhost';" 
# mysql -e "FLUSH PRIVILEGES;"

# /etc/init.d/mariadb restart
# # telegraf --config /etc/telegraf/telegraf.conf

# sleep 5;
# while true
# do
#     if [[ -z $(ps | grep mysqld | grep -v grep) ]]
#     then
#         echo "PROCESS BEING KILLED"
#         break
#     fi
#     sleep 5;
# done;

# exec 