# Set the generate config dynamically to the generate config in account.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "3.69.0"
      }
    }
  }
  EOF
}