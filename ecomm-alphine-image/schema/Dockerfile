FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache mysql mongodb-tools git bash

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set entrypoint
ENTRYPOINT ["/run.sh"]
