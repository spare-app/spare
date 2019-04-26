provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

terraform {
  backend "s3" {
    bucket = "spare-terraform"
    key    = "spare-stage.tfstate"
    region = "us-west-2"
    dynamodb_table = "spare-terraform"
  }
}

module "network" {
  source = "../modules/network"
  name   = "${var.name}"
  azs    = "${var.azs}"
}

module "alb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "3.5.0"
  load_balancer_name = "${var.name}"
  subnets            = "${var.public_subnets}"
  security_groups    = []
  vpc_id             = "${module.network.vpc_id}"
}
