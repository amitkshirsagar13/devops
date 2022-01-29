variable "name" {
  type = string
  default = "helm-repo"
}

variable "cluster" {
  type = string
  default = "tooling"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "europe-west2"
}