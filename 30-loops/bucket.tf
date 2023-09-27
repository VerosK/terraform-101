
resource "random_string" "suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

variable "with_bucket" {
  default = true
  description = "Should we create Log bucket?"
}

resource "aws_s3_bucket" "bucket" {
  count = var.with_bucket ? 1 : 0    # <<< make object creation conditional

  bucket = "terraform-test-${random_string.suffix.result}"

  tags = {
    PoweredBy = "terraform"
  }
}

variable "object_count" {                     # << define variable here
  type        = number                        # one of these have to be defined
  default     = 3                             # ^
  description = "Number of objects to create" # this can omited
}

resource "aws_s3_object" "object" {
  count = var.with_bucket ? var.object_count : 0 # << add condition here too

  bucket  = aws_s3_bucket.bucket[0].bucket
  key     = format("%04d.txt", count.index)
  content = "Hello, world"
}

/* output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
} */

output "files" {
  value = [
    for obj in aws_s3_object.object : obj.key
  ]
}
