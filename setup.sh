#!/bin/sh
minikube start
eval $(minikube docker-env)

docker build ./srcs/nginx -t nginx-local
# docker build ./srcs/grafana -t grafana-local
# docker build ./srcs/phpmyadmin -t phpmyadmin-local
# docker build ./srcs/wordpress -t wordpress-local
# docker build ./srcs/mysql -t mysql-local
# docker build ./srcs/influxdb -t influxdb-local

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./deployement/metallb.yaml
kubectl apply -f ./deployement/nginx.yaml