provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

terraform {
  backend "s3" {
    bucket         = "spare-terraform"
    key            = "spare-stage.tfstate"
    region         = "us-west-2"
    dynamodb_table = "spare-terraform"
    profile        = "spare-terraform"
  }
}

resource "heroku_app" "default" {
  name   = "${var.name}-test"
  region = "us"
  stack  = "container"
}
