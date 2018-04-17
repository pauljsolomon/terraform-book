
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}

# Amazon S3 psolomon-terraform-up-and-running-state/staging/data-stores/mysql

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours-production"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 3
  recurrence            = "0 9 * * *"

  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night-production"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 2
  recurrence            = "0 17 * * *"

  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-production"
  db_remote_state_bucket = "psolomon-terraform-up-and-running-state"
  # use staging since we have not split this off yet
  db_remote_state_key    = "staging/data-stores/mysql/terraform.tfstate"

  instance_type          = "m4.large"
  min_asg_size           = 2
  max_asg_size           = 10
}
