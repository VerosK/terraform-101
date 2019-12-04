data "local_file" "ssh_key" {
  filename = pathexpand("~/.ssh/id_rsa.pub")
}

resource "random_string" "user_id" {
  length = 5
  lower = true
  upper = false
  special = false
  number = false
}

resource "aws_key_pair" "access_key" {
  key_name = "workshop - ${random_string.user_id.result}"
  public_key = data.local_file.ssh_key.content
}

resource "aws_instance" "webserver" {
  ami = "ami-dd3c0f36"
  instance_type = "t3.micro"
  key_name = aws_key_pair.access_key.key_name
  monitoring = false

  associate_public_ip_address = true

  tags = {
    Name = "Workshop - ${random_string.user_id.result}"
    Purpose = "Terraform workshop"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "hosts.txt"
  content = "${aws_instance.webserver.public_dns}"
}

output "instance_ip" {
  value = "${aws_instance.webserver.public_ip}"
}

