resource "aws_s3_bucket" "bucket" {
  bucket = "${var.team}-${var.application}-${var.level}-${var.region}-${var.name}"
}