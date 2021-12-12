# Set the generate config dynamically to the generate config in account.hcl
generate = local.region.generate

inputs = merge(
  yamldecode(file("env.yml")),
)
