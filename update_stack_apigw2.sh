#!/bin/bash

aws cloudformation update-stack --stack-name apiv2 --template-body file://./cf/apigwv2.yaml

aws cloudformation wait stack-update-complete --stack-name apiv2
