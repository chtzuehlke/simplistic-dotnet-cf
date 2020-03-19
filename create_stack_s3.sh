#!/bin/bash

aws cloudformation create-stack --stack-name s3 --template-body file://./cf/s3.yaml

aws cloudformation wait stack-create-complete --stack-name s3
