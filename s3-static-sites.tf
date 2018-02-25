module "bucket-patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex = "patrickbyrne.net"
  domain = "bucket.patrickbyrne.net"
  subdomain = "bucket"
  name = "bucket"
}

module "patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex = "patrickbyrne.net"
  domain = "patrickbyrne.net"
  subdomain = ""
  name = "patrickbyrne-net"
}

module "somefine-tv" {
  source = "./modules/s3-static-site"

  apex = "somefine.tv"
  domain = "somefine.tv"
  subdomain = ""
  name = "somefine-tv"
}

