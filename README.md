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

dddd