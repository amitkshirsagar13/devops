locals {
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

generate = local.common.generate

inputs = merge(
  yamldecode(file("env.yml")),
  local.common.inputs,
)
