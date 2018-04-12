terragrunt = {
  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  # and use dynamodb for state locking.
  remote_state = {
    backend = "s3"

    config {
      encrypt        = true
      bucket         = "psolomon-terraform-up-and-running-state"
      key            = "state/data-stores/mysql/terraform.tfstate"
      region         = "us-east-1"
      dynamodb_table = "psolomon_terraform_up_and_running_terragrunt_locks"
    }
  }
}
