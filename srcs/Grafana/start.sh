#!/bin/sh

telegraf --config /etc/telegraf/telegraf.conf
rc-service grafana-server start
rc-service grafana-server status

cat /dev/random