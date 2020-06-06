module "dannahforcitycouncil-com" {
  source = "./modules/s3-static-site"

  apex      = "dannahforcitycouncil.com"
  subdomain = ""
  name      = "dannahforcitycouncil-com"
}

resource "netlify_deploy_key" "key" {}

# NOTE: See comment in main.tf
# resource "github_repository_deploy_key" "dannahforcitycouncil-statging" {
#   key = netlify_deploy_key.key.public_key
#   read_only = true
#   repository = "dannah-for-city-council"
#   title = "Netlify Staging deploy key"
# }

resource "netlify_site" "dannahforcitycouncil-staging" {
  custom_domain = "staging.dannahforcitycouncil.com"
  name = "dannahforcitycouncil-staging"

  repo {
    repo_branch   = "master"
    command       = "middleman build -e staging"
    deploy_key_id = netlify_deploy_key.key.id
    dir           = "build"
    provider      = "github"
    repo_path     = "pbyrne/dannah-for-city-council"
  }
}

resource "dnsimple_record" "dannahforcitycouncil-staging" {
  domain = "dannahforcitycouncil.com"
  name = "staging"
  type = "CNAME"
  value = trimprefix(netlify_site.dannahforcitycouncil-staging.deploy_url, "http://")
}
