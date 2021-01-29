provider "aws" {
  // This is default AWS provider
  region                  = "eu-central-1"
  shared_credentials_file = "aws-credentials.ini"
  profile                 = "default"

}


provider "aws" {
  alias                   = "aws-eu-central"
  region                  = "eu-central-1"
  shared_credentials_file = "aws-credentials.ini"
  profile                 = "default"

  #version = "~> 2.41"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.41"
    }
    local = {
      source = "hashicorp/local"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
