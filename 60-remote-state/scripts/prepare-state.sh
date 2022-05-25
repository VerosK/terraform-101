
#!/bin/bash

cat >terraform.sh <<EOF
# shared state config

terraform {
  backend "s3" {
    bucket = "${TF_VAR_remote_state_s3_bucket}"
    key    = "state"
    region = "eu-west-1"
    dynamodb_table = "${TF_VAR_remote_state_lock_table}"
  }
}

EOF
