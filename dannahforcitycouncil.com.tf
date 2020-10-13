resource "netlify_deploy_key" "dannahforcitycouncil-com" {}

module "dannahforcitycouncil-com" {
  source = "./modules/netlify-static-site"

  apex       = "dannahforcitycouncil.com"
  subdomain  = ""
  name       = "dannahforcitycouncil-com"
  command    = "make"
  repo       = "pbyrne/dannah-for-city-council"
  deploy_key = netlify_deploy_key.dannahforcitycouncil-com
}

resource "dnsimple_record" "pjb-google-webmaster-verification" {
  domain = "dannahforcitycouncil.com"
  name   = ""
  type   = "TXT"
  value  = "google-site-verification=1sCj4T0TDHH437g4zN4nf5PgoSYElxrkfwm-T6ZNJIg"
}

module "staging-dannahforcitycouncil-com" {
  source = "./modules/netlify-static-site"

  apex       = "dannahforcitycouncil.com"
  subdomain  = "staging"
  name       = "staging-dannahforcitycouncil-com"
  command    = "make"
  repo       = "pbyrne/dannah-for-city-council"
  deploy_key = netlify_deploy_key.dannahforcitycouncil-com
}
