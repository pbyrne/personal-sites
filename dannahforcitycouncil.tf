module "dannahforcitycouncil-com" {
  source = "./modules/s3-static-site"

  apex      = "dannahforcitycouncil.com"
  subdomain = ""
  name      = "dannahforcitycouncil-com"
}

module "staging-dannahforcitycouncil-com" {
  source = "./modules/netlify-static-site"

  apex = "dannahforcitycouncil.com"
  subdomain = "staging"
  name = "staging-dannahforcitycouncil-com"
  command = "middleman build -e staging"
  repo = "pbyrne/dannah-for-city-council"
  deploy_key = netlify_deploy_key.key
}
