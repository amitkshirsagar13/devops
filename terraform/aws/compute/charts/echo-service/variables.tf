// variable "namespace" {
//   type = string
//   default = jsondecode(var.echo-service)["namespace"]
// }

// variable "replicaCount" {
//   type = number
//   default = jsondecode(var.echo-service)["replicaCount"]
// }

// variable "autoscaling" {
//   type = bool
//   default = jsondecode(var.echo-service)["autoscaling"]
// }

// variable "minReplicas" {
//   type = number
//   default = jsondecode(var.echo-service)["minReplicas"]
// }

// variable "maxReplicas" {
//   type = number
//   default = jsondecode(var.echo-service)["maxReplicas"]
// }

// terraform {
//   experiments = [module_variable_optional_attrs]
// }

variable "echo-service" {
  type = string
  // default = {
  //   namespace     = "echo"
  //   replicaCount  = 1
  //   autoscaling   = false
  //   minReplicas   = 1
  //   maxReplicas   = 3
  // }
}


locals {
  namespace     = jsondecode("${var.echo-service}")["namespace"]
  replicaCount  = jsondecode("${var.echo-service}")["replicaCount"]
  autoscaling   = jsondecode("${var.echo-service}")["autoscaling"]
  minReplicas   = jsondecode("${var.echo-service}")["minReplicas"]
  maxReplicas   = jsondecode("${var.echo-service}")["maxReplicas"]
}