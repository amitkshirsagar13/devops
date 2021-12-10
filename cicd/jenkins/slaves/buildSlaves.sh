#!/bin/sh

docker build -t amitkshirsagar13/devops-jenkins-agent-generic . -f ./Dockerfile.generic.slave
docker build -t amitkshirsagar13/devops-jenkins-agent-maven . -f ./Dockerfile.mvn.slave
docker build -t amitkshirsagar13/devops-jenkins-agent-terraform . -f ./Dockerfile.terraform.slave

docker push amitkshirsagar13/devops-jenkins-agent-generic
docker push amitkshirsagar13/devops-jenkins-agent-maven
docker push amitkshirsagar13/devops-jenkins-agent-terraform
