locals {
  root = read_terragrunt_config(find_in_parent_folders("root.hcl"))
  common = read_terragrunt_config("common.hcl")
}

# Set the generate config dynamically to the generate config in common.hcl
generate = local.common.generate

inputs = merge(
  local.root.inputs,
  local.common.inputs,
  {
    account_id = 0000000
  },
)