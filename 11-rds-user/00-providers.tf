
terraform {
  required_providers {
    mysql = {
      source = "petoju/mysql"
    }
  }
}

provider "mysql" {
  endpoint = var.mysql_host
  username = var.mysql_user
  password = var.mysql_password
}

variable "mysql_host" {}
variable "mysql_user" {}
variable "mysql_password" {}
