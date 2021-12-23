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