# to run command along with redhat image
sudo docker run docker.io/redhat/ubi9 env # runs env command environment variables

# -e env
sudo docker run -e MONGO=true docker.io/redhat/ubi9 env

#Remove Unused Containers, Images, Volumes, and Networks

sudo docker system prune -a --volumes