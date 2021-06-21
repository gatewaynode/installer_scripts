#!/usr/bin/env bash
#
# Install backstage:
#   https://backstage.io/docs/getting-started/
#

# Install nodejs (from: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt update

sudo apt install nodejs

# Install Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update

sudo apt install yarn

# Install the backstage app
npx @backstage/create-app

# Hack to get around file watcher insanity
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Run the app on the default port 7000
cd my-backstage-app
sed -i 's/http\:\/\/localhost\:3000/http\:\/\/backstage.local\:3000/g' app-config.yaml
sed -i 's/http\:\/\/localhost\:7000/http\:\/\/backstage.local\:7000/g' app-config.yaml
yarn dev
