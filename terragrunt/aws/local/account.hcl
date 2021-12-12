locals {
  root = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

provider_installation = local.root.provider_installation

inputs = merge(
  local.root.inputs,
  {
    account_id = 0000000
  },
)