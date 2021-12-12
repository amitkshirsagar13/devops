resource "aws_security_group" "sg" {
  name = "ec2-${var.level}-${var.team}-${var.application}-${var.type}"

  # inbound HTTP/HTTPS from anywhere
  ingress {
    name        = "ingress-http"
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    name        = "ingress-https"
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound ssh from anywhere
  ingress {
    name        = "ingress-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"]
  }

  // Terraform removes the default rule
  egress {
    name        = "egress-all"
   from_port    = 0
   to_port      = 0
   protocol     = "-1"
   cidr_blocks  = ["0.0.0.0/0"]
 }

  tags = local.tags
}

locals {
  tags = {
    Name = "${var.team}-${var.level}-${var.region}-${var.type}"
    level = "${var.level}"
    team = "${var.team}"
    application = "${var.application}"
    type = "${var.type}"
  }
}