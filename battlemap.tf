resource "dnsimple_record" "battlemap-staging" {
  domain = "battlemap.app"
  name = "staging"
  value = "curved-crane-4ddl52l52gdcs3rdi973mnsr.herokudns.com"
  type = "CNAME"
}
