provider "aws" {
  region = "us-east-1"
}

provider "dnsimple" {
}

provider "netlify" {
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "byrnefamily"

    workspaces {
      name = "personal-sites"
    }
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

