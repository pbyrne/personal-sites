provider "aws" {
  region = "us-east-1"
}

provider "dnsimple" {
}

provider "netlify" {
}

# TODO Use this to generate deploy keys automatically on GitHub once this is closed
# https://github.com/terraform-providers/terraform-provider-github/issues/371
# provider "github" {
#   individual = true
# }

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

