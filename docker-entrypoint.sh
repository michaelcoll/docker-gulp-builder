#! /bin/bash

set -e

npm install && bower install --allow-root --config.interactive=false
gulp "$@"
