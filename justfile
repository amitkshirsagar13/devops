default:
  @just --list --unsorted

create libName:
  mkdir -p libraries/{{libName}}/{src,resources,steps}

build-jenkins:
  docker build -t amitkshirsagar13/devops/jenkins:latest ./cicd/jenkins
  
start-jenkins:
  docker rm -f jenkins-devops
  docker run -d --name jenkins-devops -e CASC_VAULT_FILE=/var/jenkins_home/seed_secrets/jcasc_vault -v $(pwd)/libraries:/libraries -p 3000:8080 amitkshirsagar13/devops/jenkins:latest

commit message:
  git add . && git commit -m "{{message}}" && git push

start-vault:
  mkdir -p vault/volumes/config
  mkdir -p vault/volumes/file
  mkdir -p vault/volumes/logs
  ./vault/setup-vault.sh
  docker-compose -f ./vault/docker-compose.yml run
