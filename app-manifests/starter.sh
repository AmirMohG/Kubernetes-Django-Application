#!/bin/sh
kubectl apply -f pico-configmap.yaml
kubectl apply -f pico-deployment-svc-pvc.yaml
kubectl apply -f nginx/nginx-cm.yaml || kubectl apply -f nginx-cm.yaml
kubectl apply -f nginx/deployment.yaml || kubectl apply -f deployment.yaml
kubectl apply -f pico-ingress.yaml

