FROM ubuntu:latest

COPY docker-image-setup.sh /tmp/docker-image-setup.sh
RUN chmod +x /tmp/docker-image-setup.sh
RUN /tmp/docker-image-setup.sh 
