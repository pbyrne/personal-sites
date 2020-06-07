resource "dnsimple_record" "battlemap-staging" {
  domain = "battlemap.app"
  name   = "staging"
  value  = "curved-crane-4ddl52l52gdcs3rdi973mnsr.herokudns.com"
  type   = "CNAME"
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

resource "aws_cloudfront_distribution" "battlemap-staging" {
  origin {
    domain_name = aws_s3_bucket.battlemap-staging.bucket_regional_domain_name
    origin_id   = "s3"
  }

  origin {
    domain_name = "staging.battlemap.app"
    origin_id   = "heroku"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_protocol_policy = "https-only"
    }
  }

  enabled         = true
  is_ipv6_enabled = true

  aliases = ["staging-cdn.battlemap.app"]

  default_cache_behavior {
    allowed_methods  = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  ordered_cache_behavior {
    path_pattern     = "/assets/*"
    target_origin_id = "heroku"
    allowed_methods  = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:274881144938:certificate/baefbe72-eaeb-445d-83a2-7e7fcac628c2" # *.battlemap.app
    minimum_protocol_version = "TLSv1.2_2018"
    ssl_support_method       = "sni-only"
  }
}

resource "dnsimple_record" "battlemap-staging-cdn" {
  domain = "battlemap.app"
  name   = "staging-cdn"
  value  = aws_cloudfront_distribution.battlemap-staging.domain_name
  type   = "CNAME"
}
