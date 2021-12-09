resource "aws_s3_bucket" "bucket" {
  bucket = "${var.level}-${var.team}-${var.application}-${var.name}"
}