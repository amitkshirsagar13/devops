# Set the generate config dynamically to the generate config in account.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    version = "~> 3.0"
    access_key = "AKIAVIM7ULIMUEALUZ7K"
    secret_key = "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"
  }
  EOF
}