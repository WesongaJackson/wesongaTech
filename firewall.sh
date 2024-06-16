#!/bin/bash
set -e

# Ensure the system is updated and install necessary packages
sudo apt-get -y update
sudo apt-get -y install ufw

# Configure ufw rules
sudo ufw disable  # Disable ufw before modifying rules
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp   # Allow SSH
sudo ufw allow 443/tcp  # Allow HTTPS
sudo ufw allow 80/tcp   # Allow HTTP

# Enable ufw with the new rules, automatically confirming the prompt
yes | sudo ufw enable

# Restart ufw to apply changes (this is optional)
sudo systemctl restart ufw
