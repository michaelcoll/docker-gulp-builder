#! /bin/bash

set -e

if [ "$1" = 'gulp' ]; then
    npm install && bower install --allow-root --config.interactive=false
    gulp "$@"
else
    exec "$@"
fi
