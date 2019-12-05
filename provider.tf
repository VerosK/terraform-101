provider "aws" {
  // This is default AWS provider
  region = "eu-central-1"
  shared_credentials_file = "aws-credentials.ini"
  profile                 = "default"

  version = "~> 2.41"

}


provider "aws" {
  alias = "aws-eu-central"
  region = "eu-central-1"
  shared_credentials_file = "aws-credentials.ini"
  profile                 = "default"

  version = "~> 2.41"

}

