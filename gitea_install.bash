#!/usr/bin/env bash

# Switch to root through for the whole


# Create our Gitea user
adduser \
  --system \
  --shell /bin/bash \
  --gecos 'Git Version Control' \
  --group
  --disabled-password \ 
  --homw /home/git \
  git

# Create our working directories
mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
# This is the temporary install permissions, should be locked down after install
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

# Install postgres
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service

# Create our database
sudo 