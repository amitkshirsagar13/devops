import "region" {
  config_path = "../region.hcl"
}

terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws/infra/s3"
}

# dependencies {
#   paths = ["../infra"]
# }

include {
  path = find_in_parent_folders()
}

inputs = {
  application = "infra-s3"
  tags = {
    application = "infra-s3"
  }
}