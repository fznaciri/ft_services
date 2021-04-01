#!bin/sh
kubectl delete -f ./deployement/metallb.yaml
kubectl delete -f ./deployement/nginx.yaml
kubectl delete -f ./deployement/mysql.yaml
kubectl delete -f ./deployement/wordpress.yaml