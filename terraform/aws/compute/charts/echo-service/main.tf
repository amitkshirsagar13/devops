resource "helm_release" "echo-service" {
  name       = "echo-service"
  create_namespace = true
  chart      = "tools/echo-service"
  namespace  = "${local.namespace}"

  values = [
    file("echo-service/values.yaml")
  ]

  set {
    name  = "replicaCount"
    value = "${local.replicaCount}"
  }

  set {
    name  = "autoscaling.enabled"
    value = "${local.autoscaling}"
  }

  set {
    name  = "autoscaling.minReplicas"
    value = "${local.minReplicas}"
  }

  set {
    name  = "autoscaling.maxReplicas"
    value = "${local.maxReplicas}"
  }
}