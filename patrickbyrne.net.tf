resource "netlify_deploy_key" "patrickbyrne-net" {}

module "netlify-staging-patrickbyrne-net" {
  source = "./modules/netlify-static-site/"

  apex = "patrickbyrne.net"
  subdomain = "staging"
  name = "staging-patrickbyrne-net"
  command = "make"
  repo = "pbyrne/patrickbyrne.net"
  deploy_key = netlify_deploy_key.patrickbyrne-net
}

module "netlify-patrickbyrne-net" {
  source = "./modules/netlify-static-site/"

  apex = "patrickbyrne.net"
  subdomain = ""
  name = "patrickbyrne-net"
  command = "make"
  repo = "pbyrne/patrickbyrne.net"
  deploy_key = netlify_deploy_key.patrickbyrne-net
}

module "bucket-patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex      = "patrickbyrne.net"
  subdomain = "bucket"
  name      = "bucket-patrickbyrne-net"
}
