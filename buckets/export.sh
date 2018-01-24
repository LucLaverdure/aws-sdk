aws s3api list-buckets --query "Buckets[].Name" > buckets.json
jq -r '.[]' buckets.json | while read i; do
	mkdir $i
	aws s3 sync s3://$i $i
done
