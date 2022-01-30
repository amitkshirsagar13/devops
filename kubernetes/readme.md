# docker-desktop Ingress

- Add echo.k8m.k8cluster.io to hostname
- By default 80/443 are forwarding requests to docker-desktop kubernetes ingress will get requests


```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.48.1/deploy/static/provider/cloud/deploy.yaml
```

## Install Cluster Tools
### Tooling
- argo-cd

    Run below commands to install or update
    ```
    helm install argo-cd argo-cd -n tooling 

    helm uninstall argo-cd -n tooling 
    kubectl -n tooling get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

    ```

### Networking
- gloo

    Run below commands to install or update
    ```
    helm install gloo . --namespace gloo-system

    helm uninstall gloo --namespace gloo-system
    ```

### Monitoring
- prometheus

    Run below commands to install or update
    ```
    helm install kube-prometheus-stack kube-prometheus-stack --namespace monitoring

    helm uninstall kube-prometheus-stack --namespace monitoring
    ```