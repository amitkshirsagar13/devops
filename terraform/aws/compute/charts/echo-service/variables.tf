terraform {
  experiments = [module_variable_optional_attrs] 
}

variable "echo-service" {
  type = object({
    namespace     = optional(string)
    replicaCount  = optional(number)
    autoscaling   = optional(bool)
    minReplicas   = optional(number)
    maxReplicas   = optional(number)
  })
}

locals {
  namespace     = "${var.echo-service.namespace}"
  replicaCount  = "${var.echo-service.replicaCount}"
  autoscaling   = "${var.echo-service.autoscaling}"
  minReplicas   = "${var.echo-service.minReplicas}"
  maxReplicas   = "${var.echo-service.maxReplicas}"
}