FROM redhat/ubi9-minimal
COPY mongo.repo /etc/yum.repos.d/mongo.repo
RUN  microdnf install -y mysql  mongodb-mongosh git && microdnf clean all
# above run while building
# below run when container is run
COPY run.sh /
ENTRYPOINT [ "bash" , "/run.sh" ]
# building image when someone start this should run as executable