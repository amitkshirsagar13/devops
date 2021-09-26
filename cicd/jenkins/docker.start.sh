#!/bin/sh
docker rm -f jenkins-devops
docker run -d --name jenkins-devops -e CASC_VAULT_FILE=/var/jenkins_home/seed_secrets/jcasc_vault -p 3000:8080 amitkshirsagar13/devops/jenkins:latest


