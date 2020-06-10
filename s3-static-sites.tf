module "bucket-patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex      = "patrickbyrne.net"
  subdomain = "bucket"
  name      = "bucket-patrickbyrne-net"
}

module "somefine-tv" {
  source = "./modules/s3-static-site"

  apex      = "somefine.tv"
  subdomain = ""
  name      = "somefine-tv"
}

