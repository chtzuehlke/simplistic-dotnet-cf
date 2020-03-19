#!/bin/bash

aws cloudformation update-stack --stack-name s3 --template-body file://./cf/s3.yaml

#aws cloudformation wait stack-update-complete --stack-name s3

WEB_BUCKET=$(aws cloudformation describe-stacks --stack-name s3 --query "Stacks[0].Outputs[?OutputKey=='S3BucketForWebsiteContent'].OutputValue" --output text)

aws s3 cp webapp/index.html s3://$WEB_BUCKET/index.html --acl public-read
aws s3 cp webapp/js s3://$WEB_BUCKET/js --recursive --acl public-read

echo curl -v https://$WEB_BUCKET.s3.eu-central-1.amazonaws.com/index.html
