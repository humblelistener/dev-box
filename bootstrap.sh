echo "--------------- beginning set up ---------------"
sudo apt-get update

echo "--------------- updating your agt-get sources ---------------"
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/a pt/sources.list.d/docker.list
sudo apt-get update

echo "--------------- installing linux-image-extra package, this allows use of aufs storage driver ---------------"
sudo apt-get install -yy linux-image-extra-$(uname -r)
sudo apt-get install -yy apparmor

echo "--------------- installing docker ---------------"
sudo apt-get install -yy docker-engine

echo "--------------- ensuring docker is running ---------------"
# optional to ensure docker is running
sudo service docker start
sudo docker run hello-world

echo "--------------- adding docker group to allow non sudo access ---------------"
sudo groupadd docker
sudo usermod -aG docker vagrant

echo "--------------- installing docker compose 1.7.1 ---------------"
sudo curl -Lo /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-compose

echo "--------------- finished installing, use vagrant ssh to begin enjoying ---------------"
exit
