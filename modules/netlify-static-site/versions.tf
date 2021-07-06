terraform {
  required_providers {
    dnsimple = {
      source = "dnsimple/dnsimple"
    }
    netlify = {
      source = "royge/netlify"
    }
  }
  required_version = ">= 0.13"
}
