#!/bin/bash

set -e

echo "Purging Docker and related packages..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

echo "Removing Docker directories..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

echo "Cleaning up Docker apt repository and keyring..."
sudo rm -f /etc/apt/sources.list.d/docker.list
sudo rm -f /etc/apt/keyrings/docker.asc

echo "Docker has been completely removed from your system."