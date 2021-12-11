generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    access_key = "fake-provider"
    secret_key = "fake-provider"
  }
  EOF
}

inputs = merge(
  yamldecode(file("env.yml")),
  {
    level = "live-parent"
  }
)
