

resource "dns_a_record_set" "www" {
  zone      = "dyn.gpx.cz."
  name      = "www"
  addresses = ["127.0.0.1"]
  ttl       = 900
}

