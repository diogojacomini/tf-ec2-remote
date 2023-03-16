#!/bin/bash

echo "destroy EC2"
cd ./instance-ec2
terraform destroy

echo "delete key"
rm *key*

echo "destroy vpc-network"
cd ../vpc-network
terraform destroy
