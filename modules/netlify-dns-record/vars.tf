variable "apex" {
  default     = "example.com"
  description = "Apex domain of the site"
}

variable "subdomain" {
  default     = ""
  description = "Subdomain, if any, of the site"
}

variable "name" {
  description = "Unique name to refer to the resources"
}

locals {
  subdomain_type = var.subdomain == "" ? "ALIAS" : "CNAME"
}
