aws iam list-users > users.json
aws iam list-groups > groups.json #has all group names

echo processing groups

mkdir groups
jq -r ".[]" groups.json | grep "GroupName" | grep -oP '(?<="GroupName": ").*(?=")' |  while read i; do
	echo Processing $i ...
	mkdir groups/$i
	aws iam get-group --group-name $i > ./groups/$i/group.json
done


#aws iam list-policies > policies.json
#echo processing policies


#mkdir policies

#for row in $(cat policies.json | jq -r '.[]'); do
#	_jq() {
#		echo {$row} | jq -r ${1}
#	}
	#echo $(_jq '.Arn')
	#echo $(_jq '.PolicyName')
	echo $row 
#done

#jq -r ".[]" policies.json | while read i; do
#        local pol_arn=$("$i | grep \"Arn\" | grep -oP '(?<=\"Arn\": \").*(?=\")'")
#	echo $pol_arn
#        local pname=$("$i | grep \"PolicyName\" | grep -oP '(?<=\"PolicyName\": \").*(?=\")'")
#	echo $pname
#	aws iam get-policy --policy-arn $pol_arn > ./policies/$pname.json
#done
