#!/bin/bash
export TF_HOSTNAME_KEY_NAME=name
./bin/terraform-inventory $@ ../nodes/terraform.tfstate.d/dev/terraform.tfstate
