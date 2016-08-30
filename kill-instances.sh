#!/bin/bash

REGION="us-east-1"

attempted_instanceids=`cat ${BUILD_NUMBER}_instanceIds.txt`
aws ec2 terminate-instances --instance-ids ${attempted_instanceids[@]} \
  --region $REGION \
  --output text \
  --query 'TerminatingInstances[].InstanceId'
echo
