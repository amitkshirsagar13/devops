variable "namespace" {
  type = string
  default = "echo"
}

variable "replicaCount" {
  type = number
  default = 1
}

variable "autoscaling" {
  type = bool
  default = false
}

variable "minReplicas" {
  type = number
  default = 1
}

variable "maxReplicas" {
  type = number
  default = 3
}



variable "echo-service" {
  // type = string
  type = object({
    namespace     = optional(string)
    replicaCount  = optional(number)
    autoscaling   = optional(bool)
    minReplicas   = optional(number)
    maxReplicas   = optional(number)
  })
}


// locals {
//   namespace     = jsondecode("${var.echo-service}")["namespace"]
//   replicaCount  = jsondecode("${var.echo-service}")["replicaCount"]
//   autoscaling   = jsondecode("${var.echo-service}")["autoscaling"]
//   minReplicas   = jsondecode("${var.echo-service}")["minReplicas"]
//   maxReplicas   = jsondecode("${var.echo-service}")["maxReplicas"]
// }

locals {
  namespace     = "${var.echo-service.namespace}"
  replicaCount  = "${var.echo-service.replicaCount}"
  autoscaling   = "${var.echo-service.autoscaling}"
  minReplicas   = "${var.echo-service.minReplicas}"
  maxReplicas   = "${var.echo-service.maxReplicas}"
}