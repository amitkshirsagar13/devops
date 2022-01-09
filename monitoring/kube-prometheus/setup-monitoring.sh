#!/bin/sh
kubectl create namespace monitoring
kubectl apply -f prometheus-configmap.yaml
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f kube-state-metrics-configs/
kubectl apply -f kubernetes-alert-manager/
kubectl apply -f kubernetes-node-exporter/
kubectl apply -f kubernetes-grafana/