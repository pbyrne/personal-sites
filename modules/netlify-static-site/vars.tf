variable "apex" {
  default = "example.com"
  description = "Apex domain of the site"
}

variable "subdomain" {
  default = ""
  description = "Subdomain, if any, of the site"
}

variable "name" {
  description = "Unique name to refer to the resources"
}

variable "command" {
  default = "middleman build"
  description = "Command to build the site"
}

variable "repo" {
  description = "GitHub repo path for the site"
}

variable "deploy_key" {
  description = "Netlify deploy key resource"
}

locals {
  domain_pieces  = [var.subdomain, var.apex]
  domain         = join(".", compact(local.domain_pieces))
  subdomain_type = var.subdomain == "" ? "ALIAS" : "CNAME"
}
