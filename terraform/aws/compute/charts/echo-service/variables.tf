// variable "namespace" {
//   type = string
//   default = var.echo-service["namespace"]
// }

// variable "replicaCount" {
//   type = number
//   default = var.echo-service["replicaCount"]
// }

// variable "autoscaling" {
//   type = bool
//   default = var.echo-service["autoscaling"]
// }

// variable "minReplicas" {
//   type = number
//   default = var.echo-service["minReplicas"]
// }

// variable "maxReplicas" {
//   type = number
//   default = var.echo-service["maxReplicas"]
// }

variable "echo-service" {
  type = object({
    namespace     = optional(string)
    replicaCount  = optional(number)
    autoscaling   = optional(bool)
    minReplicas   = optional(number)
    maxReplicas   = optional(number)
  })
  default = {
    namespace     = "echo"
    replicaCount  = 1
    autoscaling   = false
    minReplicas   = 1
    maxReplicas   = 3
  }
}