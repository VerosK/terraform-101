data "local_file" "ssh_key" {
  filename = pathexpand("~/.ssh/id_rsa.pub")
}

resource "random_string" "user_id" {
  length = 6
  lower = true
  upper = false
  special = false
  number = false

}

resource "aws_elb" "central-lb" {
  provider = "aws.aws-eu-central"

  name               = "terraform-${random_string.user_id.result}"
  availability_zones = ["eu-central-1a", "eu-central-1b"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  tags = {
    Name = "terraform--${random_string.user_id.result}"
  }
}


resource "aws_elb" "west-lb" {
  provider = "aws.aws-eu-west"

  name               = "terraform-${random_string.user_id.result}"
  availability_zones = ["eu-west-1a", "eu-west-1b"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  tags = {
    Name = "terraform--${random_string.user_id.result}"
  }
}


