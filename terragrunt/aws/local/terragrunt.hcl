locals {
  common = read_terragrunt_config("common.hcl")
}

generate = local.common.generate

inputs = merge(
  yamldecode(file("env.yml")),
  local.common.inputs,
)
