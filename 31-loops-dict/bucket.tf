
resource "random_string" "suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-lab-${random_string.suffix.result}"
}


output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

