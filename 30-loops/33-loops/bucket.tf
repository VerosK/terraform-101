
resource "aws_s3_bucket" "website" {
   bucket = "funny-whale"
}

locals {
   file_names = fileset("files","*")
}


resource "aws_s3_object" "files" {
  for_each = local.file_names

  bucket = aws_s3_bucket.website.bucket
  key = each.key
  content = file("files/${each.key}")

  lifecycle {
    ignore_changes = [ content ]
  }
}

output "file_names" {
   value = local.file_names
}

provider "aws" {
    region = "eu-west-1"
}
