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
    value = "${var.replicaCount}"
  }

  set {
    name  = "autoscaling.minReplicas"
    value = "${var.minReplicas}"
  }

  set {
    name  = "autoscaling.maxReplicas"
    value = "${var.maxReplicas}"
  }

  set {
    name  = "autoscaling.enabled"
    value = "${var.autoscaling}"
  }
}