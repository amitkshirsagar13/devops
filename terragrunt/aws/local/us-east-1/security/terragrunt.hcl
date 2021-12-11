terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws/security"
}

# dependencies {
#   paths = ["../infra"]
# }

import "region" {
  config_path = "../region.hcl"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  application = "platform-sg"
  tags = {
    application = "platform-sg"
  }
}