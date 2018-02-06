sudo python dynamodump.py -m backup -r us-east-1 -s "*"

aws application-autoscaling describe-scalable-targets --service-namespace dynamodb > dynamo_output.json