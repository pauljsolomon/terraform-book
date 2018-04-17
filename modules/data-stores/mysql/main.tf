#provider "aws" {
#  region = "us-east-1"
#}

# NOTE:  to import the var.db_password:  export TF_VAR_db_password=your_db_password

resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "${var.db_instance_type}"
  username            = "${var.db_username}"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
