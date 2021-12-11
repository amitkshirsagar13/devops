terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "terragrunt - Running Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "terragrunt - Finished running Terraform"]
    run_on_error = true
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    access_key = "fake-provider"
    secret_key = "fake-provider"
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

inputs = merge(
  yamldecode(file("env.yml")),
)
