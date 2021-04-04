#!/bin/sh

rc-status
rc-service nginx start
rc-service sshd start
/telegraf/usr/bin/telegraf --config /telegraf.conf
cat /dev/random