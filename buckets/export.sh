aws s3api list-buckets --query "Buckets[].Name" > buckets.json
jq -r '.[]' buckets.json | grep $1 |  while read i; do
	echo "Exporting $i..."
	mkdir $i
	aws s3 sync s3://$i $i
done
