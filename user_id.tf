
resource "random_string" "user_id" {
  length = 6
  lower = true
  upper = false
  special = false
  number = false

}
