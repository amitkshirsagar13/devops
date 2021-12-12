locals {
  account = read_terragrunt_config(find_in_parent_folders("account.hcl"))
}

# Set the generate config dynamically to the generate config in common.hcl
generate = local.account.generate

inputs = merge(
  local.account.inputs,
  {
    region = "ap-south-1"
  },
)