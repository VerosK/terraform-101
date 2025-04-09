
# prepare website www.koren.cz in the bucket
module "koren_cz" {
   source = "./modules/website"

   bucket_name = aws_s3_bucket.bucket.bucket
   domain_name = "koren.cz"
}
