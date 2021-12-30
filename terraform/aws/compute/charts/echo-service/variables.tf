terraform {
  experiments = [module_variable_optional_attrs] 
}

variable "chart" {
  type = object({
    namespace     = optional(string)
    replicaCount  = optional(number)
    autoscaling   = optional(bool)
    minReplicas   = optional(number)
    maxReplicas   = optional(number)
  })
}

locals {
  namespace     = "${var.chart.namespace}"
  replicaCount  = "${var.chart.replicaCount}"
  autoscaling   = "${var.chart.autoscaling}"
  minReplicas   = "${var.chart.minReplicas}"
  maxReplicas   = "${var.chart.maxReplicas}"
}