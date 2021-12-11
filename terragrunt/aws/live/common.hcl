generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    access_key = "fake-provider-common"
    secret_key = "fake-provider-common"
  }
  EOF
}