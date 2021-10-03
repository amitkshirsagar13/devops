#!/bin/sh

docker build -t amitkshirsagar13/devops-jenkins-agent-docker . -f ./Dockerfile.generic.slave
docker build -t amitkshirsagar13/devops-jenkins-agent-maven . -f ./Dockerfile.mvn.slave

docker push amitkshirsagar13/devops-jenkins-agent-docker
docker push amitkshirsagar13/devops-jenkins-agent-maven
