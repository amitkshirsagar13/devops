#!/bin/sh
docker build -t amitkshirsagar13/devops-jenkins .
cd slaves
./slaves/buildSlave.sh
cd ..