resource "aws_spot_instance_request" "bastion_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  spot_type     = "one-time"

  subnet_id                   = data.aws_subnet.ops_vpc_subnet.id
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [data.aws_security_group.ops_vpc_sg.id]

  user_data = templatefile("user_data.sh", {
    ssh_pub_key = var.ssh_pub_key
    timeout     = var.timeout
  })

  wait_for_fulfillment = true

  provisioner "local-exec" {
    command = join("_", ["aws ec2 create-tags --resources ${aws_spot_instance_request.bastion_server.spot_instance_id} --tags Key=Name,Value=Bastion_Server", var.environment ,var.email])
  }
}