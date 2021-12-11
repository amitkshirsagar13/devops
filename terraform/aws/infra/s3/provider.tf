provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    dynamodb  = "http://localhost:4566"
    ec2       = "http://localhost:4566"
    iam       = "http://localhost:4566"
    kinesis   = "http://localhost:4566"
    lambda    = "http://localhost:4566"
    s3        = "http://localhost:4566"
  }
}