
resource "aws_security_group" "mysql" {
  name   = "mysql-access"
  vpc_id = data.aws_vpc.main.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    protocol    = "icmp"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  db_name                 = "main"
  identifier              = "tf-${random_string.suffix.result}"
  engine                  = "mariadb"
  engine_version          = "10.6.13"
  backup_retention_period = 1

  username            = var.db_user
  password            = var.db_password
  publicly_accessible = false
  skip_final_snapshot = true

  instance_class = "db.t3.micro"

  allocated_storage     = 5
  max_allocated_storage = 15

  vpc_security_group_ids = [aws_security_group.mysql.id]

  // apply_immediately = true
}

output "database_host" {
  value = aws_db_instance.mysql.address
}
