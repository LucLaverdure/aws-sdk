aws s3api list-buckets --query "Buckets[].Name" > buckets.json
jq -r '.[]' buckets.json | while read i; do
	aws s3 sync $i s3://$i 
done