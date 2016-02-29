#!/bin/bash
apt-get update
apt-get dist-upgrade -y
apt-get install -y curl

# get git first
apt-get install -y git

# Ask for the user password
# Script only works if sudo caches the password for a few minutes
sudo true

# Add Docker APT repository 
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" | sudo tee -a /etc/apt/sources.list.d/docker.list > /dev/null

# Add Mono APT repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

sudo apt-get update

# Install kernel extra's to enable docker aufs support
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get install -y docker-engine
sudo gpasswd -a vagrant docker
sudo service docker restart

# Install docker-compose
sudo sh -c "curl -sSL https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -sSL https://raw.githubusercontent.com/docker/compose/1.6.2/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# dnvm install
sudo apt-get install -yy unzip libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev
sudo apt-get install -y mono-complete
su - vagrant -c "curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh;dnvm upgrade -r mono"

# aws ecs cli
sudo curl -sSL -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
sudo chmod +x /usr/local/bin/ecs-cli

# restart the machine finally
sudo reboot
