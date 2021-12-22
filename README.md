#
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/amitkshirsagar13/devops?style=for-the-badge&logo=github)](https://www.codefactor.io/repository/github/amitkshirsagar13/devops)
[![GitHub Last Update](https://img.shields.io/github/last-commit/amitkshirsagar13/devops?style=for-the-badge&logo=github)](https://github.com/amitkshirsagar13/devops)
[![GitHub issues](https://img.shields.io/github/issues/amitkshirsagar13/devops?style=for-the-badge&logo=github)](https://github.com/amitkshirsagar13/devops/issues)

[![DockerHub](https://img.shields.io/docker/automated/amitkshirsagar13/devops-jenkins?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/amitkshirsagar13/devops-jenkins)
[![DockerHub](https://img.shields.io/docker/image-size/amitkshirsagar13/devops-jenkins?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/ealen/echo-server)
[![DockerHub](https://img.shields.io/docker/pulls/amitkshirsagar13/devops-jenkins?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/amitkshirsagar13/devops-jenkins)

# devops
### Build jenkins images
  - [Jenkins ReadMe](./cicd/jenkins/readme.md)
    
    ```
      # Master
      docker build -t amitkshirsagar13/devops-jenkins:latest .
      docker push amitkshirsagar13/devops-jenkins:latest
      # Slave
      docker build -t amitkshirsagar13/devops-jenkins-agent-docker:latest -f ./cicd/jenkins/Dockerfile.slave .
      docker push amitkshirsagar13/devops-jenkins-agent-docker:latest
    ```

### Monitoring/Logging

### Terraform



#### Helm Deployments commands

```
helm install echo-service --namespace echo ./echo-service
helm upgrade echo-service --namespace echo ./echo-service
helm delete echo-service
```

### Terragrunt

### Cloud

### XXXX
```
  kubectl get deployments --all-namespaces -o custom-columns=NAME:.metadata.name,REPLICA:.spec.replicas,CONTAINER:".spec.template.spec.containers[*].name",RCPU:".spec.template.spec.containers[*].resources.requests.cpu",RMEMORY:".spec.template.spec.containers[*].resources.requests.memory",LCPU:".spec.template.spec.containers[*].resources.limits.cpu",LMEMORY:".spec.template.spec.containers[*].resources.limits.memory"|tr -s "," "|"

  kubectl create -f https://raw.githubusercontent.com/pythianarora/total-practice/master/sample-kubernetes-code/metrics-server.yaml
  kubectl top pods --all-namespaces

  kubectl get deployments --all-namespaces -o custom-columns=NAME:.metadata.name,REPLICA:.spec.replicas,CONTAINER:".spec.template.spec.containers[*].name",RCPU:".spec.template.spec.containers[*].resources.requests.cpu",RMEMORY:".spec.template.spec.containers[*].resources.requests.memory",LCPU:".spec.template.spec.containers[*].resources.limits.cpu",LMEMORY:".spec.template.spec.containers[*].resources.limits.memory"|tr -s "," "|"|tr -s " " "," > deployment.csv
```