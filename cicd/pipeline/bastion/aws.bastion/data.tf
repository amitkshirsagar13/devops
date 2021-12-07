data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20*.0-x86_64-gp2"]
  }
}

data "aws_vpc" "ops_vpc" {
  filter {
    name = "tag:Environment"
    values = [var.environment]
  }
}

data "aws_subnet" "ops_vpc_subnet" {
  vpc_id = data.aws_vpc.ops_vpc.id
  filter {
    name = "tag:Environment"
    values = [var.environment]
  }
  filter {
    name = "tag:Type"
    values = ["Public"]
  }
}

data "aws_security_group" "ops_vpc_sg" {
  vpc_id = data.aws_vpc.ops_vpc.id
  filter {
    name = "tag:Name"
    values = ["Bastion_Server"]
  }
}
                