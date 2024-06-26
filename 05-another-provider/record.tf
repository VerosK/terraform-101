# record.tf

resource "dns_a_record_set" "www" {
  zone      = "dyn.gpx.cz."
  name      = "www"
  addresses = ["127.0.0.1"]
  ttl       = 30
}

#
#resource "dns_txt_record_set" "txt" {
#  zone = "dyn.gpx.cz."
#  name = "txt"
#  txt  = ["Hello, world!"]
#  ttl  = 900
#}
