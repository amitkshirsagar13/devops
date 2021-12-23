resource "helm_release" "echo-service" {
  name       = "echo-service"
  create_namespace = true
  chart      = "tools/echo-service"
  namespace  = "${var.namespace}"

  values = [
    file("echo-service/values.yaml")
  ]

  set {
    name  = "replicaCount"
    value = "${var.replicaCount}"
  }

  set {
    name  = "autoscaling.enabled"
    value = "${var.autoscaling}"
  }

  set {
    name  = "autoscaling.minReplicas"
    value = "${var.minReplicas}"
  }

  set {
    name  = "autoscaling.maxReplicas"
    value = "${var.maxReplicas}"
  }
}