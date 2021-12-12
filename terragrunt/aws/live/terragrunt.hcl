terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Parent - Running Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Parent - Finished running Terraform"]
    run_on_error = true
  }

  variable "AWS_ACCESS_KEY_ID" {
    default = "access-key"
  }

  variable "AWS_SECRET_ACCESS_KEY" {
    default = "secret-key"
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
