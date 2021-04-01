#!bin/sh
kubectl apply -f ./deployement/metallb.yaml
kubectl apply -f ./deployement/nginx.yaml
kubectl apply -f ./deployement/mysql.yaml
kubectl apply -f ./deployement/wordpress.yaml