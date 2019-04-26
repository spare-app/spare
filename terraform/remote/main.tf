provider "aws" {
  region     = "us-west-2"
  profile    = "spare-terraform"  # Must be configured locally
}

resource "aws_s3_bucket" "bucket" {
  bucket = "spare-terraform"

  tags {
    Name = "Terraform State"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "table" {
  name           = "spare-terraform"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
