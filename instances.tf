data "aws_ami" "debian_10" {
  owners = ["136693071363"]
  most_recent = true

  filter {
    name = "name"
    values = ["debian-10-*"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

data "local_file" "ssh_key" {
  filename = pathexpand("~/.ssh/id_rsa.pub")
}

resource "aws_key_pair" "a_key" {
  key_name = "terraform-keypair-${random_string.user_id.result}"
  public_key = data.local_file.ssh_key.content
}

data "aws_security_group" "default_group" {
  name = "allow-ssh-only"
}

resource "aws_instance" "webserver" {
  ami = data.aws_ami.debian_10.id
  instance_type = "t3.micro"
  key_name = aws_key_pair.a_key.key_name
  monitoring = false

  associate_public_ip_address = true

  user_data = file("cloud-init/setup-nginx.yml")

  security_groups = [ data.aws_security_group.default_group.name ]

  tags = {
    Name = "Terraform - ${random_string.user_id.result}"
    purpose = "terraform-training"
  }

  root_block_device {
    delete_on_termination = true
    volume_size = 10
  }

  lifecycle {
    ignore_changes = [ "ami" ]
  }

  count = 3
}

resource "aws_elb_attachment" "attach" {
  // instance = "${element(count.index, aws_instance.webserver.*.id)}"
  instance = aws_instance.webserver[count.index].id
  elb = aws_elb.central-lb.id

  count = length(aws_instance.webserver)
}

output "ssh_targets" {
  value = aws_instance.webserver.*.public_dns
}
