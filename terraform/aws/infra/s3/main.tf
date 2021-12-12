resource "aws_s3_bucket" "bucket" {
  bucket = "${var.level}-${var.region}-${var.team}-${var.application}-${var.name}"
  versioning {
    enabled = var.versioning
  }
  tags = local.tags
}

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