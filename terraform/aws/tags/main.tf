locals {
  tags = {
    Name = "${var.team}-${var.level}-${var.region}-${var.name}"
    name = "${var.name}"
    level = "${var.level}"
    region = "${var.region}"
    team = "${var.team}"
    application = "${var.application}"
    description = "${var.description}"
  }
}