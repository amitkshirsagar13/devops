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

locals {
  namespace     = "${var.namespace}"
  replicaCount  = "${var.replicaCount}"
  autoscaling   = "${var.autoscaling}"
  minReplicas   = "${var.minReplicas}"
  maxReplicas   = "${var.maxReplicas}"
}