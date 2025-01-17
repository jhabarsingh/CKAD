#!/bin/bash

# Script to install Minikube on Ubuntu and start a single-node Kubernetes cluster

# Update system and install required dependencies
echo "Updating system and installing dependencies..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y curl apt-transport-https virtualbox virtualbox-ext-pack

# Install Minikube
echo "Downloading and installing Minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Verify Minikube installation
echo "Verifying Minikube installation..."
minikube version

# Start Minikube
echo "Starting Minikube cluster..."
minikube start

# Wait for Minikube to initialize and verify the cluster status
echo "Waiting for Minikube to initialize..."
sleep 10

# Check Minikube cluster status
echo "Checking Kubernetes cluster status..."
kubectl get nodes

# Access Minikube dashboard (Optional)
echo "Opening Minikube dashboard in the browser..."
minikube dashboard &

# Display Minikube status
echo "Minikube status:"
minikube status

echo "Minikube installation and Kubernetes single-node cluster setup completed successfully!"

