#!bin/sh
kubectl delete -f ./deployement/metallb.yaml
kubectl delete -f ./deployement/nginx.yaml
kubectl delete -f ./deployement/mysql.yaml
kubectl delete -f ./deployement/wordpress.yaml
kubectl delete -f ./deployement/ftps.yaml
kubectl delete -f ./deployement/influxdb.yaml
kubectl delete -f ./deployement/phpmyadmin.yaml
kubectl delete -f ./deployement/grafana.yaml