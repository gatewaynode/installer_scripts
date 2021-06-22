#!/usr/bin/env bash
#
#  From:
#    https://strapi.io/documentation/developer-docs/latest/getting-started/quick-start.html#_1-install-strapi-and-create-a-new-project
#

# Install nodejs (from: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt update

sudo apt install nodejs

# Safely fix the global npm_modules issue
mkdir -v  -p ~/.npm

# This will have to be done a different way
# echo "npm set prefix ~/.npm" | tee -a ~/.bashrc
# NOTE: Shell expansion happens here
# echo "PATH=\"$HOME/.npm/bin:$PATH\"" | tee -a ~/.bashrc
# echo "PATH=\"./node_modules/.bin:$PATH\"" | tee -a ~/.bashrc
# NOTE: This call to source doesn't work from outside the subshell context
# source ~/.bashrc

npm set prefix ~/.npm
export PATH="$HOME/.npm/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

# Install Yarn (https://yarnpkg.com/getting-started/install)

npm install -g yarn

# Install the backstage app
yarn create strapi-app strapi-cms --quickstart

# Manually set admin user http://strapi.local:1337/admin
