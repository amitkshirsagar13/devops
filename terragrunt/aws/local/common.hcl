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
      host     = "https://kubernetes.docker.internal:6443"
      insecure = true
    }
  }

  provider "aws" {
    access_key = "fake-access-common"
    secret_key = "fake-secret-common"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoints {
      apigateway      = "http://host.docker.internal:4566"
      cloudformation  = "http://host.docker.internal:4566"
      cloudwatch      = "http://host.docker.internal:4566"
      dynamodb        = "http://host.docker.internal:4566"
      ec2             = "http://host.docker.internal:4566"
      es              = "http://host.docker.internal:4566"
      firehose        = "http://host.docker.internal:4566"
      iam             = "http://host.docker.internal:4566"
      kinesis         = "http://host.docker.internal:4566"
      lambda          = "http://host.docker.internal:4566"
      route53         = "http://host.docker.internal:4566"
      redshift        = "http://host.docker.internal:4566"
      s3              = "http://host.docker.internal:4566"
      secretsmanager  = "http://host.docker.internal:4566"
      ses             = "http://host.docker.internal:4566"
      sns             = "http://host.docker.internal:4566"
      sqs             = "http://host.docker.internal:4566"
      ssm             = "http://host.docker.internal:4566"
      stepfunctions   = "http://host.docker.internal:4566"
      sts             = "http://host.docker.internal:4566"
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
      endpoint                    = "http://host.docker.internal:4566"
      dynamodb_endpoint           = "http://host.docker.internal:4566"
      
      skip_credentials_validation = true
      skip_metadata_api_check     = true
      force_path_style            = true

      bucket         = "k8clusters-terraform-state-local"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "sa-east-1"
      encrypt        = true
      
      dynamodb_table = "local-terraform-lock-table"
    }
  }
  EOF
}