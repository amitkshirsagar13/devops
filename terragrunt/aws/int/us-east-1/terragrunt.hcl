terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/cloud/aws/s3"
}

# dependencies {
#   paths = ["../infra"]
# }

include {
  path = find_in_parent_folders()
}

inputs = {
  application = "k8cluster"
}