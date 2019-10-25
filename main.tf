provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"
}

provider "dnsimple" {
  account = var.dnsimple_account
  token   = var.dnsimple_token
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

