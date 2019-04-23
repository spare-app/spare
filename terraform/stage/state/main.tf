locals {
  s3_bucket      = "spare-dev-terraform"
  dynamodb_table = "spare-dev-dynamo"
}

provider "aws" {
  region     = "us-west-2"
  profile    = "spare-terraform"  # Must be configured locally
}

resource "aws_s3_bucket" "terraform" {
  bucket = "${local.s3_bucket}"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform" {
  name           = "${local.dynamodb_table}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
 }
