#!/bin/sh
docker rm -f jenkins-devops
docker run -d --name jenkins-devops \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /var/jenkins:/var/jenkins_home \
-e CASC_VAULT_FILE=/var/jenkins_home/seed_secrets/jcasc_vault \
-p 5000:5000 -p 3000:8080 -p 50000:50000 \
amitkshirsagar13/devops/jenkins:latest
