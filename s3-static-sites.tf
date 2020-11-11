module "somefine-tv" {
  source = "./modules/s3-static-site"

  apex      = "somefine.tv"
  subdomain = "legacy"
  name      = "somefine-tv"
}

