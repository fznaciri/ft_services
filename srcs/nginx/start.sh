#!/bin/sh
/usr/sbin/sshd -D
telegraf --config /etc/telegraf/telegraf.conf
nginx -g "daemon off;"