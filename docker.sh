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