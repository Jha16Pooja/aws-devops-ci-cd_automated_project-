#!/bin/bash

# Clean the yum cache and recreate it to ensure we have the latest package data
sudo yum clean all
sudo yum makecache

# Wait for EC2 initialization
sleep 200

# Update system
sudo yum update -y

# Install Git
sudo yum install git -y

# Import Jenkins GPG key and install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y 
# Add required dependencies for the jenkins package
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y 
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins



# Install Docker
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker jenkins
sudo chmod 666 /var/run/docker.sock

# Install Trivy
sudo rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.rpm

# Install Ansible
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo yum install ansible -y
