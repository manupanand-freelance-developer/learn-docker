# FROM registry.redhat.io/ubi9/ubi:9.5@sha256:d342aa80781bf41c4c73485c41d8f1e2dbc40ee491633d9cafe787c361dd44ff AS builder
 # from  to build from image
 # RUN commad is to run during the build
 FROM docker.io/nginx
 RUN rm -rf /usr/share/nginx/html/*
 COPY index.html /usr/share/nginx/html/