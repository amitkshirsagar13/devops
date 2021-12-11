locals {
  common_config = read_terragrunt_config("../../../common.hcl")
}

inputs = merge(
  yamldecode(file("env.yml")),
)
