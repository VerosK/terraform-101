
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

