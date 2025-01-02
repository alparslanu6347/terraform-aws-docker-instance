#!/bin/bash
hostnamectl set-hostname ${myserver}
dnf update -y
dnf install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
# install docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

## Amazon Linux 2023 , Docker & Docker-compose 