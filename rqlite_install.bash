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

# Download the binary and install
curl -L https://github.com/rqlite/rqlite/releases/download/v6.0.0/rqlite-v6.0.0-linux-amd64.tar.gz -o rqlite-v6.0.0-linux-amd64.tar.gz
tar xvfz rqlite-v6.0.0-linux-amd64.tar.gz
sudo ln -s  $PWD/rqlite-v6.0.0-linux-amd64/rqlite /usr/local/bin/rqlite
sudo ln -s  $PWD/rqlite-v6.0.0-linux-amd64/rqlited /usr/local/bin/rqlited
sudo ln -s  $PWD/rqlite-v6.0.0-linux-amd64/rqbench /usr/local/bin/rqbench
