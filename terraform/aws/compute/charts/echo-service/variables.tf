terraform {
  experiments = [module_variable_optional_attrs] 
}

variable "chart" {
  type = object({
    chartRepo     = optional(string)
    chartName     = optional(string)
    chartVersion  = optional(string)
    namespace     = optional(string)
    name          = optional(string)
    replicaCount  = optional(number)
    autoscaling   = optional(bool)
    minReplicas   = optional(number)
    maxReplicas   = optional(number)
    ingressHost   = optional(string)
  })
}

locals {
  chartRepo     = "${var.chart.chartRepo}"
  chartName     = "${var.chart.chartName}"
  chartVersion  = "${var.chart.chartVersion}"
  namespace     = "${var.chart.namespace}"
  name          = "${var.chart.name}"
  replicaCount  = "${var.chart.replicaCount}"
  autoscaling   = "${var.chart.autoscaling}"
  minReplicas   = "${var.chart.minReplicas}"
  maxReplicas   = "${var.chart.maxReplicas}"
  ingressHost   = "${var.chart.ingressHost}"
}