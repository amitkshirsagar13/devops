variable "appName" {
  type= string
}

variable "team" {
  type= string
}

variable "envName" {
  type= string
}

variable "region" {
  type= string
}

variable "description" {
  type= string
  default = "description"
}

variable "http" {
  type = number
  default = 80
}

variable "https" {
  type = number
  default = 443
}

variable "access_key" {
  default = "fake"
}
variable "secret_key" {
  default = "fake"
}

variable "tags" {
  type = map(string)
  default = {
  }
}
