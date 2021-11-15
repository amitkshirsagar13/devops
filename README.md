# devops
### Build jenkins images
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

### Cloud


### XXXX

kubectl get deployments -o custom-columns=NAME:.metadata.name,REPLICA:.spec.replicas,CONTAINER:".spec.template.spec.containers[*].name",RCPU:".spec.template.spec.containers[*].resources.requests.cpu",RMEMORY:".spec.template.spec.containers[*].resources.requests.memory",LCPU:".spec.template.spec.containers[*].resources.limits.cpu",LMEMORY:".spec.template.spec.containers[*].resources.limits.memory"|tr -s "," "|"

kubectl create -f https://raw.githubusercontent.com/pythianarora/total-practice/master/sample-kubernetes-code/metrics-server.yaml
kubectl top pods 
