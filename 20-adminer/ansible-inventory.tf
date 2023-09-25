resource "local_file" "inventory" {
  filename        = "ansible-playbooks/hosts.txt"
  file_permission = "0444"

  content = templatefile(
    "templates/inventory.txt",
    {
      hosts      = aws_instance.webserver
      region     = var.aws_region,
      admin_user = "ubuntu",
  })
}
