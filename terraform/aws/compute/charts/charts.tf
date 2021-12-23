  // provider "helm" {
  //   kubernetes {
  //     host     = "https://kubernetes.docker.internal:6443"
  //     insecure = true
  //   }
  // }

module "echo-service" {
  source  = "./echo-service"
  chart = var.echo-service
}
