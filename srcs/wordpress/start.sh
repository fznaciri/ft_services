#!/bin/sh
rm /var/www/wordpress/wp-config-sample.php
rc-status
rc-service php-fpm7 start
rc-service nginx start
# telegraf --config /etc/telegraf/telegraf.conf
# nginx -g "daemon off;"
cat /dev/random