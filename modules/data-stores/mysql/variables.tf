variable "db_cluster_name" {
  description = "The name of the db cluster"
}

variable "db_username" {
  description = "The username for the database"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the database"
}

variable "db_instance_type" {
  description = "The instance type for the db instance"
}
