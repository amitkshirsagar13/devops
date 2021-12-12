terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws/security"
}

# dependencies {
#   paths = ["../infra"]
# }

include {
  path = find_in_parent_folders()
}

inputs = {
  application = "platform"
  tags = {
    application = "platform"
  }
}