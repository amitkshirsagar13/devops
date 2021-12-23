resource "helm_release" "echo-service" {
  name       = "echo-service"
  create_namespace = true
  chart      = "tools/echo-service"

  values = [
    file("echo-service/values.yaml")
  ]

  set {
    name  = "namespace"
    value = "${var.echo-service.namespace}"
  }

  set {
    name  = "replicaCount"
    value = "${var.echo-service.replicaCount}"
  }

  set {
    name  = "autoscaling.minReplicas"
    value = "${var.echo-service.minReplicas}"
  }

  set {
    name  = "autoscaling.maxReplicas"
    value = "${var.echo-service.maxReplicas}"
  }

  set {
    name  = "autoscaling.enabled"
    value = "${var.echo-service.autoscaling}"
  }
}