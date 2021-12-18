terragrunt {
  remote_state {
    backend = "s3"
    config {
      bucket = "k8clusters-terraform-state-live"
      key = "${path_relative_to_include()}/terraform.tfstate"
      region = "us-east-1"
      encrypt = false
      // lock_table = "terragrunt-examples-lock-table"      
    } 
  }
}