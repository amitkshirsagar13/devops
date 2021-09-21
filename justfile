default:
@just --list --unsorted

create libName:
  mkdir -p libraries/{{libName}}/{src,resources,steps}

start-jenkins:
  docker build -t amitkshirsagar13/devops/jenkins:latest ./cicd/jenkins
  docker rm -f jenkins-devops
  docker run -d --name jenkins-devops -v $(pwd)/libraries:/libraries -p 3000:8080 amitkshirsagar13/devops/jenkins:latest