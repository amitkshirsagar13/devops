#!/bin/sh
docker build -t amitkshirsagar13/devops-jenkins:latest .
docker push amitkshirsagar13/devops-jenkins:latest
if [ "$#" -ne 0 ]; then
  cd slaves
  ./buildSlave.sh
  cd ..
fi
