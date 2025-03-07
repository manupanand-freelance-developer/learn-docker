#!/bin/bash

# to run command along with redhat image
sudo docker run docker.io/redhat/ubi9 env # runs env command environment variables

# -e env
sudo docker run -e MONGO=true docker.io/redhat/ubi9 env

#Remove Unused Containers, Images, Volumes, and Networks

sudo docker system prune -a --volumes

# clear builder cache 

sudo docker builder prune -a

#Remove sopped container
sudo docker container prune

#clear unused volume
sudo docker volume prune 

# check disk usage

sudo docker system df

# reboot will make container go off/reboot
sudo docker -d --restart always -P container-name # --restart | always|no |never|on-failure

# container redhat/ubi9
sudo docker run -P contianername # P any random port
#-d detached mode 
# attach back it to shell
sudo docker attach container-id

# to check status of contianer
docker ps 

# logs of contianer
docker logs container-id
# continoous logs
docker logs -f container-id

# copy from contianer  to host system
docker cp contianer-id:/etc/nginx/nginx.conf /tmp/test.conf # can cp reverse also

# create container - only creates not run
docker create nginx # will create only
# start container 
docker start contianer

# if we want to know the changes in file sysytem while running
docker diff contianerid

# docker events to track events continously
docker events

# execute command inside a contianer
docker exec container-id

# if a container is launced -> want  generate yaml for kubernets or JSON spec or systemd units
docker generate kube |spec | systemd

# docker health check
docker health container-id

# history
docker history image # steps involved in making this image

# export -container files as tar
# import- tarball to create filesystem image


# docker ps 
docker ps # list running contianer
docker ps -a # list running container
docker ps -a -q # list all contianers name only

# give low level information of the container
docker inspect container-id

# kill 
docker kill container-id
docker kill --signal TERM contianer-id #kill signal
# data bases need to be cautious when sending kill - need appropriate signal

# login/logout
docker login # to conatiner registry /docker hub
docker login docker.io

# docker logs
docker logs container-id
docker logs -f container-id # follow logs

# machine - manage virtual machine sitiing on one place and manage machine

# list all and remove
docker images -q  # will list all
docker rmi -f `docker images -q` # remove all images
# docker rm contianer
docker ps -a -q # list all
docker rm -f   `docker ps -a -q` 

# docker mount container-id df -h
docker mount contianer #it will mount to
#/home/ec2-user/.local/share/contianers/storage/overlay-container/35565898er68er5wr9wr1w5r9er7w2r6995w5r62x5a9/merged
cd /home/ec2-user/.local/share/contianers/storage/overlay-container/35565898er68er5wr9wr1w5r9er7w2r6995w5r62x5a9/merged
# can create file touch filename
docker exec containaer-id  ls # list command to see files


#ps list container
 docker port contianer #  port associated with container

# give name for docker contianer
docker run -d --name some-name image-name

# rename
docker rename some-name new-name

# secret management 
 example
 echo "pawssord" > passwordfile
 docker secret create nameforsecret passwordfile
 # list secret
 docker secret ls
 # run docker with secret
 docker run  -d --secret nameofsecret image-name
 #check files
 docker exec contianer-id ls -l /run/secrets #list secrets in contianer

 # docker stats usage/memory
 docker stats
 docker system df

 # single image id but give different tag name

 docker tag docker.io/nginx new-image-frontend



 