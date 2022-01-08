default:
  @just --list --unsorted

gpush message:
  git add . && git commit -m "{{message}}" && git push

create libName:
  mkdir -p libraries/{{libName}}/{src,resources,steps}

build-jenkins:
  docker build -t amitkshirsagar13/devops/jenkins:latest ./cicd/jenkins
  
start-jenkins:
  docker rm -f jenkins-devops
  docker compose -f cicd/jenkins/docker-compose.yml up

cred-argo:
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

cred-jen-kube:
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

start-vault:
  mkdir -p vault/volumes/config
  mkdir -p vault/volumes/file
  mkdir -p vault/volumes/logs
  ./vault/setup-vault.sh
  docker compose -f ./vault/docker-compose.yml up
