# 00-providers.tf

terraform {
  required_providers {
    dns = {
      source = "hashicorp/dns"
    }
  }
}

variable "dns_update_key" {
  type = string
  # default = "this is not the key you're looking for"
}


provider "dns" {
  update {
    server        = "nsa.gpx.cz"
    key_name      = "update-key."
    key_algorithm = "hmac-sha256"
    key_secret    = var.dns_update_key
    transport     = "tcp"
  }
}
