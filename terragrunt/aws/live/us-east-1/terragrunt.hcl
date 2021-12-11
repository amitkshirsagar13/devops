inputs = merge(
  yamldecode(file("env.yml")),
  {
    level = "live-parent"
  }
)