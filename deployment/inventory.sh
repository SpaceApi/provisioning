#!/bin/bash
# terraform-inventory: https://github.com/adammck/terraform-inventory

export TF_HOSTNAME_KEY_NAME=name
./bin/terraform-inventory $@ ../nodes/terraform.tfstate.d/$env/terraform.tfstate

