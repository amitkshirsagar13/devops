import "account" {
  config_path = "../account.hcl"
}

inputs = merge(
  import.account.inputs,
  {
    region = "ap-south-1"
  },
)