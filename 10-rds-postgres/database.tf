
resource "aws_security_group" "postgres" {
  name   = "postgres-access-${random_string.suffix.result}"
  vpc_id = data.aws_vpc.main.id
  ingress {
    from_port   = 5432
    to_port     = 5432
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

resource "aws_db_instance" "main" {
  #db_name                 = "main"
  identifier              = "tf-pg- ${random_string.suffix.result}"
  engine                  = "postgres"
  engine_version          = "14.5"
  backup_retention_period = 1

  username            = var.db_user
  password            = var.db_password
  publicly_accessible = false
  skip_final_snapshot = true

  instance_class = "db.t3.micro"

  allocated_storage     = 5
  max_allocated_storage = 15

  vpc_security_group_ids = [aws_security_group.postgres.id]

  // apply_immediately = true
}

output "database_host" {
  value = aws_db_instance.main.address
}
output "database_user" {
  value = aws_db_instance.main.username
}
output "database_password" {
  value = aws_db_instance.main.password
  sensitive = true
}
