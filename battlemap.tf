resource "dnsimple_record" "battlemap-staging" {
  domain = "battlemap.app"
  name = "staging"
  value = "curved-crane-4ddl52l52gdcs3rdi973mnsr.herokudns.com"
  type = "CNAME"
}

resource "aws_s3_bucket" "battlemap-staging" {
  bucket = "battlemap-staging"
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://staging.battlemap.app"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  versioning {
    enabled = true
  }
}
