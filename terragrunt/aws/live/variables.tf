variable "name" {
  type = string
  default = "dev"
}

variable "team" {
  type = string
  default = "k8cluster"
}

variable "level" {
  type = string
  default = "live"
}

variable "application" {
  type = string
  default = "demo"
}

variable "description" {
  type = string
  default = "Production level cluster"
}

variable "aws_access_key" {
  default = "prod-fake"
}
variable "aws_secret_key" {
  default = "prod-fake"
}
variable "region" {
  default = "us-east-1"
}