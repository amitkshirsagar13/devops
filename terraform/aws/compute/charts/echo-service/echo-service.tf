resource "helm_release" "echo-service" {
  name       = "echo-service"
  create_namespace = true
  namespace  = "echo"
  chart      = "tools/echo-service"

  values = [
    file("values/echo-service.yaml")
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