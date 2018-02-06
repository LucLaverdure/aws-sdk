sudo python dynamodump.py -m restore -r us-east-1 -s "*" --dataOnly

jq -c '.[][]' dynamo_output.json | while read i; do
	r_id=$(echo $i | jq .ResourceId)
	min=$(echo $i | jq .MinCapacity)
	max=$(echo $i | jq .MaxCapacity)
	dim=$(echo $i | jq .ScalableDimension)

	aws application-autoscaling register-scalable-target \
	--service-namespace dynamodb \
	--resource-id "$r_id" \
	--scalable-dimension "$dim" \
	--min-capacity $min \
	--max-capacity $max
	
done