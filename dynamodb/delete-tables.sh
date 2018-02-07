# delete tables that do not contain ($1) ex: Zone

aws dynamodb list-tables > tables-list.json

jq -cr '.[][]' tables-list.json | while read i; do

	if [[ $i != *"$1"* ]]; then
		echo Deleting Table $i
		#aws dynamodb delete-table --table-name $i
	fi
	
done

aws dynamodb list-tables > tables-list.json

echo Remaining Tables $i
jq -cr '.[][]' tables-list.json | while read i; do
	echo $i
done
