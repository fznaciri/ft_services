#!/bin/sh
rc-status
rc-service php-fpm7 start
rc-service nginx start
telegraf --config /etc/telegraf/telegraf.conf
# nginx -g "daemon off;"
cat /dev/random