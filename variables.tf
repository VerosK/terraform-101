variable "aws_region" {
  description = "AWS region to use."
  default = "eu-west-1"
  type = string
}

variable "create_instance" {
  description = "Should we create EC2 instances?"
  type = bool
}
