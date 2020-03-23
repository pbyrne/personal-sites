resource "dnsimple_record" "patrickbyrne-net-aws-cert-verification" {
  domain = "patrickbyrne.net"
  name   = "_2262a9e66dc754fb316cd68ff52ae314"
  value  = "_1cf42030deeafe01a79cec5d1f270c7d.acm-validations.aws"
  type   = "CNAME"
}

resource "dnsimple_record" "somefine-tv-aws-cert-verification" {
  domain = "somefine.tv"
  name   = "_8d4bbf085a6ad019bde0086bf5a4467d"
  value  = "_78cd7c713af387150d453cf1c65482e5.acm-validations.aws"
  type   = "CNAME"
}

resource "dnsimple_record" "beta-somefine-tv-aws-cert-verification" {
  domain = "somefine.tv"
  name   = "_d4ec24ffe2771439d6fc1a0cf6a0c7e0.beta"
  value  = "_72d251315e824ccad217844ed6fea9c4.acm-validations.aws"
  type   = "CNAME"
}

resource "dnsimple_record" "dannahforcitycouncil-com-aws-cert-verification" {
  domain = "dannahforcitycouncil.com"
  name   = "_c2153d3fdf44c0ed604415a310fd2102"
  value  = "_e69a59fdefdb1189bd94864d2844c1fb.kirrbxfjtw.acm-validations.aws"
  type   = "CNAME"
}

resource "dnsimple_record" "battlemap-app-aws-cert-verification" {
  domain = "battlemap.app"
  name = "_fe30a0d323ee174ac95c1f69c9d6c19c"
  value = "_e1e6e20629e47c7ecb7dc1b9ece9a074.nhqijqilxf.acm-validations.aws"
  type = "CNAME"
}
