resource "digitalocean_spaces_bucket" "roadmapper-staging" {
  name = "roadmapper-staging"
  region = "nyc3"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["https://staging.roadmapper.cloud"]
    max_age_seconds = 3000
  }
}
