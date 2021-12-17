terraform {
  backend "s3" {
    bucket         = "k8clusters-terraform-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
  }

  before_hook "before_hook" {
    commands     = ["apply", "plan", "destroy"]
    execute      = ["echo", "Parent - Running Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan", "destroy"]
    execute      = ["echo", "Parent - Finished running Terraform"]
    run_on_error = true
  }

  // after_hook "show" {
  //   commands = ["plan"]
  //   execute  = ["terraform", "show", "-no-color", "-json", "plan.tfplan"]
  // }

  // after_hook "after_hook_show_plan_json" {
  //   commands     = ["plan"]
  //   execute      = ["sh", "-c", "terragrunt show -json plan"]
  //   run_on_error = true
  // }

  // after_hook "after_hook_show_plan" {
  //   commands     = ["plan"]
  //   execute      = ["sh", "-c", "terragrunt show plan"]
  //   run_on_error = true
  // }
}

locals {
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

generate = local.common.generate

inputs = merge(
  yamldecode(file("env.yml")),
  local.common.inputs,
)
