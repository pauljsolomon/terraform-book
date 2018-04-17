provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-staging"
  db_remote_state_bucket = "psolomon-terraform-up-and-running-state"
  db_remote_state_key    = "staging/data-stores/mysql/terraform.tfstate"

  instance_type          = "t2.micro"
  min_asg_size           = 2
  max_asg_size           = 2
}
