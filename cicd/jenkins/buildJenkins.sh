#!/bin/sh
docker build -t amitkshirsagar13/devops-jenkins:latest .
docker tag amitkshirsagar13/devops-jenkins:latest amitkshirsagar13/devops-jenkins:production
docker push amitkshirsagar13/devops-jenkins:latest
docker push amitkshirsagar13/devops-jenkins:production
if [ "$#" -ne 0 ]; then
  cd slaves
  ./buildSlave.sh
  cd ..
fi
