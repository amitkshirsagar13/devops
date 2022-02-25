terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws/infra/s3"
}

locals {
  region = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

# dependencies {
#   paths = ["../infra"]
# }

include {
  path = find_in_parent_folders()
}

inputs = merge(
  local.region.inputs,
  {
    appName = "core",
  },
)