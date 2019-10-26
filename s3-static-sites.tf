module "bucket-patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex      = "patrickbyrne.net"
  subdomain = "bucket"
  name      = "bucket"
}

module "patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex      = "patrickbyrne.net"
  subdomain = ""
  name      = "patrickbyrne-net"
}

module "staging-patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex      = "patrickbyrne.net"
  subdomain = "staging"
  name      = "staging-patrickbyrne-net"
}

module "somefine-tv" {
  source = "./modules/s3-static-site"

  apex      = "somefine.tv"
  subdomain = ""
  name      = "somefine-tv"
}

module "dannahforcitycouncil-com" {
  source = "./modules/s3-static-site"

  apex      = "dannahforcitycouncil.com"
  subdomain = ""
  name      = "dannahforcitycouncil-com"
}

module "staging-dannahforcitycouncil-com" {
  source = "./modules/s3-static-site"

  apex      = "dannahforcitycouncil.com"
  subdomain = "staging"
  name      = "staging-dannahforcitycouncil-com"
}
