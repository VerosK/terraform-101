
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.15.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
}

