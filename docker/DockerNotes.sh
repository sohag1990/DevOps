
Hola :-)

https://docs.docker.com/

# Basic commands
#restart docker engine
service docker restart 
#to check docker version
docker -v 
#to install/pull/download a docker image in docker machine.
docker pull ImageName 

# docker run [OPTIONS] IMAGE [COMMAND] [ARG...] #Docker Run command will find with the specific docker image documentation
#to push a own docker image on Dockerhub. follow the naming convension. username/imageName
docker push username/ImageName 
#to check installed available images
docker images 
#to view all running containers
docker ps 
#to view all containers including running and stoped/exited.
docker ps -a 
#to stop a container eg. docker stop 343, no need full container id. just unique part of containerID. multipe containerID space separated, supporte to take bulk action.  
docker stop containerID/IDs 
#to start a stoped container. multiple ids supported to take bulk action
docker start containerID/IDs 
#to show the details of a container. Installation/environment variables/host with all the details of container.
docker inspect containerID 
#to remove stoped/exited container from process
docker rm containerID 
#to remove/delete/uninstall image/images from docker machine
docker rmi imageID/IDs 
#To remove all exited containter
docker ps -f status=exited -q | xargs -r docker rm 
#To remove all unused images
docker images -f dangling=true -q | xargs -r docker rmi 
docker login #to login Dockerhub
.................................................................................

### Real life example docker run commands
#Mysql
#basic mysql install and run command in linux machine
docker run --name go_mysql -v /srv/gomysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=111111 -d mariadb 
#advance mysql docker run command. Mysql Database To support utf8mb4_unicode_ci
docker run --name some-mysql -v /srv/gomysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci 

#MongoDB
#basic mongoDB install and run command
docker run --name mongodb -v ~/mongodata/datadir:/data/db -d mongo 

#Golang API Server image run on docker
# --net=host is very special command to share host network. Also the host and the container shares the service ports that are available to the host
docker run --net=host --rm -d -p 443:443 --name go-app-server whoshakhawat/go-app-serverssl 
docker run --net=host -d -p 443:443 --name go-app-server whoshakhawat/go-app-serverssl-v2.1.9.54

#mautic email marketing tools on docker
docker run --net=host --name mautic -d --restart=always -e MAUTIC_DB_HOST=127.0.0.1 -e MAUTIC_DB_USER=root -e MAUTIC_DB_PASSWORD=111111 -e MAUTIC_DB_NAME=mautic  -e MAUTIC_RUN_CRON_JOBS=true -p 8888:80 -v mautic_data:/var/www/html  mautic/mautic:latest

..................................................................................


### Real life example of Docker Build and run command
## if docker build command can't download the packages, then use command
docker build --network=host -t who/buildName .

##Golang Example
# ................

#Dockerfile
    FROM golang:1.9 #golang image

    WORKDIR /go/src/github.com/sohag1990/go-gin-app #creating working directory inside new image
    COPY . . #copy files from current local directory to docker new image current working directory

    RUN go get -d -v ./... #to install dependency packages using go get comand.
    RUN go install -v ./... #to build the go application inside the new docker image
    CMD ["go-gin-app"] # to run the app this CMD will trigger. "go-gin-app" this name is the same name of project directory name
    # ....................
##Build command to build a new docker image using this docker file
# .(dot) is denoted for current directory. build docker image from current directory.
docker build -t whoshakhawat/backend-app-api-server . 
## Run Command
# --net=host is very special command to share host network. Also the host and the container shares the service ports that are available to the host
docker run --net=host --rm -d -p 443:443 --name backend-app-api-server-ssl whoshakhawat/backend-app-api-server 



##Laravel Example
.................
#Dockerfile
    FROM php:7
    RUN apt-get update -y && apt-get install -y openssl zip unzip git
    RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    RUN docker-php-ext-install pdo mbstring
    RUN apt-get install php7.2-mysql
    WORKDIR /app #creating "app" directory inside the new image
    COPY . /app
    RUN composer install
    #RUN composer update #if require to composer to update, uncomment run this command
    #RUN composer upgrade #if require to composer to upgrade, uncomment run this command
    RUN composer dump-autoload

    CMD php artisan serve --host=0.0.0.0 --port=8181 #php artisan command to run the app
    EXPOSE 8181

##Build command to build a new docker image using this docker file
docker build -t whoshakhawat/laravel-app .
## Run the docker image in container
docker run -d -p 8181:8181 whoshakhawat/laravel-app


## To view all docker volume
docker volume ls
#To delete unused docker volume. safe command to free up ocupaid spaces 
docker volume prune
#To check the container sizes
docker ps --size
docker system df
