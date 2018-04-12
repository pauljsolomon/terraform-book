provider "aws" {
  region = "us-east-1"
}

terraform {
  # The configuration for this backend will be filled in by terragrunt
  backend "s3" {}
  required_version = "~> 0.11.0"
}

resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
