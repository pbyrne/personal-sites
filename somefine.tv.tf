module "netlify-somefine-tv-record" {
  source = "./modules/netlify-dns-record"

  apex      = "somefine.tv"
  subdomain = ""
  name      = "somefine-tv"
}
