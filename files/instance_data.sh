#!/bin/bash

# Writes out instance data to feed cloudwatch dimensions.

instance_name=`aws ec2 describe-tags --region us-west-2 --filters Name=resource-id,Values=\`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id\` Name=key,Values=Name | grep Value | cut -d : -f 2 | sed 's/\"//g' | tr -d '[:blank:]' | sed 's/\,//g'`

printf "instance=%s" "$instance_name" >> /home/centos/instance_info
