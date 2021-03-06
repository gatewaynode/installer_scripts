#!/usr/bin/env bash
#
# WARNING! This is a dev server install, configuration and startup.
# !!!NOT SUITABLE FOR PRODUCTION!!!
# !!!HONESTLY NOT SUITABLE FOR ANYTHING RIGHT NOW, ALLOCATES ROGUE VARIABLES AND CRASHES!!!
#
# Install Hashicorp Vault for managing secrets
#
# Derived from:
#   https://learn.hashicorp.com/tutorials/vault/getting-started-install
#

set -o errexit
set -o nounset
set -o pipefail

# Install the Hashicorp key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add the repository to the sources.list
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update the apt index and install the vault package
sudo apt update
sudo apt install -y vault

# Start the dev server in a separate process
echo "Launching dev server in separate process:"
nohup vault server -dev &
jobs -l

# Set our network name resolution
# sudo echo "127.0.0.1	vault.local" >> /etc/hosts
# NOT WORKING YET, sudo doesn't stick through the addending redirect

# Set our API address listener
declare -gr VAULT_ADDR='http://vault.local:8200'

# Parse nohup.out for root token and set that in our DEV server
declare -gr VAULT_TOKEN=`cat nohup.out | tail -12 | grep "^Root Token:.*$" | sed 's/^Root Token\: //g'`
