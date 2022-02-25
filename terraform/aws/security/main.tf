resource "aws_security_group" "sg" {
  name = "ec2-${var.appName}-${var.envName}-${var.region}-${var.team}"

  # inbound HTTP/HTTPS from anywhere
  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound ssh from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"]
  }

  // Terraform removes the default rule
  egress {
   from_port    = 0
   to_port      = 0
   protocol     = "-1"
   cidr_blocks  = ["0.0.0.0/0"]
 }

  tags = local.tags
}

locals {
  tags = {
    Name = concat(${var.appName}, "-", ${var.envName}, "-", ${var.region}, "-", ${var.team})
    // Name = "${var.appName}-${var.envName}-${var.region}-${var.team}"
    envName = "${var.envName}"
    team = "${var.team}"
    appName = "${var.appName}"
  }
}