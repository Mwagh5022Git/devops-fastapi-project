#!/bin/bash

echo "Starting Terraform"

cd terraform

terraform init
terraform apply -auto-approve

IP=$(terraform output -raw instance_ip)

echo "Instance IP: $IP"

cd ..

echo "Updating Ansible inventory"

echo "[server]" > ansible/inventory.ini
echo "$IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/devops-key.pem" >> ansible/inventory.ini

echo "Running Ansible"

ansible-playbook -i ansible/inventory.ini ansible/install_app.yml

# Step 4 — FastAPI Application

# Install dependencies
pip install fastapi uvicorn prometheus-client
