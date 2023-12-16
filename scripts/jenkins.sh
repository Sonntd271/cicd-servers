#! /bin/bash

HOSTNAME="jenkins"

# Change hostname
sudo sh -c 'echo $HOSTNAME > /etc/hostname'
sudo hostname "$HOSTNAME"

# Install jdk 11
sudo apt update -y && sudo apt install openjdk-11-jre openjdk-11-jdk -y

# Import gpg key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo 'deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]' \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install jenkins
sudo apt update -y && sudo apt install jenkins -y

sudo systemctl enable jenkins
sudo systemctl restart jenkins

# Install docker; ref: https://docs.docker.com/engine/install/ubuntu/

# Add docker's gpg key
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Install docker 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add jenkins user to docker group
sudo usermod -aG docker jenkins