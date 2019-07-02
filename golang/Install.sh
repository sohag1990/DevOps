#Hola:)

#Update system
sudo apt-get update
sudo apt-get -y upgrade
cd /tmp
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz

sudo tar -xvf go1.11.linux-amd64.tar.gz
sudo mv go /usr/local
#create workplace
mkdir ~/go
mkdir ~/go/bin  
mkdir ~/go/pkg
mkdir ~/go/src


vim ~/.profile
#put below three lines in bottom of .profile file
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#now reload the .profile file using the command
sourch ~/.profile

#to check installation
go env

