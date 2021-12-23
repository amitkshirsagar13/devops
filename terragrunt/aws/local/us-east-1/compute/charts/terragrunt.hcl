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
  {
    application = "platform",
    echo-service-autoscaling= true,
    echo-service-namespace= "echo",
    echo-service-minReplicas= 1,
    echo-service-maxReplicas= 4,
    echo-service-replicaCount= 2,
    tags = {
      application = "platform"
    }
  },
)