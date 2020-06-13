module "somefine-tv" {
  source = "./modules/s3-static-site"

  apex      = "somefine.tv"
  subdomain = ""
  name      = "somefine-tv"
}

