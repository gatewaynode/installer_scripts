#!/usr/bin/env bash
#
# Install Jenkins CI LTS
#
# Taken from:
#   https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04
# Confirmed against:
#   https://www.jenkins.io/doc/book/installing/linux/

set -o errexit
set -o nounset
set -o pipefail

# Get the apt key for jenkins.io
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# Add the repo to sources.list
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package index
sudo apt update

# Install openjdk 11, may not be installed by the Jenkins .deb file but is a required dependency
sudo apt install -y openjdk-11-jdk

# Apt install jenkins
sudo apt install -y jenkins
