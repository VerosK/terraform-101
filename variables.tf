variable "aws_region" {
  description = "AWS region to use."
  default = "eu-central-1"
  type = string
}

variable "create_instance" {
  type = bool
  default = true
}
