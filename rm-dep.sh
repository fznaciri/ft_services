#!bin/sh
kubectl delete -f ./srcs/deployement/metallb.yaml
kubectl delete -f ./srcs/deployement/nginx.yaml
kubectl delete -f ./srcs/deployement/mysql.yaml
kubectl delete -f ./srcs/deployement/wordpress.yaml
kubectl delete -f ./srcs/deployement/ftps.yaml
kubectl delete -f ./srcs/deployement/influxdb.yaml
kubectl delete -f ./srcs/deployement/phpmyadmin.yaml
kubectl delete -f ./srcs/deployement/grafana.yaml