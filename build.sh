#!/bin/bash

set -e

rb () {
  bundle exec $@
}

BUILD_DIR=./build

# Bundle install
bundle install
# Build the static site
rb middleman build

# Copy the files to google bucket
cd ${BUILD_DIR}
gsutil -m cp -r ./* gs://belmiddleman
