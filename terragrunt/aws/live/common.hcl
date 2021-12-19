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

  provider "helm" {
    kubernetes {
      config_path = "~/.kube/config"
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
      bucket         = "k8clusters-terraform-state-live"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "us-east-1"
      encrypt        = true
      dynamodb_table = "live-terraform-lock-table"
    }
  }
  EOF
}