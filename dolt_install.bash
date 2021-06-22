#!/usr/bin/env bash
#
# Install DoltDB (Git and MySQL's bastard child)
#
# Derived from:
#   https://github.com/dolthub/dolt/blob/master/README.md
#

set -o errexit
set -o nounset
set -o pipefail

# Download an run the installer script
sudo bash -c 'curl -L https://github.com/dolthub/dolt/releases/latest/download/install.sh | bash'

# Verify
# if (dolt help); then
# 	echo "Dolt installed"
# else
# 	echo "Dolt install failed exiting"
# 	exit 1
# fi

# Configure dolt like git
dolt config --global --add user.email 44749714+gatewaynode@users.noreply.github.com
dolt config --global --add user.name "gatewaynode"


