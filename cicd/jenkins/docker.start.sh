#!/bin/sh
docker rm -f jenkins-devops
docker run -d --name jenkins-devops -p 3000:8080 amitkshirsagar13/devops/jenkins:latest


