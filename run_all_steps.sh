#!/bin/bash

# First run the 'bucket_state'
sh run_create_bucket_state

# Second run the 'VPC_network'
sh run_vpc_network.sh

# Last run the 'EC2_create'
sh run_ec2_create.sh
