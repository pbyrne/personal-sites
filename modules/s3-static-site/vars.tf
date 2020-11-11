variable "apex" {
  default     = "example.com"
  description = "Parent domain of the S3 site"
}

variable "subdomain" {
  default     = "www"
  description = "Subdomain of the S3 site (might be blank)"
}

variable "name" {
  default     = "example"
  description = "Unique name to tag the resources with"
}

variable "acm_certificates" {
  default = {
    "dannahforcitycouncil.com" = "arn:aws:acm:us-east-1:274881144938:certificate/e51053c6-a2aa-4471-a8c9-31c55d6af39c"
    "patrickbyrne.net"         = "arn:aws:acm:us-east-1:274881144938:certificate/c20f3877-46e0-4b0a-a38c-e20e00279187"
    "somefine.tv"              = "arn:aws:acm:us-east-1:274881144938:certificate/3e58278c-2799-4693-8e5e-f99206177729"
  }
}

locals {
  bucket_name    = replace(var.name, ".", "-")
  domain_pieces  = [var.subdomain, var.apex]
  domain         = join(".", compact(local.domain_pieces))
  subdomain_type = var.subdomain == "" ? "ALIAS" : "CNAME"
}
