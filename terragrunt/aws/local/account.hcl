locals {
  root = read_terragrunt_config(find_in_parent_folders("root.hcl"))
  common = read_terragrunt_config("common.hcl")
}

inputs = merge(
  local.root.inputs,
  local.common.inputs,
  {
    account_id = 0000000
  },
)

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    access_key = "fake-provider-common"
    secret_key = "fake-provider-common"
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