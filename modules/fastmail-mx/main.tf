resource "dnsimple_record" "apex-primary" {
  domain = "${var.apex}"
  name = ""
  value = "${var.primary}"
  priority = "10"
  type = "MX"
}

resource "dnsimple_record" "apex-secondary" {
  domain = "${var.apex}"
  name = ""
  value = "${var.secondary}"
  priority = "20"
  type = "MX"
}

resource "dnsimple_record" "apex-spf" {
  domain = "${var.apex}"
  name = ""
  value = "${var.spf}"
  type = "TXT"
}

resource "dnsimple_record" "wildcard-primary" {
  domain = "${var.apex}"
  name = "*"
  value = "${var.primary}"
  priority = "10"
  type = "MX"
}

resource "dnsimple_record" "wildcard-secondary" {
  domain = "${var.apex}"
  name = "*"
  value = "${var.secondary}"
  priority = "20"
  type = "MX"
}

resource "dnsimple_record" "wildcard-spf" {
  domain = "${var.apex}"
  name = "*"
  value = "${var.spf}"
  type = "TXT"
}
