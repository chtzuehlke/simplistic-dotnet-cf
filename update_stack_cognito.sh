#!/bin/bash

aws cloudformation update-stack --stack-name cognito --template-body file://./cf/cognito.yaml

#aws cloudformation wait stack-update-complete --stack-name cognito

COGNITO_DOMAIN=$(aws cloudformation describe-stacks --stack-name cognito --query "Stacks[0].Outputs[?OutputKey=='CognitoAppWebDomain'].OutputValue" --output text)
COGNITO_CLIENT_ID=$(aws cloudformation describe-stacks --stack-name cognito --query "Stacks[0].Outputs[?OutputKey=='CognitoUserPoolClientId'].OutputValue" --output text)

cat <<EOT > webapp/js/config.js
var COGNITO_AUTH_DATA = { 
  ClientId: '$COGNITO_CLIENT_ID',
  AppWebDomain: '$COGNITO_DOMAIN',
  TokenScopesArray: ['openid'],
  RedirectUriSignIn: 'https://' + location.host + '/index.html', 
  RedirectUriSignOut: 'https://' + location.host + '/index.html'
};
EOT
