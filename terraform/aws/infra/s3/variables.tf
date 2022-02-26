variable "name" {
  type = string
  default = "dev"
}

variable "team" {
  type = string
  default = "k8cluster"
}

variable "envName" {
  type = string
  default = "int"
}

variable "versioning" {
  type = bool
  default = false
}

variable "appName" {
  type = string
  default = "demo"
}

variable "description" {
  type = string
  default = "test"
}

variable "access_key" {
  default = "fake"
}
variable "aws_secret_key" {
  default = "fake"
}
variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type= map
  default = {}
}