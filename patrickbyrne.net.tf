resource "netlify_deploy_key" "patrickbyrne-net" {}

module "netlify-staging-patrickbyrne-net" {
  source = "./modules/netlify-static-site/"

  apex = "patrickbyrne.net"
  subdomain = "staging"
  name = "staging-patrickbyrne-net"
  command = "make"
  repo = "pbyrne/patrickbyrne.net"
  deploy_key = netlify_deploy_key.patrickbyrne-net
}

module "netlify-patrickbyrne-net" {
  source = "./modules/netlify-static-site/"

  apex = "patrickbyrne.net"
  subdomain = ""
  name = "patrickbyrne-net"
  command = "make"
  repo = "pbyrne/patrickbyrne.net"
  deploy_key = netlify_deploy_key.patrickbyrne-net
}

module "bucket-patrickbyrne-net" {
  source = "./modules/s3-static-site/"

  apex      = "patrickbyrne.net"
  subdomain = "bucket"
  name      = "bucket-patrickbyrne-net"
}

resource "aws_s3_bucket" "bucket-source" {
  bucket = "patrickbyrne-bucket-source"
  acl = "public-read"

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
        "arn:aws:s3:::patrickbyrne-bucket-source/*"
      ]
    }
  ]
}

POLICY
  versioning {
    enabled = true
  }
}
