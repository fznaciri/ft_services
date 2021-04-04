#!/bin/sh

# telegraf --config /etc/telegraf/telegraf.conf
# rc-service grafana-server start
# rc-service grafana-server status
rc-service telegraf start
addgroup -S grafana
adduser -G grafana -S grafana
chown -R grafana:grafana /grafana-7.4.3
cd /grafana-7.4.3/bin
/telegraf/usr/bin/telegraf --config /telegraf.conf & ./grafana-server web

cat /dev/random