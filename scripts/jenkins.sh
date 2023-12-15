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