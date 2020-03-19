#!/bin/bash

aws cloudformation create-stack --stack-name cognito --template-body file://./cf/cognito.yaml

aws cloudformation wait stack-create-complete --stack-name cognito
