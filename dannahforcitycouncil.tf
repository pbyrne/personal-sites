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
