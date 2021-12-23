variable "echo-service-namespace" {
  type = string
  default = "echo"
}

variable "echo-service-replicaCount" {
  type = number
  default = 1
}

variable "echo-service-autoscaling" {
  type = bool
  default = false
}

variable "echo-service-minReplicas" {
  type = number
  default = 1
}

variable "echo-service-maxReplicas" {
  type = number
  default = 3
}

locals {
  namespace     = "${var.echo-service-namespace}"
  replicaCount  = "${var.echo-service-replicaCount}"
  autoscaling   = "${var.echo-service-autoscaling}"
  minReplicas   = "${var.echo-service-minReplicas}"
  maxReplicas   = "${var.echo-service-maxReplicas}"
}