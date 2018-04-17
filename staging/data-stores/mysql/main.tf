provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}

#variable db_username {}
#variable db_password {}

#module "db_cluster" {
#  source = "../../../modules/data-stores/mysql"
#
#  db_cluster_name    = "db-staging"
#  db_instance_type   = "db.t2.micro"
#  db_username        = "${var.db_username}"
#  db_password        = "${var.db_password}"
#}

resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "${var.db_instance_type}"
  #instance_class      = "db.t2.micro"
  username            = "${var.db_username}"
  #username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
