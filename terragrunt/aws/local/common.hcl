# Set the generate config dynamically to the generate config in account.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    version = "~> 3.0"
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