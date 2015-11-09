#!/bin/bash
apt-get update
apt-get dist-upgrade -y
apt-get install -y curl

# get git first
apt-get install -y git

# Ask for the user password
# Script only works if sudo caches the password for a few minutes
sudo true

# Install kernel extra's to enable docker aufs support
sudo apt-get -y install linux-image-extra-$(uname -r)

# Add Docker PPA and install latest version
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker -y
sudo groupadd docker
sudo gpasswd -a vagrant docker
sudo service docker restart

# Install docker-compose
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/1.4.2/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Install docker-cleanup command
cd /tmp
git clone https://gist.github.com/76b450a0c986e576e98b.git
cd 76b450a0c986e576e98b
sudo mv docker-cleanup /usr/local/bin/docker-cleanup
sudo chmod +x /usr/local/bin/docker-cleanup

# # install docker engine
# echo "install docker engine"
# # ref: http://docs.docker.com/engine/installation/ubuntulinux/
# sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" > /etc/apt/sources.list.d/docker.list
# apt-get update
# apt-get purge lxc-docker*
# apt-cache policy docker-engine
# apt-get install -y docker-engine
# service docker start
# sudo groupadd docker
# sudo gpasswd -a vagrant docker
# sudo service docker restart
# # a log out and login again is recommended by documentation
#
# # install docker-machine
# echo "install docker-machine"
# # ref: https://docs.docker.com/machine/install-machine/
# curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip >machine.zip && \
# unzip machine.zip && \
# rm machine.zip && \
# mv docker-machine* /usr/local/bin
#
# # install docker-compose
# echo "install docker-compose"
# sudo curl -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/VERSION_NUM/docker-compose-`uname -s`-`uname -m`
# sudo chmod +x /usr/local/bin/docker-compose


# programming languages
apt-get install -y nodejs
apt-get install -y golang

#install ruby
echo "install ruby"
sudo apt-get install -y ruby-full
sudo gem install bundler

# restart the machine finally
sudo reboot
