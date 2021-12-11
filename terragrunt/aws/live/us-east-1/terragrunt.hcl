inputs = merge(
  yamldecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("env.yml")}")),
  {
    level = "live-parent"
  }
)