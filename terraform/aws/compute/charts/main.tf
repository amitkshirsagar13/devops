// provider "helm" {
//   kubernetes {
//     config_path = "~/.kube/config"
//   }
// }

resource "helm_release" "echo-service" {
  name       = "echo-service"
  create_namespace = true
  namespace  = "echo"
  chart      = "tools/echo-service"

  values = [
    file("echo.yaml")
  ]

  set {
    name  = "replicaCount"
    value = "${replicaCount}"
  }

  set {
    name  = "autoscaling.minReplicas"
    value = "${minReplicas}"
  }

  set {
    name  = "autoscaling.maxReplicas"
    value = "${maxReplicas}"
  }

  set {
    name  = "autoscaling.enabled"
    value = "${autoscaling}"
  }
}