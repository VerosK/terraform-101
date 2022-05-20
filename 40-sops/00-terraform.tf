terraform {
  required_version = "~> 1.0"

  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.7"
    }
  }
}


provider "sops" {}
