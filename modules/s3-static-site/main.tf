resource "aws_s3_bucket" "itself" {
  bucket = local.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::${local.bucket_name}/*"
      ]
    }
  ]
}
POLICY


  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    site = var.name
  }
}

resource "aws_cloudfront_distribution" "itself" {
  origin {
    domain_name = aws_s3_bucket.itself.website_endpoint
    origin_id   = var.name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_protocol_policy = "http-only" # Sadly, S3's "static website hosting" is HTTP-only. Maybe I should use regular S3 which accepts HTTPS, but this is good enough for now.
    }
  }

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  aliases = [local.domain]

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    max_ttl     = 31536000 # 1 year
    default_ttl = 60

    viewer_protocol_policy = "redirect-to-https"

    target_origin_id = var.name
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = "PriceClass_100" # just the cheaper north-american servers

  tags = {
    site = var.name
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificates[var.apex]
    minimum_protocol_version = "TLSv1.2_2018"
    ssl_support_method       = "sni-only"
  }
}

resource "dnsimple_record" "itself" {
  domain = var.apex
  name   = var.subdomain
  value  = aws_cloudfront_distribution.itself.domain_name
  type   = local.subdomain_type
}

