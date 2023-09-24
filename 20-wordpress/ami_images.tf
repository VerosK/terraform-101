data "aws_ami" "debian_11" {
  owners      = ["136693071363"]
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-11-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_ami" "ubuntu_jammy" {
  owners = ["aws-marketplace"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-minimal/*/ubuntu-*-22.04-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "product-code"
    values = ["4s6b2r2vfe46kyul508kf459f"] # ubuntu 22.04
  }
}
