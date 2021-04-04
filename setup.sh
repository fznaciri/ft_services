#!/bin/sh
minikube start --driver=virtualbox
eval $(minikube docker-env)
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/deployement/metallb.yaml
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/nginx/site.conf
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/ftps/vsftpd.conf
sed -E -i '' "s/[0-9]{2,3}\.[0-9]{2,3}\.[0-9]{1,3}\.[0-9]{1,3}/$(minikube ip)/g" srcs/mysql/wp.sql
#Build Containers
docker build ./srcs/nginx -t nginx-local
docker build ./srcs/grafana -t grafana-local
docker build ./srcs/phpmyadmin -t phpmyadmin-local
docker build ./srcs/wordpress -t wordpress-local
docker build ./srcs/mysql -t mysql-local
docker build ./srcs/influxdb -t influxdb-local
docker build ./srcs/ftps -t ftps-local

#Metrics Deployement
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml

#Apply deployement
kubectl apply -f ./srcs/deployement/metallb.yaml
kubectl apply -f ./srcs/deployement/nginx.yaml
kubectl apply -f ./srcs/deployement/mysql.yaml
kubectl apply -f ./srcs/deployement/phpmyadmin.yaml
kubectl apply -f ./srcs/deployement/wordpress.yaml
kubectl apply -f ./srcs/deployement/influxdb.yaml
kubectl apply -f ./srcs/deployement/ftps.yaml
kubectl apply -f ./srcs/deployement/grafana.yaml 

# load kubernetes dashboard
minikube dashboard &