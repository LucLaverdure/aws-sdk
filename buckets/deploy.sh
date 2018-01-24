#!/usr/bin/env bash

LAMBDA_BUCKET="sdpf-webapp"
# change this ENV variable depending on the environment you want to deploy
ENV="dev"
STACK_NAME="aws-lambda-cf-environments-${ENV}"

# now package the CloudFormation template, upload SAM artifacts to S3 and deploy it
aws cloudformation package --template-file cfn.yml --s3-bucket ${LAMBDA_BUCKET} --output-template-file cfn.packaged.yml
aws cloudformation deploy --template-file cfn.packaged.yml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM --parameter-overrides Env=${ENV}
