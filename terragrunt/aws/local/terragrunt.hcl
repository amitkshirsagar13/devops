locals {
  root_config = read_terragrunt_config("../../../root.hcl")
  common_config = read_terragrunt_config("../../common.hcl")
  region_config = read_terragrunt_config("../region.hcl")
}

inputs = merge(
  yamldecode(file("env.yml")),
)
