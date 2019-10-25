provider "aws" {
  region = "us-east-1"
}

provider "dnsimple" {
}

terraform {
  backend "s3" {
    bucket = "patrick-byrne-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}

# make the place to store shared Terraform state
resource "aws_s3_bucket" "terraform-state" {
  bucket = "patrick-byrne-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

