#!/bin/bash
cd ./vpc-network

echo "vpc-network"
terraform init 

# formating
terraform fmt 

# Validate
terraform validate

# Create a plan
terraform plan -out "plan_vpc_network"

# Apply
terraform apply plan_vpc_network
