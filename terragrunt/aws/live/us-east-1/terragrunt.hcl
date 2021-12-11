include {
  path = find_in_parent_folders()
}

inputs = merge(
  yamldecode(file("${get_terragrunt_dir()}/env.yml")),
  {
    level = "live-parent"
  }
)