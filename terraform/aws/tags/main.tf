locals {
  tags = {
    Name = concat(${var.appName}, "-", ${var.envName}, "-", ${var.region}, "-", ${var.team})
    // Name = "${var.appName}-${var.envName}-${var.region}-${var.team}"
    name = "${var.name}"
    level = "${var.level}"
    region = "${var.region}"
    team = "${var.team}"
    description = "${var.description}"
  }
}