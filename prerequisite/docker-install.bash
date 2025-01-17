#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the apt package index and install prerequisites
echo "Updating package index and installing prerequisites..."
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository
echo "Setting up the Docker stable repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index again
echo "Updating package index..."
sudo apt-get update -y

# Install Docker Engine, CLI, and containerd
echo "Installing Docker Engine, CLI, and containerd..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Enable and start Docker service
echo "Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to the Docker group (optional, to avoid using 'sudo' with Docker commands)
echo "Adding the current user to the Docker group..."
sudo usermod -aG docker $USER

# Print Docker version to verify installation
echo "Docker installed successfully. Verifying the installation..."
docker --version

echo "Installation complete. You might need to log out and log back in for group changes to take effect."

