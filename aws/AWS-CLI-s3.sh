#Hola :)

#Check the installation works
aws --version
# To config aws-cli
aws configure

#to check available s3 bucket
aws s3 ls
 aws s3 ls --profile myuser
#To create new bucket
aws s3 mb bucket-name
#To ls inside the bucket
aws s3 ls bucket-name
aws s3 ls bucket-name/path/

# To Remove a bucket
aws s3 rb bucket-name
aws s3 rb bucket-name --force

# commands include s3 cp, s3 ls, s3 mv, s3 rm, and s3 sync.
# Assume local directory and s3://my-bucket/path currently in sync and each contains 3 files:
# MyFile1.txt
# MyFile2.rtf
# MyFile88.txt
rm *.txt
aws s3 sync . my-bucket/path --delete --exclude "my-bucket/path/MyFile?.txt"
aws s3 rm my-bucket/path/MyFile2.rtf
aws s3 sync my-bucket/path . --delete --exclude "./MyFile2.rtf"
aws s3 sync my-bucket/path . --delete

#Copy MyFile.txt in current directory to s3://my-bucket/path
aws s3 cp MyFile.txt my-bucket/path/

#Move all .jpg files in s3://my-bucket/path to ./MyDirectory
aws s3 mv my-bucket/path ./MyDirectory --exclude "*" --include "*.jpg" --recursive

#List the contents of my-bucket
aws s3 ls my-bucket

#List the contents of path in my-bucket
aws s3 ls my-bucket/path/

# Delete s3://my-bucket/path/MyFile.txt
aws s3 rm my-bucket/path/MyFile.txt

#Delete s3://my-bucket/path and all of its contents
aws s3 rm my-bucket/path --recursive


# Applying a Custom ACL
aws s3api put-bucket-acl --bucket MyBucket --grant-full-control 'emailaddress="user1@example.com",emailaddress="user2@example.com"' --grant-read 'uri="http://acs.amazonaws.com/groups/global/AllUsers"'
# Configuring a Logging Policy
aws s3api put-bucket-acl --bucket MyBucket --grant-read-acp 'URI="http://acs.amazonaws.com/groups/s3/LogDelivery"' --grant-write "URI="http://acs.amazonaws.com/groups/s3/LogDelivery"'
aws s3api put-bucket-logging --bucket MyBucket --bucket-logging-status file://logging.json
