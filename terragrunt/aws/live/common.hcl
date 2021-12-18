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

# Set the generate config dynamically to the generate config in account.hcl
generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  backend "s3" {
    bucket         = "k8clusters-terraform-state-live"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
    // dynamodb_table = "stage-terraform-lock-table"
  }
  EOF
}