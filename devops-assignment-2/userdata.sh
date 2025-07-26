#!/bin/bash

BUCKET_NAME="<YOUR_BUCKET_NAME>"

yum update -y
yum install -y aws-cli

aws s3 cp /var/log/cloud-init.log s3://$BUCKET_NAME/system-logs/ --region us-east-1

if [ -d "/home/ec2-user/app-logs" ]; then
  aws s3 cp /home/ec2-user/app-logs s3://$BUCKET_NAME/app/logs/ --recursive --region us-east-1
fi