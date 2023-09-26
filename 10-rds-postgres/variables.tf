variable "aws_region" {
  description = "AWS region to use."
  default     = "eu-west-1"
  type        = string
}

variable "db_user" {
  default = "testme"
}

variable "db_password" {
  default = "nbusr123-asdf"
}
