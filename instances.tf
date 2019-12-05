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

resource "aws_elb" "bar" {
  name               = "foobar-terraform-${random_string.user_id.result}"
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

