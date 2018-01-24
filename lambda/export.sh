aws lambda list-functions --max-items 9999 > functions.json
chmod 777 *
rm *.zip
jq -r '.Functions[] | .FunctionName' functions.json | while read i; do
	aws lambda get-function --function-name $i > tmp.json
	jq -r '.Code  .Location' tmp.json | while read z; do
		wget -O "$i.zip" $z
	done
done
