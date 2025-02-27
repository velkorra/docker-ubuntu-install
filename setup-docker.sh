#!/bin/bash

set -e

echo "Updating package index..."
sudo apt-get update

echo "Installing prerequisites..."
sudo apt-get install -y ca-certificates curl gnupg

echo "Creating directory for Docker apt keyring..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

echo "Setting permissions for Docker GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding Docker apt repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package index again for Docker repo..."
sudo apt-get update

echo "Installing Docker packages..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker installation complete. Verifying..."
sudo docker --version
sudo docker compose version