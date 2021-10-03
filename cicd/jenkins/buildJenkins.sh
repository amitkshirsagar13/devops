#!/bin/sh
docker build -t amitkshirsagar13/devops-jenkins .
cd slaves
./buildSlave.sh
cd ..
docker-compose up |tee jenkins.log