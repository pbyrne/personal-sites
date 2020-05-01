resource "aws_s3_bucket" "battlemap-assets" {
  bucket = "battlemap-assets"
  acl    = "private"

  versioning {
    enabled = true
  }
}

