#aws iam get-account-authorization-details > output.json
#aws iam generate-credential-report
#aws iam get-credential-report

aws iam list-users > users.json

# for each user
aws iam create-user
aws iam create-login-profile
aws iam create-access-key
aws iam add-user-to-group
aws iam attach-user-policy