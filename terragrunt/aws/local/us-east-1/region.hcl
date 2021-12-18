locals {
  account = read_terragrunt_config(find_in_parent_folders("account.hcl"))
}

inputs = merge(
  local.account.inputs,
  {
    region = "sa-east-1"
  },
)