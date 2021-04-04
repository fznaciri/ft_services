#!bin/sh
eval $(minikube docker-env)
docker build ./srcs/nginx -t nginx-local
docker build ./srcs/grafana -t grafana-local
docker build ./srcs/phpmyadmin -t phpmyadmin-local
docker build ./srcs/wordpress -t wordpress-local
docker build ./srcs/mysql -t mysql-local
docker build ./srcs/influxdb -t influxdb-local
docker build ./srcs/ftps -t ftps-local



kubectl apply -f ./srcs/deployement/metallb.yaml
kubectl apply -f ./srcs/deployement/nginx.yaml
kubectl apply -f ./srcs/deployement/mysql.yaml
kubectl apply -f ./srcs/deployement/phpmyadmin.yaml
kubectl apply -f ./srcs/deployement/wordpress.yaml
kubectl apply -f ./srcs/deployement/influxdb.yaml
kubectl apply -f ./srcs/deployement/ftps.yaml
kubectl apply -f ./srcs/deployement/grafana.yaml 