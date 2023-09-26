
resource "postgresql_database" "my_db" {
  name              = "my_db"
  owner             = postgresql_role.foo.name
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
}
