#!/bin/sh

rc-status
rc-service nginx start

telegraf --config /etc/telegraf/telegraf.conf
/usr/sbin/sshd -D
#nginx -g "daemon off;"
# while true
# do 
# sleep 1;
# done