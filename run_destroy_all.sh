#!/bin/bash

echo "destroy bucket-state"
cd ./bucket-state
terraform destroy

echo "destroy vpc-network"
cd ../vpc-network
terraform destroy

echo "destroy EC2"
terraform destroy

echo "delete key"
rm *key*
