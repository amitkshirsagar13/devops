locals {
  root_config = read_terragrunt_config("../root.hcl")
}

inputs = merge(
  local.root_config.inputs,
  yamldecode(file("env.yml")),
)
