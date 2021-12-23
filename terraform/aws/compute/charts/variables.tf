variable "namespace" {
  type = string
  default = "default"
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