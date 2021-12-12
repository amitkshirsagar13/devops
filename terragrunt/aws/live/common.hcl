# Set the generate config dynamically to the generate config in account.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    version = "~> 3.0"
    aws_access_key = ${aws_access_key}
    aws_secret_key = ${aws_secret_key}
  }
  EOF
}