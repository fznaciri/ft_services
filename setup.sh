#!/bin/sh
minikube start
eval $(minikube docker-env)

docker build ./srcs/nginx -t nginx-local
# docker build ./srcs/grafana -t grafana-local
docker build ./srcs/phpmyadmin -t phpmyadmin-local
docker build ./srcs/wordpress -t wordpress-local
docker build ./srcs/mysql -t mysql-local
docker build ./srcs/influxdb -t influxdb-local
docker build ./srcs/mysql -t ftps-local

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/metallb.yaml
docker pull metallb/speaker:v0.9.3
docker pull metallb/controller:v0.9.3
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./deployement/metallb.yaml
kubectl apply -f ./deployement/nginx.yaml
kubectl apply -f ./deployement/mysql.yaml
kubectl apply -f ./deployement/phpmyadmin.yaml
kubectl apply -f ./deployement/wordpress.yaml
kubectl apply -f ./deployement/influxdb.yaml
kubectl apply -f ./deployement/ftps.yaml

# load kubernetes dashboard
minikube dashboard &