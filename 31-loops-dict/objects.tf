# objects.tf

variable "object_names" {
   type = list(string)
   description = "Names of files to create in the bucket"
   default = [
        "first.txt", "index.html", "index.txt"
   ]
}

resource "aws_s3_object" "object" {

  count = length(var.object_names)

  bucket  = aws_s3_bucket.bucket.bucket
  key     = var.object_names[count.index]
  content = "Hello, world"
}

output "files" {
  value = [
    for obj in aws_s3_object.object : obj.key
  ]
}

