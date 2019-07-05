#Hola:-)

#Installing..
#make sure change the version number 1.18.0 to latest.
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

#give the executable permission
sudo chmod +x /usr/local/bin/docker-compose

#check version
docker-compose --version

#compose docker yml file

#filename docker-compose.yml

version: '2'
services:
  hello_world:
    image: ubuntu
    command: [/bin/echo, 'Hello world']


 #docker-compose up to run the yml file

 docker-compose up -d

 #check in docker ps
 docker ps
 docker-compose ps
 
 # docker-compose pull to update latest images
 docker-compose pull
 #stop/start container
 docker-compose stop
 docker-compose start

 #docker-compose down to stop and remove the container
 docker-compose down





