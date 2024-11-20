module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.10.0"

   identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "demodb"
  username = "user"
  port     = "3306"

  iam_database_authentication_enabled = false

  vpc_security_group_ids = []


  # Disable creation of RDS instance(s)
  create_db_instance = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = false

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = true

  # Enable creation of monitoring IAM role
  create_monitoring_role = true

  # ... omitted
}

