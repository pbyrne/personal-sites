terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    dnsimple = {
      source = "dnsimple/dnsimple"
    }
    netlify = {
      source = "royge/netlify"
    }
  }
}
