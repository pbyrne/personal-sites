resource "dnsimple_record" "patrickbyrne-net-aws-cert-verification" {
  domain = "patrickbyrne.net"
  name   = "_2262a9e66dc754fb316cd68ff52ae314"
  value  = "_1cf42030deeafe01a79cec5d1f270c7d.acm-validations.aws."
  type   = "CNAME"
}

resource "dnsimple_record" "somefine-tv-aws-cert-verification" {
  domain = "somefine.tv"
  name   = "_8d4bbf085a6ad019bde0086bf5a4467d"
  value  = "_78cd7c713af387150d453cf1c65482e5.acm-validations.aws."
  type   = "CNAME"
}

resource "dnsimple_record" "beta-somefine-tv-aws-cert-verification" {
  domain = "somefine.tv"
  name   = "_d4ec24ffe2771439d6fc1a0cf6a0c7e0.beta"
  value  = "_72d251315e824ccad217844ed6fea9c4.acm-validations.aws."
  type   = "CNAME"
}

