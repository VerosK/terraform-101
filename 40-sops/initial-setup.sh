#!/bin/bash

set -e
set -u
set -x

ACCOUNT_ID=$( aws sts get-caller-identity | jq -r .Account )

mkdir -p secrets

sops --encrypt --kms arn:aws:kms:eu-west-1:599735888825:alias/sops_key --encrypt  cleartext/secrets.yml > secrets/secrets.enc.yml


