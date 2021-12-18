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

  provider "aws" {
    access_key = "fake-access-common"
    secret_key = "fake-secret-common"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoints {
      dynamodb  = "http://localhost:4566"
      ec2       = "http://localhost:4566"
      iam       = "http://localhost:4566"
      kinesis   = "http://localhost:4566"
      lambda    = "http://localhost:4566"
      s3        = "http://localhost:4566"
    }
  }
  EOF
}

# Set the generate config dynamically to the generate config in account.hcl
generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
      bucket         = "k8clusters-terraform-state-local"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "sa-east-1"
      encrypt        = true
      dynamodb_table = "local-terraform-lock-table"
    }
  }
  EOF
}