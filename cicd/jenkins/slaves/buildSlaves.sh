#!/bin/sh

docker build -t amitkshirsagar13/devops-jenkins-agent-generic:latest . -f ./Dockerfile.generic.slave
docker build -t amitkshirsagar13/devops-jenkins-agent-maven:latest . -f ./Dockerfile.mvn.slave
docker build -t amitkshirsagar13/devops-jenkins-agent-terraform:latest . -f ./Dockerfile.terraform.slave

docker push amitkshirsagar13/devops-jenkins-agent-generic:latest
docker push amitkshirsagar13/devops-jenkins-agent-maven:latest
docker push amitkshirsagar13/devops-jenkins-agent-terraform:latest
