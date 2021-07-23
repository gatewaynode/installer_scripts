#!/usr/bin/env bash

# sudo apt update
# sudo apt upgrade -y
# sudo shutdown -r now

# Install Nginx
sudo apt install -y nginx

sudo systemctl start nginx
sudo systemctl enable nginx

# Install the wekan Snap
sudo snap install wekan

# Set the serving port
sudo snap set wekan port='8888'

# Restart Mongo and Wekan
sudo systemctl restart snap.wekan.mongodb
sudo systemctl restart snap.wekan.wekan



