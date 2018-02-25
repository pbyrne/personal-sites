variable "apex" {
  default = "example.com"
  description = "Parent domain of the S3 site"
}

# TODO I'd *love* to make this dynamic ("${var.subdomain}.${var.apex}" if subdomain, "${var.domain}" if subdomain is blank), but I'm struggling with the syntax so am punting on it
variable "domain" {
  default = "www.example.com"
  description = "Complete domain name (subdomain + apex) for the S3 site."
}

variable "subdomain" {
  default = "www"
  description = "Subdomain of the S3 site (might be blank)"
}

variable "name" {
  default = "example"
  description = "Unique name to tag the resources with"
}

variable "acm_certificates" {
  default = {
    "patrickbyrne.net" = "arn:aws:acm:us-east-1:274881144938:certificate/c20f3877-46e0-4b0a-a38c-e20e00279187"
    "somefine.tv" = "arn:aws:acm:us-east-1:274881144938:certificate/d7c03018-765b-4c6e-8821-0cbd42537059"
  }
}

locals {
  bucket_name = "${replace(var.domain, ".", "-")}"
  subdomain_type = "${var.subdomain == "" ? "ALIAS" : "CNAME"}"
}
