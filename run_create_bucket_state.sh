#!/bin/bash
cd ./bucket-state

echo "bucket-state"
terraform init 

# formating
terraform fmt 

# Validate
terraform validate

# Create a plan
terraform plan -out "plan_bucket_state"

# Apply
terraform apply plan_bucket_state
