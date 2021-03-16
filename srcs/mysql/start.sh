#!/bin/sh

rc-service mariadb setup
rc-service mariadb start
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY '123456';"
mysql -e "CREATE DATABASE wp;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'localhost';" 
mysql -e "FLUSH PRIVILEGES;"

/etc/init.d/mariadb restart
telegraf --config /etc/telegraf/telegraf.conf

sleep 5;
while true
do
    if [[ -z $(ps | grep mysqld | grep -v grep) ]]
    then
        echo "PROCESS BEING KILLED"
        break
    fi
    sleep 5;
done;

exec 