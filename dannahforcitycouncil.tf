module "dannahforcitycouncil-com" {
  source = "./modules/netlify-static-site"

  apex       = "dannahforcitycouncil.com"
  subdomain  = ""
  name       = "dannahforcitycouncil-com"
  command    = "make build"
  repo       = "pbyrne/dannah-for-city-council"
  deploy_key = netlify_deploy_key.key
}

module "staging-dannahforcitycouncil-com" {
  source = "./modules/netlify-static-site"

  apex       = "dannahforcitycouncil.com"
  subdomain  = "staging"
  name       = "staging-dannahforcitycouncil-com"
  command    = "make build-staging"
  repo       = "pbyrne/dannah-for-city-council"
  deploy_key = netlify_deploy_key.key
}
