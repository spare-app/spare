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

resource "heroku_addon" "postgresql" {
  app  = "${heroku_app.default.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon" "papertrail" {
  app  = "${heroku_app.default.name}"
  plan = "papertrail:choklad"
}
