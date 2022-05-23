resource "random_string" "suffix" {
         length           = 6
        special = false
        lower = true
       upper = false
}

resource "aws_s3_bucket" "bucket" {
        bucket = "terraform-test-${random_string.suffix.result}"


}
