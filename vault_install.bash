#!/usr/bin/env bash
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
