#!/bin/sh
rm /var/www/wordpress/wp-config-sample.php
rc-status
rc-service php-fpm7 start
rc-service nginx start
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random