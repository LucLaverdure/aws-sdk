jq -r '.Functions[] | .FunctionName' functions.json | while read FUNC_NAME; do

	aws lambda get-function --function-name $FUNC_NAME > tmp.json
	jq -r '.Code .Location' tmp.json | while read CODE_LOC; do

		jq -r '.configuration .Role' tmp.json | while read ROLE_STR; do
	
			# Create the role and attach the trust policy that enables EC2 to assume this role.
			aws iam create-role --role-name Test-Role-for-EC2 --assume-role-policy-document file://trustpolicyforec2.json

			# Embed the permissions policy (in this example an inline policy) to the role to specify what it is allowed to do.
			aws iam put-role-policy --role-name Test-Role-for-EC2 --policy-name Permissions-Policy-For-Ec2 --policy-document file://permissionspolicyforec2.json

			# Create the instance profile required by EC2 to contain the role
			aws iam create-instance-profile --instance-profile-name EC2-ListBucket-S3

			# Finally, add the role to the instance profile
			aws iam add-role-to-instance-profile --instance-profile-name EC2-ListBucket-S3 --role-name Test-Role-for-EC2
			
		done
	done
done
