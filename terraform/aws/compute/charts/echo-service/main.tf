resource "helm_release" "echo-service" {
  name       = "${local.name}"
  create_namespace = true
  chart      = "${local.chartRepo}/${local.chartName}"
  namespace  = "${local.namespace}"

  values = [
    file("${local.name}/values.yaml")
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