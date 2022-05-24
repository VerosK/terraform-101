variable "aws_region" {
  description = "AWS region to use."
  default     = "eu-west-1"
  type        = string
}

variable "workers_count" {
  default = 1
  type    = number
}
