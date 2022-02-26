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
    level = "${var.envName}"
    team = "${var.team}"
    appName = "${var.appName}"
    name = "${var.name}"
  }
}