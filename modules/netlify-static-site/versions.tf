terraform {
  required_providers {
    dnsimple = {
      source = "terraform-providers/dnsimple"
    }
    netlify = {
      source = "terraform-providers/netlify"
    }
  }
  required_version = ">= 0.13"
}
