

data "sops_file" "passwords" {
  source_file = "${path.module}/secrets/secrets.enc.yml"
}

locals {
  passwords = data.sops_file.passwords.data
}

output "password" {
  value = local.passwords.password

  sensitive = true
}

output "username" {
  value     = local.passwords.username
  sensitive = true
}

