# HOLA :)

#get help
aws iam help

#Create group
aws iam create-group --group-name MyIamGroup
#Create User
aws iam create-user --user-name MyUser
#Assign user to group
aws iam add-user-to-group --user-name MyUser --group-name MyIamGroup
#verify group
aws iam get-group --group-name MyIamGroup

# Determine the ARN of the policy to attach
export POLICYARN=$(aws iam list-policies --query 'Policies[?PolicyName==`PowerUserAccess`].{ARN:Arn}' --output text)       ~
echo $POLICYARN
#To attach the policy, use the attach-user-policy command, and reference the environment variable that holds the policy ARN.
aws iam attach-user-policy --user-name MyUser --policy-arn $POLICYARN
#veryfiy the policy
aws iam list-attached-user-policies --user-name MyUser

#set password to the iam user
aws iam create-login-profile --user-name MyUser --password My!User1Login8P@ssword --password-reset-required
#reset/change password
aws iam update-login-profile --user-name MyUser --password My!User1ADifferentP@ssword
#Create access Key
aws iam create-access-key --user-name MyUser
#delete access key
aws iam delete-access-key --user-name MyUser --access-key-id AKIAIOSFODNN7EXAMPLE