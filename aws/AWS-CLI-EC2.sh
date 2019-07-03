# Hola :-)

#to describe existing instances
aws ec2 describe-instances

# Creating a Key Pair
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

# encoding to ascii.
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text | out-file -encoding ascii -filepath MyKeyPair.pem
# Permission change to only read
chmod 400 MyKeyPair.pem
#display the keypair
aws ec2 describe-key-pairs --key-name MyKeyPair

#Deleting key pair
aws ec2 delete-key-pair --key-name MyKeyPair

# Creating a Security Group
# EC2-VPC
aws ec2 create-security-group --group-name my-sg --description "My security group" --vpc-id vpc-1a2b3c4d

# You can reference an EC2-VPC security group only by its vpc-id, That genarated by previous command
aws ec2 describe-security-groups --group-ids sg-903004f8

#EC2 Classic

# The following example shows how to create a security group for EC2-Classic.
aws ec2 create-security-group --group-name my-sg --description "My security group"

# To view the initial information for my-sg, run the describe-security-groups command. For an EC2-Classic security group, you can reference it by its name.
aws ec2 describe-security-groups --group-names my-sg

# Adding Rules to Your Security Group
# EC2-VPC
# The following example shows how to add a rule for RDP (TCP port 3389) to an EC2-VPC security group with the ID sg-903004f8. This example assumes the client computer has an address somewhere in the CIDR range 203.0.113.0/24.

# You can start by confirming that your public address shows as included in the CIDR range 203.0.113.0/24.

curl https://checkip.amazonaws.com

# With that information confirmed, you can add the range to your security group by running the authorize-security-group-ingress command.
aws ec2 authorize-security-group-ingress --group-id sg-903004f8 --protocol tcp --port 3389 --cidr 203.0.113.0/24

# The following command adds another rule to enable SSH to instances in the same security group.
aws ec2 authorize-security-group-ingress --group-id sg-903004f8 --protocol tcp --port 22 --cidr 203.0.113.0/24

# To view the changes to the security group, run the describe-security-groups command.
aws ec2 describe-security-groups --group-ids sg-903004f8

# EC2-Classic
# The following command adds a rule for RDP to the EC2-Classic security group named my-sg.

aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 3389 --cidr 203.0.113.0/24

# The following command adds another rule for SSH to the same security group.
aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 22 --cidr 203.0.113.0/24

# To view the changes to your security group, run the describe-security-groups command.
aws ec2 describe-security-groups --group-names my-sg

####Deleting Your Security Group
# To delete a security group, run the delete-security-group command.

# Note

# You can't delete a security group if it's currently attached to an environment.

# EC2-VPC
# The following command deletes an EC2-VPC security group.

aws ec2 delete-security-group --group-id sg-903004f8

# EC2-Classic
# The following command deletes the EC2-Classic security group named my-sg.

aws ec2 delete-security-group --group-name my-sg
