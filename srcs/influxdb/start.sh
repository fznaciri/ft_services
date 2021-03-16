#!/bin/sh
telegraf --config /etc/telegraf/telegraf.conf
influxd -config /etc/influxdb.conf

# sleep 5;
# while true
# do
#     if [[ -z $(ps | grep influxd | grep -v grep) ]]
#     then
#         echo "PROCESS BEING KILLED"
#         break
#     fi
#     sleep 5;
# done;
cat /dev/random