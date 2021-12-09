#!/bin/sh
docker build -t amitkshirsagar13/devops-jenkins .
docker push amitkshirsagar13/devops-jenkins
if [ "$#" -ne 0 ]; then
  cd slaves
  ./buildSlave.sh
  cd ..
fi