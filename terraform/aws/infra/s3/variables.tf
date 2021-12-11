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
  default = "int"
}

variable "application" {
  type = string
  default = "demo"
}

variable "description" {
  type = string
  default = "test"
}

variable "aws_access_key" {
  default = "fake"
}
variable "aws_secret_key" {
  default = "fake"
}
variable "region" {
  default = "us-east-1"
}