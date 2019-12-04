data "local_file" "ssh_key" {
  filename = pathexpand("~/.ssh/id_rsa.pub")
}

resource "aws_key_pair" "access_key" {
  key_name = "workshop access key"
  public_key = "${data.local_file.ssh_key.content}"
}


resource "aws_instance" "webserver" {
  ami = "ami-dd3c0f36"
  instance_type = "t3.micro"
  key_name = "${aws_key_pair.access_key.key_name}"
  monitoring = false

  associate_public_ip_address = true

  tags = {
    Name = "Webserver API server"
    Purpose = "Terraform workshop"
  }

}

output "instance_ip" {
  value = "${aws_instance.webserver.public_ip}"
}

