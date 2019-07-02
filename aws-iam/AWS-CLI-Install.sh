#Hola :)

#installing on ubuntu 18.04
which aws
# if aws already exist then remove with below command
# rm -rf /usr/local/bin/aws
# sudo rm -rf /usr/local/bin/aws

#download the source zip file of aws-cli
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
#unzip source zip file
unzip awscli-bundle.zip
# Install it to ~/bin/aws directory
./awscli-bundle/install -b ~/bin/aws
#Run the command to check installation success
/home/shakhawat/bin/aws --version
#To fix the path variable
echo $PATH | grep ~/bin 
export PATH=~/bin:$PATH
source ~/.profile 
source ~/.bashrc 

#Check the installation works
aws --version


# Uninstall the AWS CLI
# sudo rm -rf /usr/local/aws
# sudo rm /usr/local/bin/aws

# To config aws-cli
aws configure

#to describe existing instances
aws ec2 describe-instances
