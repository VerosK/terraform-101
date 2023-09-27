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

variable "object_count" {
  # define variable here
  type        = number
  default     = 3
  description = "Number of objects to create" # this can omitted
}

resource "aws_s3_object" "object" {
  count = var.object_count

  bucket  = aws_s3_bucket.bucket.bucket
  key     = format("%04d.txt", count.index)
  content = "Hello, world"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "obj_names" {
  value = [
    for obj in aws_s3_object.object : obj.key
  ]
}
