#!/bin/bash
apt-get upgrade
apt-get update
apt-get dist-upgrade -y
apt-get install -y curl, git

# Add Docker APT repository
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker ubuntu

# Install docker-compose
sudo sh -c "curl -sSL https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -sSL https://raw.githubusercontent.com/docker/compose/1.6.2/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
