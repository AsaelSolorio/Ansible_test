#!/bin/bash

# Update the package lists and disable interactive prompts
export DEBIAN_FRONTEND=noninteractive
sudo apt upgrade -y && sleep 2;
sudo apt update && sleep 2;

# Install ansible without any interactive prompts
sudo apt install -y ansible
sleep 3
echo "ansible installed"

echo "running playbook"
# Run the playbook
/usr/bin/ansible-playbook -u ubuntu /home/ubuntu/playbook.yaml
