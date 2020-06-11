resource "netlify_deploy_key" "patrickbyrne-net" {}

module "netlify-staging-patrickbyrne-net" {
  source = "./modules/netlify-static-site/"

  apex = "patrickbyrne.net"
  subdomain = "staging"
  name = "staging-patrickbyrne-net"
  command = "middleman build"
  repo = "pbyrne/patrickbyrne.net"
  deploy_key = netlify_deploy_key.patrickbyrne-net
}

module "netlify-patrickbyrne-net" {
  source = "./modules/netlify-static-site/"

  apex = "patrickbyrne.net"
  subdomain = ""
  name = "patrickbyrne-net"
  command = "middleman build"
  repo = "pbyrne/patrickbyrne.net"
  deploy_key = netlify_deploy_key.patrickbyrne-net
}
