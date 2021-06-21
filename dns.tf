module "fastmail-somefine-tv" {
  source = "./modules/fastmail-mx"
  apex   = "somefine.tv"
}

module "fastmail-angelabyrne-net" {
  source = "./modules/fastmail-mx"
  apex   = "angelabyrne.net"
}

module "fastmail-patrickbyrne-net" {
  source = "./modules/fastmail-mx"
  apex   = "patrickbyrne.net"
}

module "fastmail-byrnesoftware-net" {
  source = "./modules/fastmail-mx"
  apex   = "byrnesoftware.net"
}

resource "dnsimple_record" "patrickbyrne-net-keybase" {
  domain = "patrickbyrne.net"
  name   = ""
  value  = "keybase-site-verification=ljO8AmofTG9gKE7u4M6TBFkjZudRbHy9ckUheyKRLCs"
  type   = "TXT"
}

resource "dnsimple_record" "patrickbyrne-net-domainkey" {
  domain = "patrickbyrne.net"
  name   = "mesmtp._domainkey"
  value  = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtgOI4KTXkhNN5AVUxqgRcGcPOzDoEMhekobE9L+RMC4kqPO1gCYipVk3kV/zG/9+f/ToZZLPHr0PvVAxzdD99IPhy7qRmGVM0/73BEmvoybJIiQqtcp/Kl2nE2ZHL2TwxpZfor38WBeDGXL/b5RAg7AeWPorhvVIOOTMnd9wkBwIDAQAB"
  type   = "TXT"
}

resource "dnsimple_record" "patrickbyrne-net-playbook" {
  domain = "patrickbyrne.net"
  name   = "playbook"
  value  = "domains.dribbble.com"
  type   = "CNAME"
}

resource "dnsimple_record" "patrickbyrne-net-playbook-staging" {
  domain = "patrickbyrne.net"
  name   = "playbook-staging"
  value  = "pbyrne.staging.dribbble.com"
  type   = "CNAME"
}
