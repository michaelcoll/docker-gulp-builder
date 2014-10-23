#! /bin/bash

set -e

if [ "$1" = 'build' ]; then
  npm install && bower install --allow-root
  gulp build
else
  exec "$@"
fi
