default:
  @just --list --unsorted

gpush message:
  git add . && git commit -m "{{message}}" && git push

create libName:
  mkdir -p libraries/{{libName}}/{src,resources,steps}

build-jenkins:
  docker build -t amitkshirsagar13/devops-jenkins:latest ./cicd/jenkins
  docker tag amitkshirsagar13/devops-jenkins:latest amitkshirsagar13/devops-jenkins:production
  docker push amitkshirsagar13/devops-jenkins:latest
  docker push amitkshirsagar13/devops-jenkins:production
  
start-jenkins:
  docker rm -f jenkins-devops
  docker compose -f cicd/jenkins/docker-compose.yml up -d

start-localstack:
  rm -rf /c/Temp/LocalStack
  docker rm -f localstack
  docker run -d --name localstack --restart always \
    -p 4566:4566 \
    -v /c/Temp/LocalStack/:/tmp/localstack/data \
    --env DEBUG=1 --env LOCALSTACK_DATA_DIR=/tmp/localstack/data --env DATA_DIR=/tmp/localstack/data \
    --env LOCALSTACK_DEFAULT_REGION=sa-east-1 --env LOCALSTACK_TMPDIR=/tmp/localstack \
    --env SERVICES=apigateway,cloudfront,cloudwatch,dynamodb,ec2,eks,elb,iam,kms,lambda,rds,route53,route53domains,route53resolver,s3,sns,sqs,stepfunctions,waf,waf-regional,wafv2 \
    --cpus="0.5" --memory="1048m" \
    localstack/localstack:0.14.5

create-terraform-state:
  aws --endpoint-url=http://localhost:4566 s3 mb s3://k8clusters-terraform-state-local
  aws --endpoint-url=http://localhost:4566 dynamodb create-table --table-name local-terraform-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5


cred-argo:
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

cred-jen-kube:
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kube-token-jenkins:
  ./cicd/jenkins/kubeJenkinsAccount.sh

start-vault:
  mkdir -p vault/volumes/config
  mkdir -p vault/volumes/file
  mkdir -p vault/volumes/logs
  ./vault/setup-vault.sh
  docker compose -f ./vault/docker-compose.yml up
