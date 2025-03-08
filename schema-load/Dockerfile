FROM redhat/ubi9-minimal

# Copy MongoDB repository configuration
COPY mongo.repo /etc/yum.repos.d/mongo.repo

# Install required packages
RUN microdnf install -y mysql mongodb-mongosh git && microdnf clean all

# Ensure run.sh has execute permissions
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set the entrypoint to execute run.sh
ENTRYPOINT ["/run.sh"]
