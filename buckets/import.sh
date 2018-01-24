#!/usr/bin/env bash

LAMBDA_BUCKET="sdpf-webapp"
# change this ENV variable depending on the environment you want to deploy
ENV="dev"
STACK_NAME="aws-lambda-cf-environments-${ENV}"

aws cloudformation deploy --template-file cfn.packaged.yml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM --parameter-overrides Env=${ENV}