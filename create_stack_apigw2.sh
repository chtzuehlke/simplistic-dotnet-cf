#!/bin/bash

aws cloudformation create-stack --stack-name apiv2 --template-body file://./cf/apigwv2.yaml

aws cloudformation wait stack-create-complete --stack-name apiv2
