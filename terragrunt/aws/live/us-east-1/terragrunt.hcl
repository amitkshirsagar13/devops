inputs = merge(
  yamldecode(file("${get_terragrunt_dir()}/env.yml")),
  {
    level = "live-parent"
  }
)