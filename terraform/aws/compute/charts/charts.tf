  // provider "helm" {
  //   kubernetes {
  //     host     = "https://kubernetes.docker.internal:6443"
  //     insecure = true
  //   }
  // }

module "echo-service" {
  source  = "./echo-service"
  echo-service = var.echo-service
}
