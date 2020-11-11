resource "dnsimple_record" "itself" {
  domain = var.apex
  name   = var.subdomain
  type   = local.subdomain_type
  value  = "${var.name}.netlify.app"
}

resource "dnsimple_record" "www" {
  count  = var.subdomain == "" ? 1 : 0
  domain = var.apex
  name   = "www"
  type   = "CNAME"
  value  = "${var.name}.netlify.app"
}

