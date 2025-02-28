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

# to check status of contianer
docker ps 

# logs of contianer
docker logs container-id
# continoous logs
docker logs -f container-id