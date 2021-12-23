provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


module "echo-service" {
  source  = "./echo-service"
}
