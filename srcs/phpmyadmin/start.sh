#!/bin/sh
rc-service php-fpm7 start
rc-service nginx start
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random