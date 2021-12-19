terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan", "destroy"]
    execute      = ["echo", "Parent - Running Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan", "destroy"]
    execute      = ["echo", "Parent - Finished running Terraform"]
    run_on_error = true
  }
}

locals {
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

generate = local.common.generate

inputs = merge(
  yamldecode(file("env.yml")),
  local.common.inputs,
)

remote_state {
  backend = "s3"

  config = {
    endpoint                    = "http://host.docker.internal:4566"
    dynamodb_endpoint           = "http://host.docker.internal:4566"
    
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true

    bucket         = "k8clusters-terraform-state-local"

    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "sa-east-1"
    encrypt        = true
    dynamodb_table = "local-terraform-lock-table"
  }
}
