provider "aws" {
  region = "us-east-1"
}

# terraform remote config -backend=s3 -backend-config="bucket=psolomon-terraform-up-and-running-state" -backend-config="key=global/s3/terraform.tfstate" -backend-config="region=us-east-1" -backend-config="encrypt=true"

terraform {
  backend "s3" {
    bucket  = "psolomon-terraform-up-and-running-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "psolomon-terraform-up-and-running-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
