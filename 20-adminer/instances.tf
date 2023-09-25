


data "local_file" "ssh_key" {
  filename = pathexpand(var.ssh_key_path)
}


resource "aws_key_pair" "a_key" {
  key_name   = "terraform-keypair-${random_string.user_id.result}"
  public_key = data.local_file.ssh_key.content
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu_jammy.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.a_key.key_name
  monitoring    = false

  associate_public_ip_address = true
  user_data                   = file("cloud-init/setup-webserver.yml")
  #security_groups = [ data.aws_security_group.default_group.id ]
  subnet_id = ""

  tags = {
    Name    = "Wordpress - ${random_string.user_id.result}"
    purpose = "terraform-training"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
  }

  lifecycle {
    ignore_changes = [ami]
    create_before_destroy = true
  }

  availability_zone = element(var.availability_zones, count.index)
  count             = var.workers_count

  # Beware: Ugly Ansible hack.
  #provisioner "local-exec" {
  #  command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${self.public_ip}, -u ubuntu --become ansible-playbooks/setup-adminer.yml"
  #}

}
