terraform {
  source = "git::https://github.com/amitkshirsagar13/terraform.git//aws/compute/eks"
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
  yamldecode(file("values.yml")),
  {
    new = "new",
    old = "old",
  },
)