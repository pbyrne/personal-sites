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
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "byrnefamily"

    workspaces {
      name = "personal-sites"
    }
  }
}
