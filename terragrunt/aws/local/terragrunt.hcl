locals {
  root_config = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

locals {
  # Load the data from common.hcl
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

# Set the generate config dynamically to the generate config in common.hcl
generate = local.common.generate

inputs = merge(
  local.root_config.inputs,
  yamldecode(file("env.yml")),
)
