aws apigateway get-rest-apis > apis.json
rm -rf apis
mkdir apis
jq -r '.items[] | .id' apis.json | while read i; do
	aws apigateway get-stages --rest-api-id $i > stages.json
	jq -r '.item[] | .stageName' stages.json | while read z; do
		aws apigateway get-export --rest-api-id $i --stage-name $z --export-type 'swagger' "apis/$z-$i.json"
	done
done
