resource "aws_s3_bucket" "bucket" {
  bucket = "${var.appName}-${var.envName}-${var.region}-${var.team}"
  versioning {
    enabled = var.versioning
  }
  tags = local.tags
}

locals {
  tags = {
    Name = "${var.appName}-${var.envName}-${var.region}-${var.team}"
    envName = "${var.envName}"
    team = "${var.team}"
    application = "${var.application}"
    name = "${var.name}"
  }
}