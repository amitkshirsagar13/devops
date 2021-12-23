### Create jenkins/helm/kubernetes service account
```
kubectl -n helm create serviceaccount jenkins-robot
kubectl -n helm create rolebinding jenkins-robot-binding --clusterrole=cluster-admin --serviceaccount=helm:jenkins-robot
kubectl -n helm get serviceaccount jenkins-robot -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}'
kubectl -n helm get secrets jenkins-robot-token-d6d8z -o go-template --template '{{index .data "token"}}' | base64 -d
```

### Update ingress
```
cat << EOF > prometheous-ingress.yml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: prom-ingress
  namespace: ame
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
spec:
  rules:
  # http://prom.local
  - host: prom.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: prometheus-operator-grafana
            port:
              number: 80
  # http://prom-kube.local
  - host: prom-kube.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: prometheus-operator-kube-state-metrics
            port:
              number: 8080
  # http://prom-operator.local
  - host: prom-operator.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: prometheus-operator-prometheus
            port:
              number: 9090
  # http://prom-alert.local
  - host: prom-alert.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: prometheus-operator-alertmanager
            port:
              number: 9093
EOF
```

### Update hosts file
```
127.0.0.1 echo-service.local prom.local prom-kube.local prom-alert.local
```

### Prometheus-Operator
```
kubectl create namespace ame
helm install -name prometheus-operator stable/prometheus-operator
```
 - Grafana| `admin` | `prom-operator`