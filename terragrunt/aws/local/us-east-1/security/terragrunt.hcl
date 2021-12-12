terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws/security"
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
  # local.region.inputs,
  {
    application = "platform-sg",
    tags = {
      application = "platform-sg"
    }
  },
)