#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y squid

sudo cp /etc/squid/squid.conf /etc/squid/orig-squid.conf

