terraform {
  source = "git::https://github.com/amitkshirsagar13/devops.git//terraform/aws"
}

# dependencies {
#   paths = ["../infra"]
# }

inputs = {
  application = "live"
}