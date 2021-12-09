variable "region" {
    default = "eu-west-1"
}
terraform {}
variable "ssh_pub_key" {
    
}
variable "email" {
    default = "amitkshirsagar13@gmail.com"
}
variable "environment" {
    default = "Integration"
}
variable "timeout" {
    type = number
    default = 60
    description = "shutdown timeout in minutes. defaults to 60m"
}