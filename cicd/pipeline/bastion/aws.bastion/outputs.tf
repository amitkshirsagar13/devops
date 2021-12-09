output "bastion_server_public_ip" {
  value = aws_spot_instance_request.bastion_server.public_ip
}
