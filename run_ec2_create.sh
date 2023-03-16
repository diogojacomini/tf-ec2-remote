#!/bin/bash
echo "EC2"
cd ./instance-ec2

# Create key
if test -f "aws-key-tf"; then
    echo "The file exists."
else
    ssh-keygen -f 
fi


terraform init 

# formating
terraform fmt 

# Validate
terraform validate

# Create a plan
terraform plan -out "plan_EC2"

# Apply
terraform apply plan_EC2
