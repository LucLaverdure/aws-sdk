# for each user
aws iam create-user
aws iam create-login-profile
aws iam create-access-key

# foreach group
aws iam create-group
aws iam add-user-to-group

# foreach policy
aws iam create-policy
aws iam attach-user-policy
