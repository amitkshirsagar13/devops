variable "http" {
  type = number
  default = 80
}

variable "https" {
  type = number
  default = 443
}

variable "level" {
  type = string
  default = "int"
}

variable "team" {
  type = string
  default = "amn"
}

variable "application" {
  type = string
  default = "monolith"
}

variable "type" {
  type = string
  default = "web"
}

variable "versioning" {
  type = bool
  default = false
}

variable "description" {
  type = string
  default = "test"
}

variable "access_key" {
  default = "fake"
}
variable "secret_key" {
  default = "fake"
}
variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type= map
}