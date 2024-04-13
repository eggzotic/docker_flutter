# syntax=docker/dockerfile:1

FROM almalinux:latest as base

# Install & configure main app: NGINX
RUN dnf -y install nginx

# Install diag tools: ps, netstat
RUN dnf -y install procps-ng net-tools

ARG NGINX_DIR=/etc/nginx
COPY deploy/nginx.conf ${NGINX_DIR}
COPY deploy/basic.conf ${NGINX_DIR}/conf.d

# Initial web content
ARG CONTENT_DIR=/opt/html
RUN mkdir -p ${CONTENT_DIR}

# 2 options:

## 1. Portable, standalone, self-contained, production(?) image - copy app content in:
COPY counter_app/build/web/ ${CONTENT_DIR}

## or,
## 2. Dev-friendly, rapid-update, must-be-run on same host as `flutter build web` output is present
# configure bind-mount in compose.yaml - see `volumes` directive there

EXPOSE 80

# What the container should run when it is started.
CMD ["nginx", "-g", "daemon off;"]
