resource "random_string" "suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-test-${random_string.suffix.result}"

  tags = {
    PoweredBy = "terraform"
  }
}

resource "aws_s3_object" "object" {
  bucket  = aws_s3_bucket.bucket.bucket
  key     = "hello.txt"
  content = "Hello, world"
}
