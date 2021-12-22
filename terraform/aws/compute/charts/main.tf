provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "echo-service" {
  name       = "echo-service"
  create_namespace = true
  namespace  = "echo"
  chart      = "tools/echo-service"
  values = [
    file("echo.yaml")
  ]
}