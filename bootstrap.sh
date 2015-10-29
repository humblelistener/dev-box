#!/bin/bash
apt-get update
apt-get dist-upgrade -y
apt-get install -y curl

apt-get install git

# programming languages
apt-get install -y nodejs
apt-get install -y golang

# docker
uname -r
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker* -y
apt-get install -y docker-engine
sudo systemctl enable docker
