#!/bin/sh
/usr/sbin/php-fpm7
telegraf --config /etc/telegraf/telegraf.conf
nginx -g "daemon off;"
