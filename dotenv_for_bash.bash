#!/usr/bin/env bash
#
# Found this clever little dotenv snippet that can be embedded in scripts: 
# https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-3267733i
#
# Basically a dotenv for bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

# Where .env should probably be prefixed with whatever script specific name you need 
# avoid collisions.  Such as:
#
# .
# ├── example.bash
# ├── .example.env
# └── EXAMPLE.example.env
#
# Then modify the snippet to replace the 2 occurances of .env with your actual .env name.
