resource "random_string" "suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}


data "aws_vpc" "main" {
  default = true
}
