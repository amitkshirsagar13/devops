terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws/compute/charts"
}

locals {
  region = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

# dependencies {
#   paths = ["../infra"]
# }

include {
  path = find_in_parent_folders()
}

inputs = merge(
  local.region.inputs,
  yamldecode(file("values.yml")),
  // {
  //   autoscaling = true,
  //   namespace = "echo",
  //   minReplicas = 1,
  //   maxReplicas = 4,
  //   replicaCount = 2,
  // },
)