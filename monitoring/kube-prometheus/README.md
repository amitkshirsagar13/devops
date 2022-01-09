# Monitoring Kubernetes Cluster
- [`prometheus-monitoring`](https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/)

## prometheus setup
prometheus kubernetes deployment configs

```
kubectl apply -f prometheus.yaml

kubectl get deployments prometheus -n monitoring
```
All the kube static metrics can be obtained from the kube state service endpoint on /metrics URI.
- [`prometheus`](http://prometheus.localtest.me)

## kube-state-metrics-configs
Kube state metrics kubernetes deployment configs

```
kubectl apply -f kube-state-metrics-configs/

kubectl get deployments kube-state-metrics -n kube-system
```
All the kube static metrics can be obtained from the kube state service endpoint on /metrics URI.
- [`kube-state-metrics`](http://kube-state-metrics.localtest.me/metrics)

## kubernetes-alert-manager
Alert Manager Manifests for Kubnernetes

## kubernetes-grafana
Read about the grafana implementation on Kubernetes here https://devopscube.com/setup-grafana-kubernetes/
- [`grafana`](http://grafanas.localtest.me)

## kubernetes-node-exporter
