# bucket.tf


resource "random_string" "suffix" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-${terraform.workspace}-${random_string.suffix.result}"

  tags = {
    PoweredBy = "terraform"
    Workspace = terraform.workspace
  }
}

