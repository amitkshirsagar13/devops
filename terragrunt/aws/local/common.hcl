terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "common - Running Terraform"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "common - Finished running Terraform"]
    run_on_error = true
  }
}