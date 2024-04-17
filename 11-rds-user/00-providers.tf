
terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.21.0"
    }
  }
}

// external data source hack

data "terraform_remote_state" "psql" {
  backend = "local"

  config = {
    path = "../10-rds-postgres/terraform.tfstate"
  }
}

# https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs

provider "postgresql" {
  host            = data.terraform_remote_state.psql.outputs.database_host
  port            = 5432
  database        = "postgres"
  username        = data.terraform_remote_state.psql.outputs.database_user
  password        = data.terraform_remote_state.psql.outputs.database_password
  sslmode         = "require"
  connect_timeout = 15
  superuser       = false
}

