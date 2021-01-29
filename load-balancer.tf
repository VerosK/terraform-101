data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_elb" "central-lb" {
  #provider = aws.aws-eu-central

  name = "terraform-${random_string.user_id.result}"
  availability_zones = data.aws_availability_zones.available.names


  security_groups = [
    data.aws_security_group.default_group.id]

  health_check {
    healthy_threshold = 2
    interval = 60
    target = "HTTP:80/"
    timeout = 10
    unhealthy_threshold = 10
  }

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  tags = {
    Name = "terraform--${random_string.user_id.result}"
  }
}


output "elb_host" {
  value = aws_elb.central-lb.dns_name
}
