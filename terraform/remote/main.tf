provider "aws" {
  region     = "us-west-2"
  profile    = "spare-terraform"  # Must be configured locally
}

resource "aws_s3_bucket" "bucket" {
  bucket = "spare-terraform"

  tags {
    Name = "Terraform Dev State"
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

module "state" {
  source         = "github.com/confluentinc/terraform-state"
  s3_bucket      = "spare-terraform"
  s3_bucket_name = "Terraform Remote Storage"
  dynamodb_table = "spare-terraform"
  env            = "default"  # Not using environment-specific backends
}
