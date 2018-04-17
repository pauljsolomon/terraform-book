variable "cluster_name" {
  description = "The name to use for all cluster resources"
}

variable "db_remote_state_bucket" {
  description = "The name of the s3 bucket for the databases remote state"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in s3"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "instance_type" {
  description = "The type of EC2 instances to run (e.g. t2.micro)"
}

variable "min_asg_size" {
  description = "The mininum number of EC2 instances in the ASG"
}

variable "max_asg_size" {
  description = "The maximum number of EC2 instances in the ASG"
}
