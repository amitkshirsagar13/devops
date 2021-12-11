include {
  path = find_in_parent_folders()
}

inputs = merge(
  yamldecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("common.yml", "empty.yml")}")),
  yamldecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("install.yml", "empty.yml")}")),
  yamldecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("env.yml", "empty.yml")}")),
  yamldecode(file("${get_terragrunt_dir()}/module.yml")),
  {
    level = "live-parent"
  }
)