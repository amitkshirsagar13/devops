#!/bin/sh
docker run -d --name jenkins-devops -v $(pwd)/libraries:/libraries -p 3000:8080 amitkshirsagar13/devops/jenkins:latest


