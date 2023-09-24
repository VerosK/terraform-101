data "http" "chuck_norris" {
  url = "https://api.chucknorris.io/jokes/random"
}

locals {
  joke = jsondecode(data.http.chuck_norris.body).value
}

resource "dns_txt_record_set" "magic" {
  zone = "dyn.gpx.cz."
  name = "chuck-norris"
  txt = [
     local.joke
  ]
  ttl = 60
}

output "a_joke" {
  value = jsondecode(data.http.chuck_norris.body).value
}
