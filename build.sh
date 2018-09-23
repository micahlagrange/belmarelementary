#!/bin/bash

set -e

BUILD_DIR=./build

# Build the static site
bundle exec middleman build

# Copy the files to google bucket
cd ${BUILD_DIR}
gsutil cp ./* gs://belmiddleman
