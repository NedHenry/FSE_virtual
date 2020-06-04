#!/bin/bash

echo "starting webpack dev" && export NODE_OPTIONS="--max_old_space_size=4096" && yarn && rm -rf /fse_virtual/public/packs && /fse_virtual/bin/webpack-dev-server
