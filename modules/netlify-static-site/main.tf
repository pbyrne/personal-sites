# NOTE: See comment in main.tf
# resource "github_repository_deploy_key" "itself" {
#   key = netlify_deploy_key.key.public_key
#   read_only = true
#   repository = "repo"
#   title = "Netlify Staging deploy key"
# }

resource "netlify_site" "itself" {
  custom_domain = local.domain
  name          = var.name

  repo {
    repo_branch   = "master"
    command       = var.command
    deploy_key_id = var.deploy_key.id
    dir           = "build"
    provider      = "github"
    repo_path     = var.repo
  }
}

resource "dnsimple_record" "itself" {
  domain = var.apex
  name   = var.subdomain
  type   = local.subdomain_type
  value  = trimprefix(netlify_site.itself.deploy_url, "http://")
}

resource "dnsimple_record" "www" {
  count  = var.subdomain == "" ? 1 : 0
  domain = var.apex
  name   = "www"
  type   = "CNAME"
  value  = trimprefix(netlify_site.itself.deploy_url, "http://")
}
